import 'package:classico_395/api_exp_395/data/remote/model/product_model.dart';
import 'package:classico_395/api_exp_395/ui/bloc/product_bloc/product_bloc.dart';
import 'package:classico_395/api_exp_395/ui/bloc/product_bloc/product_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/product_bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageProduct extends StatefulWidget {

  @override
  State<HomePageProduct> createState() => _HomePageProductState();
}

class _HomePageProductState extends State<HomePageProduct> {

  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().add(GetAllProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (_,state){
        if(state is ProductLoadingState){
          return Center(child: CircularProgressIndicator());

        }
        
        if(state is ProductErrorState){
          return Center(child: Text(state.errorMsg));

        }


        if(state is ProductLoadedState){

          print("length :${state.allProducts.length}");

          return state.allProducts.isNotEmpty ? ListView.builder(
            itemCount: state.allProducts.length,
              itemBuilder: (_, index){
              ProductModel eachProduct = state.allProducts[index];
              print("product :${state.allProducts[index].reviews!.length}");

              return Card(child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Image.network('${eachProduct.thumbnail}'),
                        title: Text('${eachProduct.title}'),
                      ),
                      /*eachProduct.reviews!=null?*/
                      eachProduct.reviews!.isNotEmpty ?
                      ListView.builder(
                        shrinkWrap: true,
                          itemCount: eachProduct.reviews!.length,
                          itemBuilder: (_, reviewIndex){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${eachProduct.reviews![reviewIndex].date}'),
                                Text('Rating :${eachProduct.reviews![reviewIndex].rating}'),
                                Text('${eachProduct.reviews![reviewIndex].reviewerName}'),
                                Text('${eachProduct.reviews![reviewIndex].comment}'),
                                Text('${eachProduct.reviews![reviewIndex].reviewerEmail}'),
                              ],
                        );
                      
                      })
                          : Center(child: Text("No reviews")) /*: Center(child: Text("No data for review"),)*/,
                    ],
                  ),
                ),
              ));
              
              }) : Center(child: Text("No Products"));
        }
        return Container();
      }),
    );
  }
}
