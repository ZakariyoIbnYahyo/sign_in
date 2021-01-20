import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in/model/signUp_model.dart';
import 'package:sign_in/pages/singIn.dart';
import 'package:sign_in/services/hive_db.dart';

class SignUpPage extends StatefulWidget {
  static final String id = "sign_up_page";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  void _signUp(){

    String email = emailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String adres = addressController.text.toString().trim();

    var object = new SignUp(email: email, number: number, address: adres);

    HiveDB().storeAccount(object);

    var account = HiveDB().loadAccount();
    print(account.email);
    print(account.number);
    print(account.address);
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
                  SizedBox(height: 10,),
                  Text("Welcome", style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                  SizedBox(height: 8,),
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),),
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
                        Text("Number", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        TextField(
                          controller: numberController,
                          decoration: InputDecoration(
                              hintText: "Enter number",
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                        ),
                        SizedBox(height: 30,),
                        Text("Number", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                              hintText: "Enter number",
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                        ),
                        SizedBox(height: 40,),
                        //button
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: FlatButton(
                            child: Center(
                              child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),),
                            ),
                            onPressed: _signUp,
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
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Already have an account ?", style: TextStyle(color: Colors.grey),),
                              SizedBox(width: 5,),
                              GestureDetector(
                                child: Text("Sign In", style:  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                                onTap: (){
                                  Navigator.pushNamed(context, SignInPage.id);
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
