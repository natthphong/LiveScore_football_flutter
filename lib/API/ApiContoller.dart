import 'dart:convert';


import 'package:http/http.dart' as http;
import 'ClassApi/Math.dart';

class ApiContoller {

    static Future <List<Math> >getData() async{
      var time = DateTime.now();
      var mount = time.month;
      var day  =time.day;
     final apiMath = "https://apiv3.apifootball.com/?action=get_events&from=2022-${mount}-${day}&to=2022-${mount+1}-${day}&league_id=3&APIkey=06d7f8cb64a4590d5793d8a60acdd8235885ecb788215fd7d2da7be4f5a39f21";


    var res = await http.get(Uri.parse(apiMath));
    if (res.statusCode == 200) {
      var output = await jsonDecode(res.body);
      List<Math> M = [];
      for ( var i in output){
            Math m = Math.Json(i);
            M.add(m);
        }
      //List<Math> M  =  output.map((e) => Math.Json(e)).toList();
      print(M.runtimeType);
      return M;
    }else{
      throw 'Server connection failed!';
    }

  }

}
