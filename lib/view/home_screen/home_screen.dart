import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';
import 'package:tezda/controller/product_controller/product_controller.dart';
import 'package:tezda/model/product_model/product_model.dart';
import 'package:tezda/utils/common_widgets/text_style.dart';
import 'package:tezda/utils/utils.dart';
import 'package:tezda/view/home_screen/product_details/product_details_screen.dart';

class HomePage extends StatefulWidget {
 
   
  const HomePage({super.key,  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductController productController = ProductController();

   @override
  void initState() {
    productController.getAllProducts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
             centerTitle: true,
                title: CustomText(text: 'All Products'),),
                   body: FutureBuilder(
                    future: productController.getAllProducts(),
                     builder: (context, snapshot) {
                      if(snapshot.hasData){
                        final ProductModel productmodel = snapshot.data!;
                        final products = productmodel.products;                    
                       return ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            endIndent: 10,
                            indent: 10,
                          );
                        },
                        
                        itemBuilder: (context, index) {
                          final product =products![index];
                          return InkWell(
                            onTap: () {
                             Navigator.of(context).push(MaterialPageRoute(
                              builder:(context) => ProductDetails( product:product),));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              height: 230,
                              child: Row(
                                children: [
                                  Container(
                                    height: 130,
                                    width: 120,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        
                                        fit: BoxFit.fill,
                                        image:NetworkImage(product.images![0]))),
                                                   
                                  ),
                                  kWidth20,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     SizedBox(
                                      width: 200, child: CustomText(text: product.title!,fs: 20,fw: FontWeight.w600,)),
                                     SizedBox(
                                      width: 200,
                                      child: CustomText(text: product.description!,fs: 15,)),
                                     Row(
                                       children: [
                                        StarRating(
                                          rating: product.rating,
                                          length: 5,
                                          color: kgreen,
                                        ),
                                       CustomText(text: product.rating.toString(),fs: 15,),
                                       ],
                                     ),
                                     CustomText(text: "${product.discountPercentage.toString()}% ▼",fs: 15,fw: FontWeight.w600,color: kgreen,),
                                     CustomText(text: "${product.price.toString()} USD",fs: 15,fw: FontWeight.w600,),
                                     CustomText(text: "Available Stock : ${product.stock.toString()} ",fs: 15,fw: FontWeight.w500,),
                            
                                    ],
                                  )
                                ],
                              ),
                                                    
                            ),
                          );
                        },
                         itemCount: 11,
                        
                        );
                     }
                      return Center(child: CircularProgressIndicator());
                     }
                   ) ,
    );

  }
}