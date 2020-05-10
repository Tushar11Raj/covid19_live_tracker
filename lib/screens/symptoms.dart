import 'package:flutter/material.dart';
import 'package:covidstatus/utilities/constants.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black38,
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
                  size: 40.0,
                ),
              ),
            ),
            Container(padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("  ",style: tileStyle,),
                  Text("Most common symptoms:",style: kInfoTextStyleBold,),
                  Text("  1. fever",style: tileStyle,),
                  Text("  2. dry cough",style: tileStyle,),
                  Text("  3. tiredness",style: tileStyle,),
                  Text("  ",style: tileStyle,),
                  Text("Less common symptoms:",style: kInfoTextStyleBold,),
                  Text("  1. aches and pains",style: tileStyle,),
                  Text("  2. sore throat",style: tileStyle,),
                  Text("  3. diarrhoea",style: tileStyle,),
                  Text("  4. conjunctivitis",style: tileStyle,),
                  Text("  5. headache",style: tileStyle,),
                  Text("  6. loss of taste or smell",style: tileStyle,),
                  Text("  7. a rash on skin, or discolouration of fingers or toes",style: tileStyle,),
                  Text("  ",style: tileStyle,),
                  Text("Serious symptoms:",style: kInfoTextStyleBold,),
                  Text("  1. difficulty breathing or shortness of breath",style: tileStyle,),
                  Text("  2. chest pain or pressure",style: tileStyle,),
                  Text("  3. loss of speech or movement",style: tileStyle,),
                  Text("  ",style: kInfoTextStyle,),
                  Text("Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility.",style: tileStyle,),
                  Text("People with mild symptoms who are otherwise healthy should manage their symptoms at home.",style: tileStyle,),

                ],
              ),
            ),
            ],
        ),
      ),
    );
  }
}
