import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:my_small_application/ui/shared/app_colors.dart';
import 'package:my_small_application/ui/shared/text_styles.dart';
import 'package:my_small_application/ui/shared/ui_helpers.dart';

class DisplayWidget extends StatefulWidget {
  @override
  _DisplayWidget createState() => _DisplayWidget();
}

class _DisplayWidget extends State<DisplayWidget> {
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
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: 'Total number of surver         = ',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: '${register['firstName']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//                      )
                  ]
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Average age:    #',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: '${register['lastName']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//                      )
                  ]
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Oldest person who participate in survey  # ',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['password']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//                      )
                  ]
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Youngest person who participated in survey #',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['emailAddress']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//                      )
                  ]
              ),
            ),
            UIHelper.verticalSpaceMedium(),
            RichText(
              text: TextSpan(
                  text: 'Percentage of people whoi like Pizza:',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['city']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//                      )
                  ]
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Percentage of people who like Pasta:',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['streetName']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//                      )
                  ]
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Percentage of people who like Pap and Wors:',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['streetName']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//
//                      )
                  ]
              ),

            ),
            UIHelper.verticalSpaceMedium(),
            RichText(
              text: TextSpan(
                  text: 'People like to eat out : ',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['streetName']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//
//                      )
                  ]
              ),

            ),
            RichText(
              text: TextSpan(
                  text: 'People like to watch movies : ',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['streetName']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//
//                      )
                  ]
              ),

            ),
            RichText(
              text: TextSpan(
                  text: 'People like to watch TV : ',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['streetName']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//
//                      )
                  ]
              ),

            ),
            RichText(
              text: TextSpan(
                  text: 'People like to listen to the radio : ',
                  style: TextStyle(
                      color: textColorBlack, fontSize: 16),
                  children: <TextSpan>[
//                      TextSpan(text: ' ${register['streetName']}',
//                        style: TextStyle(
//                            color: textColorBlack, fontSize: 18),
//
//                      )
                  ]
              ),

            ),
            UIHelper.verticalSpaceMedium(),
            UIHelper.verticalSpaceMedium(),
            Center(
              child: Container(
                color: primaryColor,
                width: 200,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisplayWidget()),
                    );
                  },
                  child: Text("OK",style: textStyleWhite,),
                ),
              ),
            )

          ]),
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
//        child: FirebaseAnimatedList(
//          query: _ref,
//          itemBuilder: (BuildContext context, DataSnapshot snapshot,
//              Animation<double> animation, int index) {
//            Map register = snapshot.value;
//            return _buildContactItem(register: register);
//          },
//        ),
      child: _buildContactItem(),
      ),
    );
  }
}
