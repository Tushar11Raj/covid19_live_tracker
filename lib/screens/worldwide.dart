import 'package:flutter/material.dart';
import 'package:covidstatus/utilities/constants.dart';
import 'package:covidstatus/utilities/networking.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String countryName;
  String cName;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  //Countries[0].Country

//  void updateUI(dynamic stats,int countryCode) {
//    setState(() {
//      if (stats == null) {
//        countryName="Not Selected";
//        newConfirmed=0;
//        totalConfirmed=0;
//        newDeaths=0;
//        totalDeaths=0;
//        newRecovered=0;
//        totalRecovered=0;
//        return;
//      }
//      countryName=stats['Countries'][countryCode]['Country'];
//      newConfirmed=stats['Countries'][countryCode]['NewConfirmed'];
//      totalConfirmed=stats['Countries'][countryCode]['TotalConfirmed'];
//      newDeaths=stats['Countries'][countryCode]['NewDeaths'];
//      totalDeaths=stats['Countries'][countryCode]['TotalDeaths'];
//      newRecovered=stats['Countries'][countryCode]['NewRecovered'];
//      totalRecovered=stats['Countries'][countryCode]['TotalRecovered'];
//
//    });
//  }

  Future<dynamic> getGlobalStats(String name) async {
    NetworkHelper networkHelper =
        NetworkHelper('https://api.covid19api.com/summary');

    var stats = await networkHelper.getData();

    setState(() {
      if (stats == null) {
        countryName = "ERROR !!";
        newConfirmed = 0;
        totalConfirmed = 0;
        newDeaths = 0;
        totalDeaths = 0;
        newRecovered = 0;
        totalRecovered = 0;
        return;
      }
      int cc = 0;
      //print(stats);
      while (cc < 248) {
        print('* $cc');
        String tep = stats['Countries'][cc]['Country'];

        print(tep);
        if (tep == name) {
          print(stats['Countries'][cc]['NewDeaths']);
          break;
        } else
          cc++;
      }

      if(cc==248){
        countryName = "Not a country name. Don't use abbreviations!!";
        newConfirmed = 0;
        totalConfirmed = 0;
        newDeaths = 0;
        totalDeaths = 0;
        newRecovered = 0;
        totalRecovered = 0;
        return;
      }

      countryName = stats['Countries'][cc]['Country'];
      newConfirmed = stats['Countries'][cc]['NewConfirmed'];
      totalConfirmed = stats['Countries'][cc]['TotalConfirmed'];
      newDeaths = stats['Countries'][cc]['NewDeaths'];
      totalDeaths = stats['Countries'][cc]['TotalDeaths'];
      newRecovered = stats['Countries'][cc]['NewRecovered'];
      totalRecovered = stats['Countries'][cc]['TotalRecovered'];
    });

    //print(stats);
    return stats;
  }

  // ignore: missing_return
//  int getCountryCode(String name){
//    int cc=0;
//    dynamic stats = getGlobalStats();
//    print("getCountryCode called");
//    //print(stats);
//    while(cc<251){
//      print('*');
//      String tep =stats['Countries'][cc]['Country'];
//
//      print(tep);
//      if(tep==name) {
//        print(stats['Countries'][cc]['NewDeaths']);
//        return cc;
//      }
//      else
//        cc++;
//      print(cc);
//    }
//  }

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
                  decoration: kTextInputFieldDecorationCountry,
                  onChanged: (value) {
                    cName = value;
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
                    getGlobalStats(cName);
                    print("button functions end");
                  },
                  child: Text(
                    'Get data for the country',
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
                          child: Text("Country : $countryName",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("New Confirmed : $newConfirmed",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("Total Confirmed : $totalConfirmed",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("New Deaths : $newDeaths",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("Total Deaths : $totalDeaths",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("New Recovered : $newRecovered",
                              style: kInfoTextStyle)),
                      Expanded(
                          child: Text("Total Recovered : $totalRecovered",
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
