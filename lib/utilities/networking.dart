import 'package:http/http.dart' as http ;
import 'dart:convert';

class NetworkHelper{

  NetworkHelper(this.url);

  String url;

  Future getData() async {
    http.Response response =await http.get(url);
    if(response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);

      //------------------------IMPORTANT NOTE------------------------------------
      //--------------------------------------------------------------------------
      //
      // WE USED var DATA TYPE BECAUSE IT IS DYNAMIC AND jsonDecode IS ALSO DYNAMIC
      //
      //--------------------------------------------------------------------------
    }else{
      print(response.statusCode);
    }
  }

}