part of 'search_bloc.dart';

class SearchEvent {
  String query;
  List<FilterItems> filters;

  SearchEvent({this.query = "", this.filters = const []});
}

