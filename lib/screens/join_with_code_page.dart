import 'package:flutter/material.dart';

class JoinWithCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'Join with code',
            style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.w400),
          ),
          backgroundColor: Colors.white,
          actions: [
            FlatButton(
              onPressed: () {},
              child: Text(
                'Join',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter the code provided by the meeting organiser',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              TextFormField(
                autofocus: true,
                cursorColor: Colors.blue[600],
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  hintText: 'Example: abc-mnop-xyz',
                  focusColor: Colors.blue[800], hoverColor: Colors.blue,
                  // fillColor: Colors.blue[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
