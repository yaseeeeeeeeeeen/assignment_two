part of 'fetch_bloc.dart';

abstract class FetchState {}

final class FetchInitial extends FetchState {}

final class LoadingState extends FetchState {}

final class DataFetchedState extends FetchState {
  final List<GitIssues> response;

  DataFetchedState({required this.response});
}

final class DataFetchFailedState extends FetchState {}

final class AddToFav extends FetchState {
  final int index;

  AddToFav({required this.index});
}

final class FailedFav extends FetchState {}
