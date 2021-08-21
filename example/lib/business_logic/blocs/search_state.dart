part of 'search_bloc.dart';


class SearchState {
  List<Cheque> searchResults;

  SearchState(this.searchResults);

  onSearchInitiated({String? query, List<FilterItems>? filters}) {
    SearchEvent(query: query!, filters: filters!);
  }
}
