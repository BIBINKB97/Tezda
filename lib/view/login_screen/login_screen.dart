import 'package:flutter/material.dart';
import 'package:tezda/controller/auth_controller/auth_controller.dart';
import 'package:tezda/utils/common_widgets/custom_container.dart';
import 'package:tezda/utils/common_widgets/text_style.dart';
import 'package:tezda/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  final loginKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
             height: 300,
              width: double.infinity,
              child: Form(
                key: loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          label: Text('Username'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid Username";
                        }
                        return null;
                      },
                    ),
                   
                    TextFormField(
                      controller: _passwordController,
                      obscureText: isVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: isVisible == true
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                          label: Text('Password'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid Password";
                        }
                        return null;
                      },
                    ),
                   InkWell(
                    onTap: ()async {
                      //  Logic for Login
                   if (loginKey.currentState!.validate())  {
                          AuthController authService = AuthController();
                          final user = await authService.login(
                              _usernameController.text,
                              _passwordController.text);

                            if (user != null) {
                             // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacementNamed('/home');
                          }
                        }
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
                   ) ,
                  ],
                ),
              ),
            ),
          Container(
          
           height: 50,
            margin:EdgeInsets.symmetric(horizontal: 20) ,
              child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       CustomText(text:"Don't have an account ?",),
                         TextButton(onPressed: () {  },
                         child: CustomText(text:'Register Now',fs: 16,fw: FontWeight.w600,color:kblue ,),)
                      ],),
            )
          ],
        ),
      ),
    );
  }
}
