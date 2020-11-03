import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_small_application/ui/shared/app_colors.dart';
import 'package:my_small_application/ui/shared/ui_helpers.dart';
import 'package:my_small_application/ui/widget/display_widget.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

 TextEditingController firstName,lastName,emailAddress,password,streetName,city;
 DatabaseReference _reference;

 @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    password = TextEditingController();
    city = TextEditingController();
    streetName = TextEditingController();
    emailAddress = TextEditingController();
    _reference = FirebaseDatabase.instance.reference().child("Register");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple App"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: firstName ,
                decoration: InputDecoration(
                  hintText: "Enter First Name",
                  fillColor: widgetBgColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: lastName ,
                decoration: InputDecoration(
                  hintText: "Enter last Name",
                  fillColor: widgetBgColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: emailAddress ,
                decoration: InputDecoration(
                  hintText: "Enter email",
                  fillColor: widgetBgColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: password ,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  fillColor: widgetBgColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: streetName ,
                decoration: InputDecoration(
                  hintText: "Enter Street Name",
                  fillColor: widgetBgColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: city ,
                decoration: InputDecoration(
                  hintText: "Enter City Name",
                  fillColor: widgetBgColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),

             Container(
               width: double.infinity,
               color: primaryColor,
               padding: EdgeInsets.symmetric(horizontal: 10),
               child: RaisedButton(
                 child: Text("Register",style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),),
                 onPressed: (){
                   register();
                 },
               ),
             ),
              UIHelper.verticalSpaceSmall(),
              Container(
                color: primaryColor,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  child: Text("List Data",style: TextStyle(
                    fontSize: 20,

                    fontWeight: FontWeight.bold,
                  ),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DisplayWidget()),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
 void register(){
   String fName = firstName.text;
   String lName = lastName.text;
   String email = emailAddress.text;
   String pass = password.text;
   String cit = city.text;
   String street = streetName.text;
   Map<String,String>  register = {
     "firstName": fName,
     "lastName": lName,
     "emailAddress": email,
     "password": pass,
     "city": cit,
     "streetName": street,
   };
   _reference.push().set(register).then((value) {
     _showDialog();
   }).catchError((error) {
     Text("'${error.toString()}");
     print("This is the error $error");
   });
   //https://www.youtube.com/watch?v=MwhgBYW-FNs
 }
 void _showDialog() {
   // flutter defined function
   showDialog(
     context: context,
     builder: (BuildContext context) {
       // return object of type Dialog
       return AlertDialog(
         title: new Text("User Succesfully Registered"),
         actions: <Widget>[
           // usually buttons at the bottom of the dialog
           new FlatButton(
             child: new Text("Close"),
             onPressed: () {
               Navigator.of(context).pop();
             },
           ),
         ],
       );
     },
   );
 }
}
