import 'package:flutter/material.dart';
import 'package:covidstatus/utilities/constants.dart';
import 'package:covidstatus/utilities/networking.dart';

class DistrictZone extends StatefulWidget {
  @override
  _DistrictZoneState createState() => _DistrictZoneState();
}

class _DistrictZoneState extends State<DistrictZone> {
  String districtName;
  String dName;
  String zone;
  String state;
  Color zoneColor;

  Future<dynamic> getGlobalStats(String name) async {
    NetworkHelper networkHelper =
    NetworkHelper('https://api.covid19india.org/zones.json');

    var stats = await networkHelper.getData();
    //zones[734].zone
    setState(() {
      if (stats == null) {
        districtName = "ERROR !!";
        zone = "unknown";
        state = "unknown";

        return;
      }
      int cc = 0;
      //print(stats);
      while (cc < 735) {
        print('* $cc');
        String tep = stats['zones'][cc]['district'];

        print(tep);
        if (tep == name) {
          //print(stats['Countries'][cc]['NewDeaths']);
          break;
        } else
          cc++;
      }

      if (cc == 735) {
        state = "Enter a valid district name";
        zone = "unknown";
        districtName = "unknown";
        return;
      }

      state = stats['zones'][cc]['state'];
      zone = stats['zones'][cc]['zone'];
      districtName = stats['zones'][cc]['district'];

      if(zone=="Orange")
        zoneColor = Colors.orange;
      else if(zone=="Green")
        zoneColor = Colors.green;
      else if(zone=="Red")
        zoneColor = Colors.red;
      else
        zoneColor = Colors.white;

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
                  decoration: kTextInputFieldDecorationDistrict,
                  onChanged: (value) {
                    dName = value;
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
                    getGlobalStats(dName);
                    print("button functions end");
                  },
                  child: Text(
                    'Get data for the District',
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
                          child: Text("State : $state",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("District : $districtName",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("Zone : $zone",
                              style: TextStyle(
                                backgroundColor: zoneColor,
                                fontFamily: 'Spartan MB',
                                fontSize: 20.0,

                              ),),),
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

