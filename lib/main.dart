import 'package:flutter/material.dart';
import 'utilities/constants.dart';
import 'screens/statistics.dart';
import 'screens/symptoms.dart';
import 'screens/precautions.dart';
import 'screens/districtzone.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

// statistics , precautions , district zone , symptoms

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _launchURL() async {
    const url = 'https://github.com/Tushar11Raj';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.fromLTRB(5, 25, 5, 10),
          children: <Widget>[
            Text(
              'COVID 19 live tracker',
              style: TextStyle(
                  fontFamily: 'Spartan MB',
                  fontSize: 25.0,
                  color: Colors.white,
                  backgroundColor: Colors.blue),
            ),
            Text(" "),
            Text(" "),
            Text(" "),
            Text(" "),
            Text('About Developer',
              style: TextStyle(
                  fontFamily: 'Spartan MB',
                  fontSize: 20.0,
                  color: Colors.white,
                  backgroundColor: Colors.blue),),
            Text('Tushar Raj',
              style: TextStyle(
                  fontFamily: 'Spartan MB',
                  fontSize: 16.0,
                  color: Colors.blue,),),
            Text('Email Id : tushar11raj@gmail.com',
              style: TextStyle(
                  fontFamily: 'Spartan MB',
                  fontSize: 16.0,
                  color: Colors.blue,),),
            RaisedButton(
              onPressed: _launchURL,
              child: new Text('github profile',style: TextStyle(
                fontFamily: 'Spartan MB',
                fontSize: 16.0,
                color: Colors.blue,),),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "STAY HOME STAY SAFE",
          style: kInfoTextStyle,
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("   "),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Text("   "),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Statistics();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Image(
                                image: AssetImage("icons/graph.png"),
                              ),
                            ),
                            Text("Statistics", style: tileStyle),
                          ],
                        ),
                      ),
                    ),
                    Text("   "),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Precautions();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Image(
                                image: AssetImage("icons/hand-wash.png"),
                              ),
                            ),
                            Text("Precautions", style: tileStyle),
                          ],
                        ),
                      ),
                    ),
                    Text("   "),
                  ],
                ),
              ),
            ),
            Text(
              " ",
              style: TextStyle(fontSize: 10),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Text("   "),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Symptoms();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Image(
                                image: AssetImage("icons/cough.png"),
                              ),
                            ),
                            Text("Symptons", style: tileStyle),
                          ],
                        ),
                      ),
                    ),
                    Text("   "),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DistrictZone();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Image(
                                image: AssetImage("icons/stayhome.png"),
                              ),
                            ),
                            Text("District-wise Zone", style: tileStyle)
                          ],
                        ),
                      ),
                    ),
                    Text("   "),
                  ],
                ),
              ),
            ),
            Text(
              " ",
              style: TextStyle(fontSize: 10),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Requirements",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Spartan MB',
                      ),
                    ),
                    Text(
                      "Help you prevent virus better",
                      style: kInfoTextStyle,
                    ),
                    Text("   "),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Image(
                            image: AssetImage("icons/soap.png"),
                          ),
                        ),
                        Text(" "),
                        Expanded(
                          child: Image(
                            image: AssetImage("icons/facemask.png"),
                          ),
                        ),
                        Text(" "),
                        Expanded(
                          child: Image(
                            image: AssetImage("icons/hand-sanitizer.png"),
                          ),
                        ),
                        Text(" "),
                        Expanded(
                          child: Image(
                            image: AssetImage("icons/gloves.png"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
