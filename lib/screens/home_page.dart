import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_meet_ui/carousel/select_photo.dart';
import 'package:google_meet_ui/screens/join_with_code_page.dart';
import 'package:google_meet_ui/screens/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int photoIndex = 0;
  int titleIndex = 0;
  int desIndex = 0;

  List<String> photos = [
    'assets/pic1.jpeg',
    'assets/pic2.jpeg',
  ];
  List<String> title = [
    'Your meeting is safe',
    'Get a link that you can share'
  ];
  List<String> des = [
    'No one can join a meeting unless invited or admitted by the host',
    'Tab new meeting to get a link that you can send to people taht you want to meet with'
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
      titleIndex = titleIndex > 0 ? titleIndex - 1 : 0;
      desIndex = desIndex > 0 ? desIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
      titleIndex = titleIndex < title.length - 1 ? titleIndex + 1 : titleIndex;
      desIndex = desIndex < des.length - 1 ? desIndex + 1 : desIndex;
    });
  }

  Widget CustomWidget(String name, IconData icon) {
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

  Widget CustomWidgetBottomSheet(String name, IconData icon) {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: Drawer(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                  // padding: EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/google.jpeg',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Meet',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1.4,
                ),
                CustomWidget('Settings', Icons.settings_outlined),
                CustomWidget('Send feedback', Icons.feedback_outlined),
                CustomWidget('Help', Icons.help_rounded),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Meet',
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.jpeg"),
                  radius: 20.0,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2 + 240,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: Column(
                                        children: [
                                          CustomWidgetBottomSheet(
                                              'Get a meeting link to share',
                                              Icons.link_outlined),
                                          CustomWidgetBottomSheet(
                                              'Start an instant meeting',
                                              Icons.video_call_outlined),
                                          CustomWidgetBottomSheet(
                                              'Schedule in google calendar',
                                              Icons.calendar_today_outlined),
                                          CustomWidgetBottomSheet(
                                              'Close', Icons.close_outlined),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              'New meeting',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue[700],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => JoinWithCodePage(),
                                ),
                              );
                            },
                            child: Text(
                              'Join with a code',
                              style: TextStyle(
                                color: Colors.blue[700],
                              ),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  height: 260,
                                  decoration: BoxDecoration(
                                    // color: Colors.green,
                                    image: DecorationImage(
                                      image: AssetImage(photos[photoIndex]),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 250,
                                  child: Text(
                                    title[titleIndex],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 260,
                                  child: Text(
                                    des[desIndex],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 300,
                                    width: 125.0,
                                    color: Colors.transparent,
                                  ),
                                  onTap: _previousImage,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 300.0,
                                    width: 125.0,
                                    color: Colors.transparent,
                                  ),
                                  onTap: _nextImage,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        // color: Colors.red,
                        height: 10,
                        child: Center(
                          child: SelectedPhoto(
                            numberOfDots: photos.length,
                            photoIndex: photoIndex,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
