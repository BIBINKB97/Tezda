import 'package:flutter/material.dart';
import 'package:tezda/utils/common_widgets/text_style.dart';
import 'package:tezda/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
             centerTitle: true,
                title: CustomText(text: 'All Products'),),
                   body: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        endIndent: 10,
                        indent: 10,
                      );
                    },
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 250,
                        child: Row(
                          children: [
                            Container(
                              height: 130,
                              width: 120,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/dummy.jpg"))),

                            ),
                            kWidth20,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product name'),
                                Text('product prize'),
                                Text('description'),
                              

                              ],
                            )
                          ],
                        ),
                    
                      );
                    }) ,
    );

  }
}