import 'package:flutter/material.dart';
import 'package:implause_assignment/utils/styles/colors.dart';
import 'package:implause_assignment/utils/widgets/custom_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Git Track",
          style: TextStyle(color: AppColors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/FavRepos");
              },
              icon: Icon(Icons.star, color: AppColors.favIconColor))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) => const CustomTile(
                description:
                    "Donec elementum augue nec malesuada mattis. Proin eu arcu ut odio dictum vulputate non in diam. Aliquam vitae sem est. Nullam mattis lacus et ante pulvinar lobortis. Curabitur tristique id tortor vitae pharetra. Suspendisse ut est non metus volutpat."),
            itemCount: 10),
      ),
    );
  }
}
