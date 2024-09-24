import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_application/model/homescreenproductmodel/homescreenproductmodel.dart';
import 'package:bloc_application/model/productsmodel/productsmodel.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(BlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
   on<HomeProductWishListButtonClickedEvent>(homeProductWishListButtonClickedEvent);
   on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent); 
   on<HomeWishListButtonNavigateEventEvent >(homeWishListButtonNavigateEventEvent ); 
   on<HomeCartButtonNavigateEventEvent>(homeCartButtonNavigateEventEvent); 
  }
  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductsdataModel(
      id: e["id"]??"",
       name: e["name"]??"",
        description: e["category"]??"", 
        price: e["price"]??'',
         imageUrl:e["imageUrl"]??''),).toList()
         ));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Product ciicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
     print("Cart product ciicked");
  }

  FutureOr<void> homeWishListButtonNavigateEventEvent(HomeWishListButtonNavigateEventEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishListPageactionState());
     print("WishList Navigate Event Clicked");
  }

  FutureOr<void> homeCartButtonNavigateEventEvent(HomeCartButtonNavigateEventEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageactionState());
     print("Cart Navigate Event Clicked");
  }


}
