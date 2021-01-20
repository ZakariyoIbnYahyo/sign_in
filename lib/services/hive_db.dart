import 'package:hive/hive.dart';
import 'package:sign_in/model/signUp_model.dart';
import 'package:sign_in/model/user_model.dart';

class HiveDB{

  var box = Hive.box("local_db");

  void storeUser(User user) async{
    box.put("user", user.toJson());
  }

  User loadUser(){
    var user = new User.fromJson(box.get("user"));
    return user;
  }

  void removeUser(){
    box.delete("user");
  }


  //for account
  void storeAccount(SignUp user) async{
    box.put("sign_up", user.toJson());
  }

  SignUp loadAccount(){
    var account = new SignUp.fromJson(box.get("sign_up"));
    return account;
  }

  void removeAccount(){
    box.delete("sign_up");
  }

}

class HiveDBplus{

  var box = Hive.box("local_db");


}
