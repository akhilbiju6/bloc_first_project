import 'package:bloc_application/model/homescreenproductmodel/homescreenproductmodel.dart';
import 'package:bloc_application/view/homescreen/bloc/bloc_bloc.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductsdataModel productdatamodel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productdatamodel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black)
      ),
      margin: const EdgeInsets.all(10),
      padding:  const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height:200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(productdatamodel.imageUrl))
            ),
          ),
          const SizedBox(height: 20,),
          Text(productdatamodel.name,style: const TextStyle(
            fontSize: 18,fontWeight: FontWeight.bold
          ),),
          Text(productdatamodel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ ${productdatamodel.price.toString()}",style: const TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold
              ),),
              Row(
                children: [
                   IconButton(onPressed: () {
                homeBloc.add(HomeProductWishListButtonClickedEvent());
              }, icon:const Icon(Icons.favorite_border)),
              IconButton(onPressed: () {
                 homeBloc.add(HomeProductCartButtonClickedEvent());
              }, icon:const Icon(Icons.shopping_bag_outlined))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}