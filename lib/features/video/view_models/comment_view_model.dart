import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/user/models/user_profile_model.dart';
import 'package:tiktok_clone/features/video/models/comment_model.dart';
import 'package:tiktok_clone/features/video/repositories/comment_repository.dart';
import 'package:tiktok_clone/features/video/repositories/video_repository.dart';
import 'package:tiktok_clone/utils/base_exception_handler.dart';

class CommentViewModel extends FamilyAsyncNotifier<void, String> {
  late final CommentRepository _commentRepository;
  late final AuthenticationRepository _authRepository;

  late final User? _user;
  late final String _videoId;

  @override
  FutureOr<void> build(String arg) {
    _videoId = arg;
    _commentRepository = ref.read(commentRepository);
    _authRepository = ref.read(authRepository);
    _user = _authRepository.user;
  }

  // 댓글 업로드
  Future<void> saveComment({
    required BuildContext context,
    required UserProfileModel user,
    required String comment,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (!_checkLoginUser(context)) return;
      if (_user!.uid != user.uid) return;

      final now = DateTime.now().millisecondsSinceEpoch;
      await _commentRepository.saveComment(
        CommentModel(
          videoId: _videoId,
          text: comment,
          userId: user.uid,
          username: user.username,
          likes: 0,
          createdAt: now,
          updatedAt: now,
        ),
      );
    });

    if (state.hasError) {
      if (context.mounted) showFirebaseErrorSnack(context, state.error);
    }
  }

  // 댓글 수정
  Future<void> updateComment(
    BuildContext context,
    CommentModel comment,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (!_checkLoginUser(context)) return;
      // 본인이 쓴 댓글인지 확인
      if (_isMyComment(comment.userId)) return;
      // 수정
      await _commentRepository.updateComment(
        comment.copyWith(
          updatedAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    });
  }

  // 댓글 삭제
  Future<void> deleteComment(
    BuildContext context,
    CommentModel comment,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (!_checkLoginUser(context)) return;
      // 본인이 쓴 댓글인지 확인
      if (_isMyComment(comment.userId)) return;
      // 삭제
      await _commentRepository.deleteComment(comment);
    });
  }

  // 본인이 쓴 댓글인지 확인
  bool _isMyComment(String commenterId) {
    return _user!.uid != commenterId;
  }

  // 로그인 여부 체크
  bool _checkLoginUser(BuildContext context) {
    final isLoggedIn = _authRepository.isLoggedIn;
    if (!isLoggedIn) {
      showSessionErrorSnack(context);
    }
    return isLoggedIn;
  }
}

final commentProvider =
    AsyncNotifierProvider.family<CommentViewModel, void, String>(
  () => CommentViewModel(),
);

final commentListProvider = StreamProvider.autoDispose
    .family<List<CommentModel>, String>((ref, videoId) {
  return FirebaseFirestore.instance
      .collection(VideoRepository.videoCollection)
      .doc(videoId)
      .collection(CommentRepository.commentCollection)
      .orderBy('createdAt', descending: false)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            var commentId = doc.id;
            return CommentModel.fromJson({
              'videoId': doc.data()['videoId'],
              'commentId': commentId,
              'userId': doc.data()['userId'],
              'username': doc.data()['username'],
              'text': doc.data()['text'],
              'likes': doc.data()['likes'],
              'createdAt': doc.data()['createdAt'],
              'updatedAt': doc.data()['updatedAt']
            });
          }).toList());
});
