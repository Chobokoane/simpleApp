import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:my_small_application/ui/shared/app_colors.dart';

class DisplayWidget extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<DisplayWidget> {
  Query _ref;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Register')
        .orderByChild('firstName');
  }

  Widget _buildContactItem({Map register}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      color: widgetBgColor,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: widgetBgColor, width: 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.all(10.0),
        elevation: 3,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: 'First Name: ',
                    style: TextStyle(
                        color: primaryColor, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: '${register['firstName']}',
                        style: TextStyle(
                            color: textColorBlack, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Last Name:',
                    style: TextStyle(
                        color: primaryColor, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: '${register['lastName']}',
                        style: TextStyle(
                            color: textColorBlack, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Password:',
                    style: TextStyle(
                        color: primaryColor, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: ' ${register['password']}',
                        style: TextStyle(
                            color: textColorBlack, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Email Address:',
                    style: TextStyle(
                        color:primaryColor, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: ' ${register['emailAddress']}',
                        style: TextStyle(
                            color: textColorBlack, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'City:',
                    style: TextStyle(
                        color: primaryColor, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: ' ${register['city']}',
                        style: TextStyle(
                            color: textColorBlack, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Street Name:',
                    style: TextStyle(
                        color: primaryColor, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: ' ${register['streetName']}',
                        style: TextStyle(
                            color: textColorBlack, fontSize: 18),
                      )
                    ]
                ),
              )
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('List Data'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map register = snapshot.value;
            return _buildContactItem(register: register);
          },
        ),
      ),
    );
  }
}
