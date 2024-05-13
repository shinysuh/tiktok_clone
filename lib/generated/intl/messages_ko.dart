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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("이미 계정이 있으신가요?"),
        "commentCount": m0,
        "commentLikeCount": m1,
        "commentTitle": m2,
        "continueWithApple": MessageLookupByLibrary.simpleMessage("애플 계정"),
        "continueWithGithub": MessageLookupByLibrary.simpleMessage("깃허브 계정"),
        "continueWithGoogle": MessageLookupByLibrary.simpleMessage("구글 계정"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("아직 계정이 없으신가요?"),
        "likeCount": m3,
        "logIn": m4,
        "logInToTiktok": m5,
        "loginSubTitle":
            MessageLookupByLibrary.simpleMessage("계정 관리, 알림 확인, 동영상에 댓글 달기 등."),
        "share": MessageLookupByLibrary.simpleMessage("공유"),
        "signUp": MessageLookupByLibrary.simpleMessage("회원가입"),
        "signUpSubtitle": m6,
        "signUpTitle": m7,
        "signUpTitleWithDateTime": m8,
        "useEmailPassword": MessageLookupByLibrary.simpleMessage("이메일/비밀번호")
      };
}
