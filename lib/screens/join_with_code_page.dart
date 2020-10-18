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
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter the code provided by the meeting organiser',
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.blueGrey[50],
                ),
                child: TextFormField(
                  autofocus: true,
                  cursorColor: Colors.blue[600],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    hintText: 'Example: abc-mnop-xyz',
                    // hoverColor: Colors.blue[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
