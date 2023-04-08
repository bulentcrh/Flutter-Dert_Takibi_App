import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Example',
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(250, 236, 147, 1),
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          leadingWidth: 56,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Do something when the button is pressed
          },
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 330,
                child: DrawerHeader(
                  child: Text(
                    '',
                  ),
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(250, 236, 147, 1),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/DERT TAKİBİ.png"))),
                ),
              ),
              ListTile(
                title: Text('My Profile'),
                onTap: () {
                  // Do something when the menu item is tapped
                },
              ),
              ListTile(
                title: Text('Home Page'),
                onTap: () {
                  // Do something when the menu item is tapped
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homePage_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Welcome Back\n User!',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //SizedBox(height: 20),
                        Text(
                          'Bu Ay Tamamlanmamış \n5 görevin var!',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "https://flutterx.com/thumbnails/artifact-2096.png")),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cardTitles.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white.withOpacity(0.6),
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        cardTitles[index],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        cardContents[index],
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                new CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 8.0,
                                  animation: true,
                                  percent: percentValues[index],
                                  center: new Text(
                                    "${(percentValues[index] * 100).toStringAsFixed(0)}%",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0),
                                  ),
                                  footer: new Text(
                                    "",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.blue,
                                ),
                              ]),
                          //],
                          //),
                        ),
                      );
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

  final List<String> cardTitles = [
    'Flutter Dersleri',
    'Temel Girişimcilik Eğitimeri',
    'Git GitHub Kursu',
    /*'Title 4',
    'Title 5',
    'Title 6',
    'Title 7',
    'Title 8',
    'Title 9',
    'Title 10'*/
  ];

  final List<String> cardContents = [
    'Nisan ayı içerisinde 11. aya kadar izle',
    'Nisan ayı içerisinde tamamlamış ol',
    'Mart ayı içerisinde bitirmiş ol ',
    /*'Content 4',
    'Content 5',
    'Content 6',
    'Content 7',
    'Content 8',
    'Content 9',
    'Content 10'*/
  ];

  final List<double> percentValues = [
    0.55,
    0.75,
    0.57,

    /*'https://example.com/image4.jpg',
    'https://example.com/image5.jpg',
    'https://example.com/image6.jpg',
    'https://example.com/image7.jpg',
    'https://example.com/image8.jpg',
    'https://example.com/image9.jpg',
    'https://example.com/image10.jpg'*/
  ];
}
