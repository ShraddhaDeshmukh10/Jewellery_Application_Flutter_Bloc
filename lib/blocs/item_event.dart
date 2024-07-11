import 'package:equatable/equatable.dart';

import 'package:flutter01/Model/model.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class LoadItems extends ItemEvent {}

class SearchItems extends ItemEvent {
  final String query;

  const SearchItems(this.query);

  @override
  List<Object> get props => [query];
}

class SelectItem extends ItemEvent {
  final Item selectedItem;

  const SelectItem(this.selectedItem);

  @override
  List<Object> get props => [selectedItem];
}

class ClearSelection extends ItemEvent {}
