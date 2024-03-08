import 'package:flutter/material.dart';
import 'package:implause_assignment/utils/styles/colors.dart';
import 'package:implause_assignment/view/favorite_screen.dart';
import 'package:implause_assignment/view/home_screen.dart';

void main() {
  runApp(const GitIssuesApp());
}

class GitIssuesApp extends StatelessWidget {
  const GitIssuesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/FavRepos":(context) => const FavoriteRepos()
      },
      theme: ThemeData(
          fontFamily: "Poppins",
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.appbarColor, centerTitle: true)),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
