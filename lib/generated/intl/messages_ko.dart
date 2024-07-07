// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static String m0(value) => "${value}";

  static String m1(value) => "${value}";

  static String m2(value, value2) => "댓글 ${value}개";

  static String m3(value) => "${value}";

  static String m4(gender) => "로그인";

  static String m5(nameOfTheApp) => "${nameOfTheApp}에 로그인하세요";

  static String m6(videoCount) => "프로필 생성, 다른 계정 팔로우, 나만의 비디오 만들기 등.";

  static String m7(nameOfTheApp) => "${nameOfTheApp}에 가입하세요";

  static String m8(nameOfTheApp, when) => "Sign Up for ${nameOfTheApp} ${when}";

  static String m9(username) => "${username} 님이 채팅방을 나갔습니다.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("이미 계정이 있으신가요?"),
        "chooseAProfile": MessageLookupByLibrary.simpleMessage("프로필 선택"),
        "chooseYourInterests":
            MessageLookupByLibrary.simpleMessage("Choose your interests"),
        "commentCount": m0,
        "commentLikeCount": m1,
        "commentTitle": m2,
        "continueWithApple": MessageLookupByLibrary.simpleMessage("애플 계정"),
        "continueWithGithub": MessageLookupByLibrary.simpleMessage("깃허브 계정"),
        "continueWithGoogle": MessageLookupByLibrary.simpleMessage("구글 계정"),
        "conversationNotStarted":
            MessageLookupByLibrary.simpleMessage("대화가 시작되지 않았습니다"),
        "description": MessageLookupByLibrary.simpleMessage("상세 정보"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("아직 계정이 없으신가요?"),
        "editProfile": MessageLookupByLibrary.simpleMessage("프로필 수정"),
        "enterVideoTitle":
            MessageLookupByLibrary.simpleMessage("비디오 제목을 입력해 주세요."),
        "exit": MessageLookupByLibrary.simpleMessage("나가기"),
        "exitChatroom": MessageLookupByLibrary.simpleMessage("채팅방 나가기"),
        "hourMinuteAPM": MessageLookupByLibrary.simpleMessage("h:ma"),
        "likeCount": m3,
        "logIn": m4,
        "logInToTiktok": m5,
        "loginSubTitle":
            MessageLookupByLibrary.simpleMessage("계정 관리, 알림 확인, 동영상에 댓글 달기 등."),
        "monthDate": MessageLookupByLibrary.simpleMessage("M월 d일"),
        "save": MessageLookupByLibrary.simpleMessage("저장"),
        "selectAProfileToStartAConversation":
            MessageLookupByLibrary.simpleMessage("대화를 시작할 상대의 프로필을 선택하세요"),
        "setTheVideoTitle":
            MessageLookupByLibrary.simpleMessage("비디오 제목을 입력한 후 업로드 해 주세요."),
        "share": MessageLookupByLibrary.simpleMessage("공유"),
        "signUp": MessageLookupByLibrary.simpleMessage("회원가입"),
        "signUpSubtitle": m6,
        "signUpTitle": m7,
        "signUpTitleWithDateTime": m8,
        "title": MessageLookupByLibrary.simpleMessage("제목"),
        "useEmailPassword": MessageLookupByLibrary.simpleMessage("이메일/비밀번호"),
        "userHasLeftChatroom": m9,
        "videoDetail": MessageLookupByLibrary.simpleMessage("비디오 상세"),
        "yearMonthDate": MessageLookupByLibrary.simpleMessage("yyyy년 M월 d일")
      };
}
