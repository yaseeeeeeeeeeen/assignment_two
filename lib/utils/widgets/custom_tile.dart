import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implause_assignment/blocs/fetch/fetch_bloc.dart';
import 'package:implause_assignment/models/issues_model.dart';
import 'package:implause_assignment/utils/styles/colors.dart';
import 'package:intl/intl.dart';

class CustomTile extends StatelessWidget {
  CustomTile({super.key, required this.data, required this.index});
  final GitIssues data;
  final int index;
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    DateTime myDate = data.updatedAt;
    String formattedDate = DateFormat('MM-dd-yyyy').format(myDate);
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ListTile(
                  trailing: const SizedBox(width: 20),
                  leading: CircleAvatar(
                    radius: 27,
                    backgroundColor: AppColors.appbarColor,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(data.user.avatarUrl),
                    ),
                  ),
                  title: Text(data.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(data.user.login), Text(formattedDate)],
                  )),
              Positioned(
                  right: 5,
                  child: BlocConsumer<FetchBloc, FetchState>(
                    buildWhen: (previous, current) => current is AddToFav,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AddToFav) {
                        if (state.index == index) {
                          fav = true;
                        }
                      }
                      return IconButton(
                          onPressed: () {
                            context
                                .read<FetchBloc>()
                                .add(AddedToFav(index: index));
                          },
                          icon: Icon(Icons.star,
                              color: fav
                                  ? AppColors.favIconColor
                                  : AppColors.iconWithoutSelect));
                    },
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Text(data.body.toString().length < 200
                  ? data.body.toString()
                  : data.body.toString().substring(0, 200)))
        ],
      ),
    );
  }
}
