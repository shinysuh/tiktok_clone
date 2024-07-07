import 'package:tiktok_clone/features/inbox/models/chatter_model.dart';

class ChatPartnerModel {
  final String chatroomId;
  final ChatterModel chatPartner;
  final int updatedAt;
  final int showMsgFrom;

  ChatPartnerModel({
    required this.chatroomId,
    required this.chatPartner,
    required this.updatedAt,
    required this.showMsgFrom,
  });

  ChatPartnerModel.fromJson(Map<String, dynamic> json)
      : chatroomId = json['chatroomId'],
        chatPartner = ChatterModel.fromJson(json['chatPartner']),
        updatedAt = json['updatedAt'],
        showMsgFrom = json['showMsgFrom'] ?? 0;
}
