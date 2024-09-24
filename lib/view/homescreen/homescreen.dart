
import 'package:bloc_application/utils/product_tile_widget.dart';
import 'package:bloc_application/view/cartscreen/cartscreen.dart';
import 'package:bloc_application/view/homescreen/bloc/bloc_bloc.dart';
import 'package:bloc_application/view/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
   final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current)=> current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
       if(state is HomeNavigateToCartPageactionState){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));
       }
       else if(state is HomeNavigateToWishListPageactionState){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const WishList(),));
       }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
          case HomeLoadedSuccessState:
          final succesState= state as HomeLoadedSuccessState;
          return Scaffold(
          appBar: AppBar(
            title: const Text("Grocery App"),
            actions: [
              IconButton(onPressed: () {
                homeBloc.add(HomeWishListButtonNavigateEventEvent());
              }, icon:const Icon(Icons.favorite_border)),
              IconButton(onPressed: () {
                 homeBloc.add(HomeCartButtonNavigateEventEvent());
              }, icon:const Icon(Icons.shopping_bag_outlined))
            ],
            backgroundColor: Colors.blue,
          ),
          backgroundColor: Colors.white,
          body: SizedBox(
            height: size.height,
            width: size.height,
            child: ListView.builder(
              itemCount: succesState.products.length,
              itemBuilder: (context, index) {
              return ProductTileWidget(productdatamodel:succesState.products[index]);
            },),
          ),
        );
        case HomeErrorState:
        return const Scaffold(
          body:Center(
            child: Text("Error Loadimng The Data"),
          ),
        );
        default: return const SizedBox();
        }
  });
  }
}


