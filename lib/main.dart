import 'package:app/views/auth/auth/auth_provider.dart';
import 'package:app/views/auth/auth/auth_screen.dart';
import 'package:app/views/home/home_provider.dart';
import 'package:app/views/home/home_screen.dart';
import 'package:app/views/signup/signup/signup_provider.dart';
import 'package:app/views/signup/signup/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBcCgU-BzDy6IXK61VfpDCB5Z4Kwz5PLnY",
            appId: "1:72555826597:web:2f657dc053c2b55c456c4c",
            messagingSenderId: "72555826597",
            projectId: "ensinamentos-6282f",
            databaseURL:
                "https://ensinamentos-6282f-default-rtdb.firebaseio.com/"));
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(
            create: (context) => SignupProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const AuthScreen(),
          "/signup": (context) => const SignupScreen(),
          "/home": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
