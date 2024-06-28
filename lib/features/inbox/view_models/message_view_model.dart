import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/inbox/models/chatroom_model.dart';
import 'package:tiktok_clone/features/inbox/models/message_model.dart';
import 'package:tiktok_clone/features/inbox/repositories/message_repository.dart';
import 'package:tiktok_clone/utils/base_exception_handler.dart';

class MessageViewModel extends FamilyAsyncNotifier<void, String> {
  late final MessageRepository _messageRepository;
  late final AuthenticationRepository _authRepository;
  late final String _chatroomId;

  @override
  FutureOr<void> build(String arg) {
    _chatroomId = arg;
    _messageRepository = ref.read(messageRepository);
    _authRepository = ref.read(authRepository);
  }

  Future<void> sendMessage(BuildContext context, String text) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      _checkLoginUser(context);
      final user = _authRepository.user;
      // final user = ref.read(authRepository).user;

      final message = MessageModel(
        text: text,
        userId: user!.uid,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      // TODO - chatroomId 동적 적용 필요
      _messageRepository.sendMessage(message, _chatroomId);

      if (state.hasError) {
        if (context.mounted) showFirebaseErrorSnack(context, state.error);
      }
    });
  }

  bool isMine(BuildContext context, String senderId) {
    _checkLoginUser(context);
    final user = _authRepository.user;
    return senderId == user!.uid;
  }

  void _checkLoginUser(BuildContext context) {
    if (!_authRepository.isLoggedIn) {
      showSessionErrorSnack(context);
    }
  }
}

final messageProvider =
    AsyncNotifierProvider.family<MessageViewModel, void, String>(
  () => MessageViewModel(),
);

// Stream 은 변화가 바로 반영됨 (watch)
// autoDispose => 채팅방을 떠나면 dispose 됨 (resources can be released when no longer needed)
final chatProvider = StreamProvider.autoDispose
    .family<List<MessageModel>, String>((ref, chatroomId) {
  final database = FirebaseFirestore.instance;
  return database
      .collection(MessageRepository.chatroomCollection)
      .doc(chatroomId)
      .collection(MessageRepository.textCollection)
      .orderBy('createdAt')
      .snapshots() // snapshot 은 스트림을 리턴함
      .map(
        (event) => event.docs
            .map(
              (doc) => MessageModel.fromJson(doc.data()),
            )
            .toList()
            .reversed
            .toList(),
      );
});