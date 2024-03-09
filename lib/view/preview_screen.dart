import 'package:flutter/material.dart';
import 'package:implause_assignment/models/issues_model.dart';
import 'package:implause_assignment/utils/styles/colors.dart';
import 'package:implause_assignment/utils/styles/textstyles.dart';
import 'package:implause_assignment/utils/widgets/custom_tile.dart';

class PreviewProblem extends StatelessWidget {
  const PreviewProblem({super.key, required this.data});
  final GitIssues data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(title: const Text("Issue Preview")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            CustomTile(data: data, index: data.id),
            const SizedBox(height: 10),
            Text("Comments", style: AppTextStyles.appbarTextStyle),
            const SizedBox(height: 10),
            data.labels.isEmpty
                ? Center(
                    child: Text("No Comments In This Issue",
                        style: AppTextStyles.dataNotFound))
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: AppColors.borderColor),
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: AppColors.white,
                          title: Text(data.labels[index].description));
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: data.labels.length),
          ],
        ),
      ),
    );
  }
}
