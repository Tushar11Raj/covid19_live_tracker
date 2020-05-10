
import 'package:covidstatus/utilities/networking.dart';

class FetchData{

  Future<dynamic> getGlobalStats() async{
    NetworkHelper networkHelper = NetworkHelper('https://api.covid19api.com/summary');

    var stats =await networkHelper.getData();
    print(stats);
    return stats;
  }

}