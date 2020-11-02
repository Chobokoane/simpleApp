import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_small_application/ui/view/display.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

 TextEditingController firstName,lastName,emailAddress,password,streetName,city;
 DatabaseReference _reference;
 void register(){
   String fName = firstName.text;
   String lName = lastName.text;
   String email = emailAddress.text;
   String pass = password.text;
   String cit = city.text;
   String street = streetName.text;
   Map<String,String>  reg = {
     "firstName": fName,
     "lastName": lName,
     "emailAddress": email,
     "password": pass,
     "city": cit,
     "streetName": street,
   };
   _reference.push().set(reg);
   //https://www.youtube.com/watch?v=MwhgBYW-FNs
 }
 @override
  void initState() {
    // TODO: implement initState
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
        backgroundColor: Colors.teal,
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
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: lastName ,
                decoration: InputDecoration(
                  hintText: "Enter last Name",
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: emailAddress ,
                decoration: InputDecoration(
                  hintText: "Enter email",
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: password ,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: streetName ,
                decoration: InputDecoration(
                  hintText: "Enter Street Name",
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              TextFormField(
                controller: city ,
                decoration: InputDecoration(
                  hintText: "Enter City Name",
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),

             Container(
               width: double.infinity,
               color: Colors.teal,
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
              SizedBox(height: 15.0,),
              Container(
                color: Colors.teal,
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
                        MaterialPageRoute(builder: (context) => Contacts()),
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

}
