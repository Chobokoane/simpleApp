import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_small_application/ui/shared/app_colors.dart';
import 'package:my_small_application/ui/shared/ui_helpers.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

 TextEditingController surname,contactNumber,date,age,firstName;
 DatabaseReference _reference;
 final _formKey = GlobalKey<FormState>();
 bool checkedValue1 = true;
 bool checkedValue2 = true;
 bool checkedValue3 = true;
 bool checkedValue4= true;
 bool checkedValue5 = true;
 bool checkedValue6 = true;
 @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    surname = TextEditingController();
    contactNumber = TextEditingController();
    date = TextEditingController();
    age = TextEditingController();
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
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: surname ,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter surname';
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    hintText: 'Enter Surname',
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
                UIHelper.verticalSpaceXSmall(),
                TextFormField(
                  controller: firstName ,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter firstname';
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    hintText: 'Enter First Name',
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(
                      ),
                    ),

                    //fillColor: Colors.green
                  ),
                ),
                UIHelper.verticalSpaceXSmall(),
                TextFormField(
                  controller: contactNumber ,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter contactnumber';
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Enter Contact Number',
                    border: new OutlineInputBorder(

                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
                UIHelper.verticalSpaceXSmall(),
                TextFormField(
                  controller: date ,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter date';
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                    hintText: 'Enter Date YYYY/MM/DD',
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
                UIHelper.verticalSpaceXSmall(),
                TextFormField(
                  controller: age ,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter age';
                    }
                    return null;
                  },

                  decoration: new InputDecoration(
                    hintText: 'Enter Age',
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),

                ),
                UIHelper.verticalSpaceXSmall(),
              Text("What is your favourite food?(You can choose more than 1 answer)"),
                UIHelper.verticalSpaceXSmall(),
                CheckboxListTile(
                  checkColor: textColorWhite,
                  title: Text("Pizza"),
                  value: checkedValue1,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue1 = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                UIHelper.verticalSpaceXSmall(),
                CheckboxListTile(
                  checkColor: textColorWhite,
                  title: Text("Pasta"),
                  value: checkedValue2,
                  onChanged: (newValue) {
                    _reference.child("Register").child("Yes").set({
                      'enabled': checkedValue2,
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                UIHelper.verticalSpaceXSmall(),
                CheckboxListTile(
                  checkColor: textColorWhite,
                  title: Text("Pap and Wors"),
                  value: checkedValue3,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue3 = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                UIHelper.verticalSpaceXSmall(),
                CheckboxListTile(
                  checkColor: textColorWhite,
                  title: Text("Chicken stir fry"),
                  value: checkedValue4,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue4 = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                UIHelper.verticalSpaceXSmall(),
                CheckboxListTile(
                  checkColor: textColorWhite,
                  title: Text("Beef stir fry"),
                  value: checkedValue5,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue5 = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                UIHelper.verticalSpaceXSmall(),
                CheckboxListTile(
                  checkColor: textColorWhite,
                  title: Text("Other"),
                  value: checkedValue6,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue6 = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                UIHelper.verticalSpaceMedium(),
                Text("On a scale of 1 to 5 indicate whether you strongly agree to strongly disagree"),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        TableCell(child: Center(child: Text(""))),
                        TableCell(child: Center(child: Text("Strongly Agree  \n  (1)"))),
                        TableCell(
                          child: Center(child: Text('Agree \n  (2)')),
                        ),
                        TableCell(child: Center(child: Text('Neutral  \n  (3)'))),
                      ]),
                      TableRow(children: [

                        Text('I like to eat out'),
                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),

                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ]),
                      TableRow(children: [
                        Text('I like to watch movie'),
                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),

                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ]),
                      TableRow(children: [
                        Text('I like to watch TV'),
                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),

                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ]),
                      TableRow(children: [
                        Text('I like to listen to the radio'),
                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),

                        CheckboxListTile(
                          checkColor: textColorWhite,
                          value: checkedValue4,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue4 = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                      ])
                    ],
                  ),
                ),
               Container(
                 color: primaryColor,
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: RaisedButton(
                   child: Text("Submit",style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),),
                   onPressed: () {
                     // Validate returns true if the form is valid, or false
                     // otherwise.
                     if (_formKey.currentState.validate()) {
                       // If the form is valid, display a Snackbar.
                       register();
                     }

                   },
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 void register(){
   String fName = firstName.text;
   String Surname = surname.text;
   String aging = age.text;
   String Date = date.text;
   String contact = contactNumber.text;
   Map<String,String>  register = {
     "firstName": fName,
     "surname": Surname,
     "age": aging,
     "Date": Date,
     "contact": contact,
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
