import 'package:flutter/material.dart';
import 'package:flutterblog/app/landing_page.dart';
import 'package:flutterblog/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        title: 'Flutter Blog',
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}