part of 'bloc_bloc.dart';

@immutable
sealed class HomeState {}

final class BlocInitial extends HomeState {}

abstract class HomeActionState extends HomeState{

}

class HomeInitialState extends HomeState{

}

class HomeLoadingState extends HomeState{

}
class HomeLoadedSuccessState extends HomeState{

}
class HomeErrorState extends HomeState{

}

class HomeNavigateToWishListPageactionState extends HomeState{}
