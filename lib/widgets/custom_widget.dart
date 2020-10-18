import 'package:flutter/material.dart';

Widget CustomWidgetBottomSheet(
    String name, IconData icon, BuildContext context) {
  return Expanded(
    child: FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: 5, top: 5),
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.grey[800],
              size: 25,
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget CustomWidget(String name, IconData icon, BuildContext context) {
  return FlatButton(
    onPressed: () {},
    child: Container(
      padding: EdgeInsets.only(left: 15),
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.grey[700],
            size: 20,
          ),
          SizedBox(width: 20),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
