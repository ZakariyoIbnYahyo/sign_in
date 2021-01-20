import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:sign_in/model/user_model.dart';
import 'package:sign_in/pages/signUp.dart';
import 'package:sign_in/services/hive_db.dart';

class SignInPage extends StatefulWidget {
  static final String id = "sign_in_page";
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _doSignIn(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = new User(email: email, password: password);

    HiveDB().storeUser(user);


    var user2 = HiveDB().loadUser();
    print(user2.email);
    print(user2.password);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/user.jpeg"),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Welcome", style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                  SizedBox(height: 8,),
                  Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Enter email",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("Password", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            hintStyle: TextStyle(color: Colors.grey)
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 30,
                          child: Center(
                            child: Text("Forgot Password?",style: TextStyle(color: Colors.grey, fontSize: 18),),
                          ),
                        ),
                        SizedBox(height: 20,),
                        //button
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: FlatButton(
                            onPressed: _doSignIn,
                            child: Center(
                              child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20),),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Divider(),
                              )
                            ),
                            Text("OR", style: TextStyle(fontSize: 18, color: Colors.grey),),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Divider(),
                                )
                            ),
                          ]
                        ),
                        SizedBox(height: 30,),
                        Container(
                          height: 50,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: IconButton(
                                      icon: FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.indigo,
                                      ),
                                      onPressed: (){},
                                    )
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                      child: IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.twitter,
                                          color: Colors.blueAccent,
                                        ),
                                        onPressed: (){},
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                      child: IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.instagram,
                                          color: Colors.black,
                                        ),
                                        onPressed: (){},
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 75),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Don't have an account ?", style: TextStyle(color: Colors.grey),),
                              SizedBox(width: 5,),
                              GestureDetector(
                                child: Text("SignUp", style:  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                                onTap: (){
                                  Navigator.pushNamed(context, SignUpPage.id);
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
