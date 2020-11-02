import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
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
      color: Colors.white,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10.0),
        elevation: 5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: 'First Name: ',
                    style: TextStyle(
                        color: Colors.teal, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: '${register['firstName']}',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Last Name:',
                    style: TextStyle(
                        color: Colors.teal, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: '${register['lastName']}',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Password:',
                    style: TextStyle(
                        color: Colors.teal, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: ' ${register['password']}',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Email Address:',
                    style: TextStyle(
                        color: Colors.teal, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: ' ${register['emailAddress']}',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'City:',
                    style: TextStyle(
                        color: Colors.teal, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: ' ${register['city']}',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18),
                      )
                    ]
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Street Name:',
                    style: TextStyle(
                        color: Colors.teal, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: ' ${register['streetName']}',
                        style: TextStyle(
                            color: Colors.black, fontSize: 18),
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
        backgroundColor: Colors.teal,
        title: Center(child: Text('Retrieve Data')),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            return _buildContactItem(register: contact);
          },
        ),
      ),
    );
  }
}
