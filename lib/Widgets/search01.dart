import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter01/blocs/item_bloc.dart';
import 'package:flutter01/blocs/item_event.dart';

class Search01 extends StatelessWidget {
  const Search01({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey.shade700,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                hintText: "Search by name, description,......",
                hintStyle: TextStyle(color: Colors.black),
              ),
              onChanged: (query) {
                BlocProvider.of<ItemBloc>(context).add(SearchItems(query));
              },
            ),
          ),
          SizedBox(width: 8.0),
          TextButton(
            onPressed: () {
              BlocProvider.of<ItemBloc>(context).add(ClearSelection());
            },
            child: Text('Clear', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
