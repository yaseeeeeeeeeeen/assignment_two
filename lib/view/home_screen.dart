import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implause_assignment/blocs/fetch/fetch_bloc.dart';
import 'package:implause_assignment/utils/styles/colors.dart';
import 'package:implause_assignment/utils/styles/textstyles.dart';
import 'package:implause_assignment/utils/widgets/custom_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    dataFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: const Text("Git Track"),
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
        child: BlocBuilder<FetchBloc, FetchState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                  child:
                      CircularProgressIndicator(color: AppColors.appbarColor));
            } else if (state is DataFetchedState) {
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) =>
                      CustomTile(data: state.response[index],index: index),
                  itemCount: state.response.length);
            }
            return Center(
                child:
                    Text("Data Not Found", style: AppTextStyles.dataNotFound));
          },
        ),
      ),
    );
  }

  dataFetch() async {
    context.read<FetchBloc>().add(DataFetchEvent());
  }
}
