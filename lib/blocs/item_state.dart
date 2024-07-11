import 'package:equatable/equatable.dart';
import 'package:flutter01/Model/model.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<Item> items;

  const ItemLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class ItemError extends ItemState {
  final String message;

  const ItemError(this.message);

  @override
  List<Object> get props => [message];
}

class ItemSelected extends ItemState {
  final Item selectedItem;

  const ItemSelected(this.selectedItem);

  @override
  List<Object> get props => [selectedItem];
}

class ItemSelectionCleared extends ItemState {}
