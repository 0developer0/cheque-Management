import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_bank_checkque/Widget/ChequeItem.dart';
import 'package:mobile_bank_checkque/blocs/search_bloc.dart';

Widget CustomTab(cheques) {
  if (cheques.isNotEmpty) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: cheques.length,
            itemBuilder: (context, index) =>
                chequeItem(state.searchResults[index]),
          );
        },
      ),
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.hourglass_empty),
        SizedBox(
          height: 20,
        ),
        Text("Empty"),
      ],
    );
  }
}
