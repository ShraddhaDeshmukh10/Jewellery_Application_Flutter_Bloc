import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter01/Model/model.dart';
import 'package:flutter01/blocs/item_event.dart';
import 'package:flutter01/blocs/item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  List<Item> allItems = [];

  ItemBloc() : super(ItemInitial()) {
    on<LoadItems>(_onLoadItems);
    on<SearchItems>(_onSearchItems);
    on<SelectItem>(_onSelectItem);
    on<ClearSelection>(_onClearSelection);
  }

  Future<void> _onLoadItems(LoadItems event, Emitter<ItemState> emit) async {
    emit(ItemLoading());
    try {
      final String response = await rootBundle.loadString("assets/data.json");
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> itemsJson = data['items'];
      allItems = itemsJson.map((item) => Item.fromJson(item)).toList();
      emit(ItemLoaded(allItems));
    } catch (e) {
      emit(ItemError('Failed to load items'));
    }
  }

  void _onSearchItems(SearchItems event, Emitter<ItemState> emit) {
    final query = event.query.toLowerCase();
    final filteredItems = allItems
        .where((item) => item.description.toLowerCase().contains(query))
        .toList();
    emit(ItemLoaded(filteredItems));
  }

  void _onSelectItem(SelectItem event, Emitter<ItemState> emit) {
    emit(ItemSelected(event.selectedItem));
  }

  void _onClearSelection(ClearSelection event, Emitter<ItemState> emit) {
    emit(ItemSelectionCleared());
  }
}
