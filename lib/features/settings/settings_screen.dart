import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/utils/navigator_redirection.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onChangeNotifications(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  void _cancelLogOut() {
    Navigator.of(context).pop();
  }

  void _logOut() {
    // TODO - 로그아웃 기능 여기 구현

    redirectToScreenAndRemovePreviousRoutes(
      context: context,
      targetScreen: const SignUpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      body: ListView(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     CupertinoSwitch(
          //       value: _notifications,
          //       onChanged: _onChangeNotifications,
          //       activeColor: const Color(0xff75B1DF),
          //     ),
          //     Switch(
          //       value: _notifications,
          //       onChanged: _onChangeNotifications,
          //       activeColor: Colors.deepPurple,
          //       activeThumbImage: const AssetImage('assets/images/1.jpeg'),
          //     ),
          //     // Switch.adaptive 형태 => iOS (CupertinoSwitch) / 다른 플랫폼 (기본 switch)
          //     Switch.adaptive(
          //       value: _notifications,
          //       onChanged: _onChangeNotifications,
          //       activeColor: Colors.red,
          //       activeThumbImage: const AssetImage('assets/images/1.jpeg'),
          //     ),
          //     Checkbox(
          //       value: _notifications,
          //       onChanged: _onChangeNotifications,
          //       checkColor: Colors.white,
          //       activeColor: const Color(0xffE694B0),
          //     ),
          //   ],
          // ),
          // CheckboxListTile(
          //   value: _notifications,
          //   onChanged: _onChangeNotifications,
          //   title: const Text('Enable Notifications'),
          //   checkColor: Colors.white,
          //   activeColor: const Color(0xffFA8857),
          // ),
          // SwitchListTile(
          //   value: _notifications,
          //   onChanged: _onChangeNotifications,
          //   title: const Text('Enable Notifications'),
          //   activeColor: const Color(0xff267428),
          //   activeThumbImage: const AssetImage('assets/images/1.jpeg'),
          // ),
          // // SwitchListTile.adaptive => 마찬가지로 플랫폼 별 UI 형태 다름
          SwitchListTile.adaptive(
            value: _notifications,
            onChanged: _onChangeNotifications,
            title: const Text('Enable Notifications'),
            activeColor: Theme.of(context).primaryColor,
            // activeThumbImage: const AssetImage('assets/images/1.jpeg'),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2030, DateTime.december, 30),
              );
              // print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              // print(time);
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1990),
                lastDate: DateTime(2030, DateTime.december, 30),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              // print(booking);
            },
            title: const Text('When is your birthday?'),
          ),
          ListTile(
            title: const Text(
              'Log Out (iOS)',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Please confirm'),
                actions: [
                  CupertinoDialogAction(
                    onPressed: _cancelLogOut,
                    child: const Text("No"),
                  ),
                  CupertinoDialogAction(
                    onPressed: _logOut,
                    isDestructiveAction: true,
                    child: const Text("Yes"),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Log Out (Android)',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const FaIcon(FontAwesomeIcons.faceSadTear),
                title: const Text(
                  'Are you sure?',
                  textAlign: TextAlign.left,
                ),
                content: const Text('Please confirm'),
                actions: [
                  TextButton(
                    onPressed: _cancelLogOut,
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: _logOut,
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Log Out (iOS / Bottom Dialog)',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Please confirm'),
                actions: [
                  CupertinoDialogAction(
                    onPressed: _cancelLogOut,
                    child: const Text("No"),
                  ),
                  CupertinoDialogAction(
                    onPressed: _logOut,
                    isDestructiveAction: true,
                    child: const Text("Yes"),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Log Out (iOS / Bottom Action Sheet)',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: const Text(
                  'Are you sure?',
                ),
                message: const Text('Please confirm'),
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: _cancelLogOut,
                    isDefaultAction: true,
                    child: const Text('No'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: _logOut,
                    isDestructiveAction: true,
                    child: const Text('Yes'),
                  ),
                ],
              ),
            ),
          ),
          const AboutListTile(
            // AboutListTile : ListTile -> onTap -> showAboutDialog() 자동 적용된 것
            applicationVersion: 'version 2.0',
          ),
        ],
      ),

      // Column(
      //   children: [
      //     CupertinoActivityIndicator(
      //       radius: 40,
      //       // animating: false,
      //     ),
      //     CircularProgressIndicator(),
      //     /* CircularProgressIndicator.adaptive => 현재 플랫폼에 따라 위 indecators 둘 중 하나의 형태로 출력 */
      //     CircularProgressIndicator.adaptive(),
      //   ],
      // )

      /* ListWheelScrollView => 원통형 스크롤 위젯 */
      // ListWheelScrollView(
      //   itemExtent: 200,
      //   diameterRatio: 1.3,
      //   offAxisFraction: -0.5,
      //   // useMagnifier: true,
      //   // magnification: 1.5,
      //   children: [
      //     for (var x in [1, 2, 3, 5, 5, 6, 2, 2, 43, 53, 6, 5, 353, 434, 234])
      //       FractionallySizedBox(
      //         widthFactor: 1,
      //         child: Container(
      //           color: Colors.teal,
      //           alignment: Alignment.center,
      //           child: const Text(
      //             'Pick me!',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: Sizes.size36,
      //             ),
      //           ),
      //         ),
      //       )
      //   ],
      // ),
    );
  }
}