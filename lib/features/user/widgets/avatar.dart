import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/user/models/user_profile_model.dart';
import 'package:tiktok_clone/features/user/view_models/avatar_view_model.dart';

class Avatar extends ConsumerWidget {
  final bool isVertical;
  final UserProfileModel user;

  const Avatar({
    super.key,
    required this.isVertical,
    required this.user,
  });

  Future<void> _onTapAvatar(WidgetRef ref) async {
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 300,
      maxWidth: 300,
    );

    if (xFile != null) {
      final file = File(xFile.path);
      await ref.read(avatarProvider.notifier).uploadAvatar(file, user);
    }
  }

  String _getFileLocation() {
    return 'https://firebasestorage.googleapis.com/v0/b/tiktok-clone-jenn.appspot.com/o/avatars%2F${user.uid}?alt=media&token=74240f15-3f4d-4f81-9cf0-577b153413c0';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isLoading = ref.watch(avatarProvider).isLoading;
    print(user.hasAvatar);

    return GestureDetector(
      onTap: isLoading ? () {} : () => _onTapAvatar(ref),
      child: isLoading
          ? Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const CircularProgressIndicator.adaptive(),
            )
          : CircleAvatar(
              radius: isVertical ? Sizes.size48 + Sizes.size2 : Sizes.size64,
              foregroundColor: Colors.indigo,
              foregroundImage:
                  user.hasAvatar ? NetworkImage(_getFileLocation()) : null,
              child: Text(user.name),
            ),
    );
  }
}
