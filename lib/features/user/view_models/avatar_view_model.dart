import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repositories/authentication_repository.dart';
import 'package:tiktok_clone/features/user/models/user_profile_model.dart';
import 'package:tiktok_clone/features/user/repository/user_repository.dart';
import 'package:tiktok_clone/features/user/view_models/user_view_model.dart';

class AvatarViewModel extends AsyncNotifier<void> {
  static const String avatarStoragePath = 'avatars';

  late final UserRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(userRepository);
  }

  Future<void> uploadAvatar(File file, UserProfileModel profile) async {
    state = const AsyncValue.loading();

    final fileName = ref.read(authRepository).user!.uid;
    state = await AsyncValue.guard(() async {
      await _repository.uploadAvatar(file, fileName);
      await ref.read(userProvider.notifier).onAvatarUploaded(profile);
    });
  }

  Future<void> deleteAvatar(UserProfileModel profile) async {
    state = const AsyncValue.loading();

    final fileName = ref.read(authRepository).user!.uid;
    state = await AsyncValue.guard(() async {
      await _repository.deleteAvatar(fileName);
      await ref.read(userProvider.notifier).onAvatarDeleted(profile);
    });
  }
}

final avatarProvider = AsyncNotifierProvider<AvatarViewModel, void>(
  () => AvatarViewModel(),
);