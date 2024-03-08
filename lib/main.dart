import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implause_assignment/blocs/fetch/fetch_bloc.dart';
import 'package:implause_assignment/utils/styles/colors.dart';
import 'package:implause_assignment/utils/styles/textstyles.dart';
import 'package:implause_assignment/view/favorite_screen.dart';
import 'package:implause_assignment/view/home_screen.dart';
import 'package:implause_assignment/view/spash_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => FetchBloc(),
      child: const GitIssuesApp(),
    ),
  );
}

class GitIssuesApp extends StatelessWidget {
  const GitIssuesApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/FavRepos": (context) => const FavoriteRepos(),
        "/ToHome": (context) => HomeScreen(),
      },
      theme: ThemeData(
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.appbarColor,
          centerTitle: true,
          titleTextStyle: AppTextStyles.appbarTextStyle,
        ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
