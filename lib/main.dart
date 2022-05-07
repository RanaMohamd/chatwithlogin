// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petshelt/info_shelters_screens/info_ui.dart';
import 'package:petshelt/login_screen/loginScreen.dart';
import 'package:petshelt/signup_screen/signupScreen.dart';
import 'package:petshelt/splash_screen.dart';
import 'info_shelters_screens/shelters_ui.dart';
import 'package:petshelt/Chats.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet\$helt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(color: Color(0xFF76BDB2), centerTitle: true)),
      // home: loginScreen(),
      routes: {
        Chats.routeName:(buildContext)=>Chats(),
        splashScreen.routeName: (buildContext) => splashScreen(),
        loginScreen.routeName: (buildContext) => loginScreen(),
        SignUpScreen.routeName: (buildContext) => SignUpScreen(),
        infoScreen.routeName: (buildContext) => infoScreen(),
        sheltersScreen.routeName: (buildContext) => sheltersScreen(),
      },
      initialRoute: splashScreen.routeName,
    );
  }
}
