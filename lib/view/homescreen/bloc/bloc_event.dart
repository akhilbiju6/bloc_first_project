part of 'bloc_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishListButtonClickedEvent extends  HomeEvent{

}

class HomeProductCartButtonClickedEvent extends  HomeEvent{

}

class HomeWishListButtonNavigateEventEvent extends  HomeEvent{

}

class HomeCartButtonNavigateEventEvent extends  HomeEvent{

}

