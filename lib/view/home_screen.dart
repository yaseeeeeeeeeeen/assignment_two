import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implause_assignment/blocs/bloc/fetch_bloc.dart';
import 'package:implause_assignment/utils/styles/colors.dart';
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
        child: BlocBuilder<FetchBloc, FetchState>(
          builder: (context, state) {
            if (state is LoadingState) {
              print("Loading State");
              return Center(
                  child:
                      CircularProgressIndicator(color: AppColors.appbarColor));
            } else if (state is DataFetchedState) {
              print(state.response.length);
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) => CustomTile(
                      description: state.response[index].body.toString()),
                  itemCount: state.response.length);
            }
            return Center(
                child: Text("Data Not Found",
                    style: TextStyle(
                        color: Colors.red.shade800,
                        fontWeight: FontWeight.w700)));
          },
        ),
      ),
    );
  }

  dataFetch() async {
    context.read<FetchBloc>().add(DataFetchEvent());
  }
}
