import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:implause_assignment/data/api_services.dart';
import 'package:implause_assignment/data/api_urls.dart';
import 'package:implause_assignment/models/issues_model.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  late List<GitIssues> data;
  FetchBloc() : super(FetchInitial()) {
    on<DataFetchEvent>(dataFetchEvent);
    on<AddedToFav>(addedToFav);
  }

  FutureOr<void> dataFetchEvent(
      DataFetchEvent event, Emitter<FetchState> emit) async {
    emit(LoadingState());
    final response = await ApiServices.getDatas(ApiUrl.dataGetUrl);
    print(response.body);
    if (response.statusCode == 200) {
      data = gitIssuesFromJson(response.body);
      print(data.length);
      emit(DataFetchedState(response: data));
    } else {
      emit(DataFetchFailedState());
    }
  }

  FutureOr<void> addedToFav(AddedToFav event, Emitter<FetchState> emit) async {
    emit(AddToFav(index: event.index));
    emit(DataFetchedState(response: data));
  }
}
