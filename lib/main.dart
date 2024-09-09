import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/gita_provider.dart';
import 'Views/detail_screen.dart';
import 'Views/home_screen.dart';
import 'Views/splash_screen.dart';

void main()
{
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> GitaProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context)=> SplashScreen(),
           '/home': (context)=> HomeScreen(),
          '/detail': (context)=> DetailScreen(),
          //'/': (context)=> DetailScreen(),
        }
      ),
    );
  }
}
