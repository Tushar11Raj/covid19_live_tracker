import 'package:flutter/material.dart';
import 'package:covidstatus/utilities/constants.dart';
import 'package:covidstatus/utilities/networking.dart';

class StateWise extends StatefulWidget {
  @override
  _StateWiseState createState() => _StateWiseState();
}

class _StateWiseState extends State<StateWise> {
  String stateName;
  String sName;
  String confirmed;
  String active;
  String deaths;
  String recovered;

  Future<dynamic> getGlobalStats(String name) async {
    NetworkHelper networkHelper =
    NetworkHelper('https://api.covid19india.org/data.json');

    var stats = await networkHelper.getData();

    setState(() {
      if (stats == null) {
        stateName = "ERROR !!";
        confirmed = "0";
        active = "0";
        deaths = "0";
        recovered = "0";
        return;
      }
      int cc = 0;
      //print(stats);
      while (cc < 38) {
        print('* $cc');
        String tep = stats['statewise'][cc]['state'];

        print(tep);
        if (tep == name) {
          //print(stats['Countries'][cc]['NewDeaths']);
          break;
        } else
          cc++;
      }

      if (cc == 38) {
        stateName = "Not an  indian state name. Don't use abbreviations!!";
        confirmed = "0";
        active = "0";
        deaths = "0";
        recovered = "0";
        return;
      }

      stateName = stats['statewise'][cc]['state'];
      confirmed = stats['statewise'][cc]['confirmed'];
      active = stats['statewise'][cc]['active'];
      deaths = stats['statewise'][cc]['deaths'];
      recovered = stats['statewise'][cc]['recovered'];
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
                    sName = value;
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
                    getGlobalStats(sName);
                    print("button functions end");
                  },
                  child: Text(
                    'Get data for the state',
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
