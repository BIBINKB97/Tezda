import 'package:flutter/material.dart';
import 'package:tezda/utils/common_widgets/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  title: CustomText(text: 'All Products'),
),

body: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        endIndent: 10,
                        indent: 10,
                      );
                    },
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          width: 90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/dummy.jpg"))),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             ' product brand',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            Text(
                          '    product title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                             ' product description',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                       
                        
                      );
                    }) ,
    );

  }
}