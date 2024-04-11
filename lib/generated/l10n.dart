// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up for {nameOfTheApp}`
  String signUpTitle(String nameOfTheApp) {
    return Intl.message(
      'Sign Up for $nameOfTheApp',
      name: 'signUpTitle',
      desc: 'The title people see when they open the app for the first time.',
      args: [nameOfTheApp],
    );
  }

  /// `Sign Up for {nameOfTheApp} {when}`
  String signUpTitleWithDateTime(String nameOfTheApp, DateTime when) {
    final DateFormat whenDateFormat =
        DateFormat('y / QQQ / LLLL 😆', Intl.getCurrentLocale());
    final String whenString = whenDateFormat.format(when);

    return Intl.message(
      'Sign Up for $nameOfTheApp $whenString',
      name: 'signUpTitleWithDateTime',
      desc: 'The title people see when they open the app for the first time.',
      args: [nameOfTheApp, whenString],
    );
  }

  /// `Create a profile, follow other accounts, make your own {videoCount, plural, =0{no videos} =1{video} other{videos}}, and more.`
  String signUpSubtitle(num videoCount) {
    return Intl.message(
      'Create a profile, follow other accounts, make your own ${Intl.plural(videoCount, zero: 'no videos', one: 'video', other: 'videos')}, and more.',
      name: 'signUpSubtitle',
      desc: '',
      args: [videoCount],
    );
  }

  /// `Use email & password`
  String get useEmailPassword {
    return Intl.message(
      'Use email & password',
      name: 'useEmailPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue with apple`
  String get continueWithApple {
    return Intl.message(
      'Continue with apple',
      name: 'continueWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in {gender, select, male{Sir} female{Madam} other{Human}}`
  String logIn(String gender) {
    return Intl.message(
      'Log in ${Intl.gender(gender, male: 'Sir', female: 'Madam', other: 'Human')}',
      name: 'logIn',
      desc: '',
      args: [gender],
    );
  }

  /// `Log in to {nameOfTheApp}`
  String logInToTiktok(Object nameOfTheApp) {
    return Intl.message(
      'Log in to $nameOfTheApp',
      name: 'logInToTiktok',
      desc: '',
      args: [nameOfTheApp],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Manage your account, check notifications, comment on videos, and more.`
  String get loginSubTitle {
    return Intl.message(
      'Manage your account, check notifications, comment on videos, and more.',
      name: 'loginSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `{value}`
  String likeCount(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'likeCount',
      desc: 'like count',
      args: [valueString],
    );
  }

  /// `{value}`
  String commentCount(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'commentCount',
      desc: 'comment count',
      args: [valueString],
    );
  }

  /// `share`
  String get share {
    return Intl.message(
      'share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `{value} {value2, plural, =1{comment} other{comments}}`
  String commentTitle(int value, num value2) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString ${Intl.plural(value2, one: 'comment', other: 'comments')}',
      name: 'commentTitle',
      desc: 'comment counts on comment dialog',
      args: [valueString, value2],
    );
  }

  /// `{value}`
  String commentLikeCount(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString',
      name: 'commentLikeCount',
      desc: 'comment like count',
      args: [valueString],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}