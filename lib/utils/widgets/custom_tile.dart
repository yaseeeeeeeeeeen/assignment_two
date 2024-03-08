import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
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
              leading: CircleAvatar(radius: 25, backgroundColor: Colors.black),
              title: Text("Hot Reload Not Working"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Muhammed Yaseen"), Text("March-23-2024")],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(description.length < 200
                ? description
                : description.substring(0, 200)),
          )
        ],
      ),
    );
  }
}
