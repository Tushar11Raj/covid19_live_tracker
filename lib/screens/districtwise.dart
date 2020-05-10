import 'package:flutter/material.dart';
import 'package:covidstatus/utilities/constants.dart';
import 'package:covidstatus/utilities/networking.dart';

class DistrictWise extends StatefulWidget {
  @override
  _DistrictWiseState createState() => _DistrictWiseState();
}

class _DistrictWiseState extends State<DistrictWise> {
  String stateName;
  String districtName;
  int confirmed;
  int active;
  int deaths;
  int recovered;

  Future<dynamic> getGlobalStats(String sName, String dName) async {
    NetworkHelper networkHelper = NetworkHelper('https://api.covid19india.org/state_district_wise.json');

    var stats = await networkHelper.getData();

    setState(() {
      if (stats == null) {
        stateName = "ERROR !!";
        confirmed = 0;
        active = 0;
        deaths = 0;
        recovered = 0;
        return;
      }

      districtName = stats[sName]["districtData"][dName];
      confirmed = stats[sName]["districtData"][dName]["confirmed"];
      active = stats[sName]["districtData"][dName]["active"];
      deaths = stats[sName]["districtData"][dName]["deceased"];
      recovered = stats[sName]["districtData"][dName]["recovered"];
    });

    //print(stats);
    return stats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage('images/city_background.jpg'),
//            fit: BoxFit.cover,
//          ),
//        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextInputFieldDecorationState,
                  onChanged: (value) {
                    stateName = value;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextInputFieldDecorationDistrict,
                  onChanged: (value) {
                    districtName = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  border: Border.all(
                    color: Colors.blueGrey, //                   <--- border color
                    width: 5.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: FlatButton(
                  onPressed: () {
                    getGlobalStats(stateName,districtName);
                    print("button functions end");
                  },
                  child: Text(
                    'Get data for the district',
                    style: TextStyle(
                      fontFamily: 'Spartan MB',
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: Text("State : $stateName",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("Confirmed : $confirmed",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("Active : $active",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("Deaths : $deaths",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("Recovered : $recovered",
                              style: kInfoTextStyle)),
                    ],
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
