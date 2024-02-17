import 'package:flutter/material.dart';
import 'package:tezda/utils/common_widgets/custom_container.dart';
import 'package:tezda/utils/common_widgets/text_style.dart';
import 'package:tezda/utils/utils.dart';
import 'package:tezda/view/login_screen/registration_screen/widgets/text_form_field.dart';

class RegistrationScreen extends StatefulWidget {
   const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
    TextEditingController _nameController =TextEditingController();
      TextEditingController _emailController =TextEditingController();
      TextEditingController _passwordController =TextEditingController();
      TextEditingController _phoneController =TextEditingController();

// To dispose the both Controllers
  @override
  void dispose() {
    _nameController .dispose();
    _emailController .dispose();
    _passwordController.dispose();
    _phoneController .dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
             height: 400,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 CustomText(text: "Register here",fs: 20,fw: FontWeight.w600,),
               CustomTextFormField(label: "Enter Name", controller: _nameController),
               CustomTextFormField(label: "Enter Email ID", controller: _emailController),
               CustomTextFormField(label: "Enter Password", controller: _passwordController),
               CustomTextFormField(label: "Enter Phone Number", controller: _phoneController),
                InkWell(
                  onTap: () {
                    //Logic for Registration
                  },
                  child: CustomContainer(
                      height: 55,
                      width: 200,
                        borderRadius: 10,
                        border: Border.all(
                          width: 2,
                          color: kblue),
                      color: kgrey,
                      child: Center(child: CustomText(text: "Submit",fs: 19,fw: FontWeight.w600,color: kwhite,)),
                     ),
                ),
                ],
              ),
            ),
            Container(
           height: 50,
            margin:EdgeInsets.symmetric(horizontal: 20) ,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 CustomText(text:"Already have an account ?",),
                 TextButton(onPressed: () { 
                  Navigator.of(context).pushNamed('/');
                  },
                 child: CustomText(text:'Login Now',fs: 16,fw: FontWeight.w600,color:kblue ,),)
                      ],),
            )
          ],
        ),
      ),
    );
  }
}