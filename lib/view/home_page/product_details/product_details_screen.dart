import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';
import 'package:tezda/model/product_model/product_model.dart';
import 'package:tezda/utils/common_widgets/text_style.dart';
import 'package:tezda/utils/utils.dart';
import 'package:tezda/view/home_page/product_details/widgets/custom_icons.dart';

class ProductDetails  extends StatefulWidget {
    final Products product;
  const ProductDetails({super.key, required this.product, });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
         Navigator.pop(context);},
           icon: Icon(Icons.arrow_back_ios)),
           title: CustomText(
           text: widget.product.title.toString(),
           fs: 24,
           fw: FontWeight.w500,
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 400,
            decoration: BoxDecoration(color: kAshLight, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                 height: 350,
                 width: double.infinity,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                fit: BoxFit.fill,
                image:NetworkImage(
                 
                  
                  widget.product.images![0])))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomIconButton(
                        icon: Icons.share_outlined,
                        onPressed: () {
                         
                        }),
                    CustomIconButton(icon: Icons.favorite_border,
                    onPressed: (){},
                    ),
                  ],
                ),
              ],
            ),
          ),
          kHeight10,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.share,
                  color: kblue,
                  size: 20,
                ),
                kWidth10,
                CustomText(
                  text: "1034",
                  fs: 16,
                ),
                kWidth20,
                Icon(
                  Icons.favorite_border,
                  color: kblue,
                  size: 20,
                ),
                kWidth10,
                CustomText(text: "1034", fs: 16),
                kWidth20,
                Container(
                  decoration: BoxDecoration(color: kAshLight, borderRadius: BorderRadius.circular(30)),
                  child: StarRating(
                    length: 5,
                    rating: widget.product.rating,
                    between: 2,
                    starSize: 15,
                    color: kgreen,
                  ),
                ),
                kWidth20,
                CustomText(text: widget.product.rating.toString(), color: kgreen, fs: 16),
              ],
            ),
          ),
          kHeight20,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                CustomText(
                  text: widget.product.brand.toString(),
                  fs: 19,
                  fw: FontWeight.w500,
                ),
                CustomText(
                  text: widget.product.category.toString(),
                  fs: 17,
                  color: kgrey,
                ),
                kHeight10,
                Row(
                  children: [
                    Icon(
                      Icons.discount_outlined,
                      size: 18,
                      color: kgrey,
                    ),
                    kWidth5,
        CustomText(text: "▼${widget.product.discountPercentage.toString()}% discount ",fs: 15,fw: FontWeight.w600,color: kgreen,),

                  ],
                ),
                kHeight10,
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 18,
                      color: kgrey,
                    ),
                    kWidth5,
                    CustomText(
                      text: "Total Prize : ",
                      fs: 17,
                      
                    ),
                     CustomText(
                      text: "${widget.product.price} USD only",
                      fs: 17,
                      fw: FontWeight.bold,
                      
                    ),
                  ],
                ),
                kHeight20,
                CustomText(
                  text: "Description",
                  fs: 19,
                  fw: FontWeight.w500,
                ),
                kHeight10,
                CustomText(
                  text: widget.product.description!,
                  fs: 16,
                  color: kgrey,
                ),
              ],
            ),
          ), 
          Align(
            alignment: Alignment(0.9, 1),
            child: TextButton(
                onPressed: () {},
                child: CustomText(
                  text: "See More",
                  fs: 18,
                )),
          ),
        ],
      ),
    );
  }
}
