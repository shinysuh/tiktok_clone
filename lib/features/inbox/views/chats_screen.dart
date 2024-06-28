import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/profile_images.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/view_models/chatroom_view_model.dart';
import 'package:tiktok_clone/features/inbox/views/chat_detail_screen.dart';
import 'package:tiktok_clone/features/user/models/user_profile_model.dart';
import 'package:tiktok_clone/utils/navigator_redirection.dart';
import 'package:tiktok_clone/utils/widgets/regulated_max_width.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  static const String routeName = 'chats';
  static const String routeURL = '/chats';

  const ChatsScreen({super.key});

  @override
  ConsumerState<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final Duration _duration = const Duration(milliseconds: 300);
  List<int> _items = [];

  void _addItem() {
    // chatroom create
    ref.read(chatroomProvider.notifier).createChatroom(
          context,
          UserProfileModel.empty().copyWith(
            uid: 'OoYZOnxDN5XfGvUxshnY394uhRq2',
            name: 'Jenna',
            username: 'Jenn92',
            hasAvatar: true,
          ),
        );

    _key.currentState?.insertItem(
      _items.length,
      duration: _duration,
    );
    _items.add(_items.length);
  }

  void _onDeleteItem(int index) {
    _key.currentState?.removeItem(
      index,
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: Container(
          color: Colors.red.shade300,
          child: _getListTile(index),
        ),
      ),
      duration: _duration,
    );
    _items.removeAt(index);
  }

  void _onTapChat(int index) {
    var tmpChatId = '$index';

    goToRouteNamed(
      context: context,
      routeName: ChatDetailScreen.routeName,
      params: {'chatId': tmpChatId},
    );
  }

  Widget _getListTile(int index) {
    return ListTile(
      onLongPress: () => _onDeleteItem(index),
      onTap: () => _onTapChat(index),
      leading: CircleAvatar(
        radius: Sizes.size28,
        foregroundImage: junheeImage,
        child: const Text('Jenna'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '쭌희 ($index)',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '2:16PM',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: Sizes.size12,
            ),
          ),
        ],
      ),
      subtitle: const Text(
        "This is message that has been sent from myself:)",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RegulatedMaxWidth(
      maxWidth: Breakpoints.sm,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: const Text('Direct messages'),
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const FaIcon(
                FontAwesomeIcons.plus,
              ),
            ),
          ],
        ),
        body: AnimatedList(
          key: _key,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              key: UniqueKey(),
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: _getListTile(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
