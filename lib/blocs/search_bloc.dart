import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mobile_bank_checkque/data/dataproviders/cheque_api.dart';
import 'package:mobile_bank_checkque/data/models/cheque.dart';
import 'package:mobile_bank_checkque/data/repositories/cheque_repository.dart';
import 'package:mobile_bank_checkque/main.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ChequeRepository _chequeRepository;

  SearchBloc(this._chequeRepository) : super(SearchState(ChequeApi().cheques));

  void onSearchInitiated({String? query, List<FilterItems>? filters}) {
    state.onSearchInitiated(query: query, filters: filters);
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchEvent) {
      final searchResult = await _chequeRepository.searchCheques(query: event.query, filter: event.filters);
      yield SearchState(searchResult);
    }
  }
}
