import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_bank_checkque/Widget/ChequeItem.dart';
import 'package:mobile_bank_checkque/blocs/search_bloc.dart';
import 'package:mobile_bank_checkque/data/repositories/cheque_repository.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var searchTerm = "search";
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown[500],
            title: Text("مدیریت چک"),
            centerTitle: true,
            elevation: 1,
            leading: BackButton(onPressed: () {}),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.refresh,
                  size: 26,
                ),
              )
            ],
          ),
          body: BlocProvider(
            create: (context) => SearchBloc(ChequeRepository()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: searchTerm,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    onSubmitted: (value) {
                      BlocProvider.of<SearchBloc>(context)
                          .onSearchInitiated(query: value);
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [Text("صادر شده"), Text("انتقال داده شده")],
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      return TabBarView(
                        children: [
                          Tab(state.searchResults),
                          Tab(state.searchResults),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Widget Tab(cheques) {
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

enum FilterItems { emitted, transferred }

extension filterItemExtension on FilterItems {}