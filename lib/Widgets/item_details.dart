import 'package:flutter/material.dart';
import 'package:flutter01/Model/model.dart';
import 'package:flutter01/blocs/item_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/item_bloc.dart';
import '../blocs/item_state.dart';
import 'selected_item_details.dart';

class ItemDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ItemLoaded) {
            return ItemDetails(items: state.items);
          } else if (state is ItemSelected) {
            return SelectedItemDetails(item: state.selectedItem);
          } else if (state is ItemSelectionCleared) {
            return Center(child: Text('No item selected'));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  final List<Item> items;

  const ItemDetails({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            items[index].description,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            BlocProvider.of<ItemBloc>(context).add(SelectItem(items[index]));
          },
        );
      },
    );
  }
}
