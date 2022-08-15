import 'package:carmarket/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends SearchDelegate {
  //
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      hintColor: kGrey,
      appBarTheme: const AppBarTheme(color: kBlack),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(border: InputBorder.none),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.arrow_left,
          color: kText,
        ),
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
        icon: const Icon(
          CupertinoIcons.clear_circled,
          color: kText,
        ),
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
