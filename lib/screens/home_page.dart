import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_meet_ui/carousel/select_photo.dart';
import 'package:google_meet_ui/screens/join_with_code_page.dart';
import 'package:google_meet_ui/screens/profile_page.dart';
import 'package:google_meet_ui/widgets/custom_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int photoIndex = 0;
  int titleIndex = 0;
  int desIndex = 0;

  List<String> name = [
    'Debajyati Banerjee',
    'Dibbo Banerjee',
    'Among Us',
  ];
  List<String> email = [
    'debajyatibanerjee0002@gmail.com',
    'debajyatibanerjee.rl.0002@gmail.com',
    'debajyatibanerjee.amonus.0002@gmail.com',
  ];

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

  Widget CustomListile(String name, String email, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(name[0]),
      ),
      title: Text(name),
      subtitle: Text(email),
    );
  }

  Widget CustomListileone() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/profile.jpeg'),
      ),
      title: Text('Debajyati Banerjee'),
      subtitle: Text('debajyatibanerjee0002@gmail.com'),
    );
  }

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
                CustomWidget('Settings', Icons.settings_outlined, context),
                CustomWidget('Send feedback', Icons.feedback_outlined, context),
                CustomWidget('Help', Icons.help_rounded, context),
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
              fontSize: 21,
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
              child: InkWell(
                onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    isDismissible: true,
                    context: context,
                    builder: (context) {
                      return Container(
                        margin: EdgeInsets.only(left: 12, right: 12),
                        height: MediaQuery.of(context).size.height / 1.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 00, left: 0, right: 0),
                          // color: Colors.red,
                          // height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.green,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 25,
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.blue,
                                          image: DecorationImage(
                                            alignment: Alignment.centerLeft,
                                            image: AssetImage(
                                                'assets/google.jpeg'),
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height - 140,
                                // color: Colors.yellow,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CustomListileone(),
                                        FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            side: BorderSide(
                                              color: Colors.grey,
                                              width: 0.5,
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Manage your Google Account',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          color: Colors.white,
                                        ),
                                        SizedBox(height: 20),
                                        Divider(
                                          thickness: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 10),
                                        CustomListile(
                                            name[0], email[0], Colors.green),
                                        SizedBox(height: 15),
                                        CustomListile(
                                            name[1], email[1], Colors.yellow),
                                        SizedBox(height: 15),
                                        CustomListile(
                                            name[2], email[2], Colors.red),
                                        SizedBox(height: 15),
                                        CustomListile(
                                            name[0], email[0], Colors.blue),
                                        SizedBox(height: 15),
                                        CustomWidget('Add another account',
                                            Icons.person_add_alt, context),
                                        SizedBox(height: 15),
                                        CustomWidget(
                                            'Manage accounts on this device',
                                            Icons.settings,
                                            context),
                                        SizedBox(height: 15),
                                        Divider(
                                          thickness: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FlatButton(
                                              child: Text(
                                                'Privacy Policy',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              onPressed: () {},
                                            ),
                                            Icon(
                                              Icons.circle,
                                              size: 5,
                                            ),
                                            FlatButton(
                                              child: Text(
                                                'Privacy Policy',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
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
                                        MediaQuery.of(context).size.height / 3,
                                    child: Column(
                                      children: [
                                        CustomWidgetBottomSheet(
                                            'Get a meeting link to share',
                                            Icons.link_outlined,
                                            context),
                                        CustomWidgetBottomSheet(
                                            'Start an instant meeting',
                                            Icons.video_call_outlined,
                                            context),
                                        CustomWidgetBottomSheet(
                                            'Schedule in google calendar',
                                            Icons.calendar_today_outlined,
                                            context),
                                        CustomWidgetBottomSheet('Close',
                                            Icons.close_outlined, context),
                                      ],
                                    ),
                                  );
                                },
                              );
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

//   void _onPressProfile() {
//     showModalBottomSheet(
//       useRootNavigator: true,
//       isDismissible: true,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       enableDrag: true,
//       // isDismissible: true,
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(15),
//               topRight: Radius.circular(15),
//             ),
//           ),
//           margin: EdgeInsets.only(left: 13, right: 13),
//           height: MediaQuery.of(context).size.height / 3,
//           // child: ProfilePage(),
//         );
//       },
//     );
//   }
}
