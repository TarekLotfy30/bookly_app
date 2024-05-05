import 'package:bookly/features/splash/ui/screen/splash_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff100B20),
        textTheme: GoogleFonts.allertaTextTheme(ThemeData.dark().textTheme),
      ),
      home: const SplashViewScreen(),
    );
  }
}
