part of 'fetch_bloc.dart';

abstract class FetchEvent {}

final class DataFetchEvent extends FetchEvent {}

final class AddedToFav extends FetchEvent {
 final int index;

  AddedToFav({required this.index});
}
