import 'package:covidstatus/utilities/constants.dart';
import 'package:flutter/material.dart';

class Precautions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 40.0,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    // A fixed-height child.
                    color: Color(0xffb0099CC),
                    child: Text("PRECAUTIONS PROPOSED BY WHO:",style: TextStyle(color: Colors.orangeAccent,decoration: TextDecoration.none ,fontFamily: 'Spartan MB',),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('images/1.png'),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('images/2.png'),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('images/3.png'),),
                  ),
                ],
              ),
            ),
          );
        },

    );
  }
}
