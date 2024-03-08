import 'package:flutter/material.dart';
import 'package:implause_assignment/utils/styles/colors.dart';

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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.2),
              ),
              width: size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                      leading: CircleAvatar(
                          radius: 25, backgroundColor: Colors.black),
                      title: Text("Hot Reload Not Working"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Muhammed Yaseen"),
                          Text("March-23-2024")
                        ],
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Text(
                      "Donec elementum augue nec malesuada mattis. Proin eu arcu ut odio dictum vulputate non in diam. Aliquam vitae sem est. Nullam mattis lacus et ante pulvinar lobortis. Curabitur tristique id tortor vitae pharetra. Suspendisse ut est non metus volutpat."
                          .substring(0, 200),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
