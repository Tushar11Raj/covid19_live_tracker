import 'package:flutter/material.dart';
import 'package:covidstatus/utilities/networking.dart';
import 'package:covidstatus/utilities/constants.dart';
import 'package:covidstatus/screens/worldwide.dart';
import 'package:covidstatus/screens/statewise.dart';
import 'package:covidstatus/screens/districtwise.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

const iconcolor = Colors.white;

class _StatisticsState extends State<Statistics> {
  CityScreen cityScreen = CityScreen();
  StateWise stateWise = StateWise();
  DistrictWise districtWise = DistrictWise();


  Future<dynamic> getGlobalStats() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://api.covid19api.com/summary');

    var stats = await networkHelper.getData();
    //print(stats);
    setState(() {
      if (stats == null) {

        totalConfirmed = 0;
        newConfirmed = 0;
        newDeaths = 0;
        totalDeaths = 0;
        newRecovered = 0;
        totalRecovered = 0;
        return;
      }

      totalConfirmed = stats['Global']['TotalConfirmed'];
      newConfirmed = stats['Global']['NewConfirmed'];
      newDeaths = stats['Global']['NewDeaths'];
      totalDeaths = stats['Global']['TotalDeaths'];
      newRecovered = stats['Global']['NewRecovered'];
      totalRecovered = stats['Global']['TotalRecovered'];
    });
    return ;
  }

  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

//  "NewConfirmed": 90841,
//  "TotalConfirmed": 3658565,
//  "NewDeaths": 4734,
//  "TotalDeaths": 257093,
//  "NewRecovered": 84832,
//  "TotalRecovered": 1195874



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    getGlobalStats();
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 50.0,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Image(
                  image: AssetImage("icons/graph.png"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Text("New Confirmed : $newConfirmed",
                            style: statsStyle)),
                    Expanded(
                        child: Text("Total Confirmed : $totalConfirmed",
                            style: statsStyle)),
                    Expanded(
                        child:
                            Text("New Deaths : $newDeaths", style: statsStyle)),
                    Expanded(
                        child: Text("Total Deaths : $totalDeaths",
                            style: statsStyle)),
                    Expanded(
                        child: Text("New Recovered : $newRecovered",
                            style: statsStyle)),
                    Expanded(
                        child: Text("Total Recovered : $totalRecovered",
                            style: statsStyle)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[

                    Text(" Click the refresh button to get current data ",style: TextStyle(
                      fontFamily: 'Spartan MB',
                      fontSize: 15.0,
                      color: Colors.white,
                      backgroundColor: Colors.black,
                    ),),
                    Text(" "),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: iconcolor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CityScreen();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage("icons/worldwide.png"),
                                ),
                                Text(
                                  "   Countrywise Statistics",
                                  style: TextStyle(
                                    fontFamily: 'Spartan MB',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(" "),
                    Text(" "),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: iconcolor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return StateWise();
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage("icons/india.png"),
                                ),
                                Text(
                                  "   Indian Statewise Statistics",
                                  style: TextStyle(
                                    fontFamily: 'Spartan MB',
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Text(" "),
                    Text(" "),

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
