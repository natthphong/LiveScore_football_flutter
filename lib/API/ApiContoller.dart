import 'dart:convert';


import 'package:grocery/API/ClassApi/League.dart';
import 'package:http/http.dart' as http;
import 'ClassApi/Math.dart';

class ApiContoller {
  static const apikey = "06d7f8cb64a4590d5793d8a60acdd8235885ecb788215fd7d2da7be4f5a39f21";

  static Future <List<Math>> getData(var Lid , var day , var month) async {

    /*test*/
    final apiMath = "https://apiv3.apifootball.com/?action=get_events&from=2022-${month}-${day}&to=2022-${month}-${day}&league_id=${Lid}&APIkey=$apikey";
    //final apiMath = "https://apiv3.apifootball.com/?action=get_events&from=2022-${mount}-${day}&to=2022-${mount+1}-${day}&league_id=3&APIkey=06d7f8cb64a4590d5793d8a60acdd8235885ecb788215fd7d2da7be4f5a39f21";
    List<Math> M = [];
    var res = await http.get(Uri.parse(apiMath));
    if (res.statusCode == 200) {

      var output = await jsonDecode(res.body);
      if(output.toString()=="{error: 404, message: No event found (please check your plan)!}"){
        M.add(Math.nul());
        return M;
      }
      for (var i in output) {
        Math m = Math.Json(i);
        M.add(m);
      }

      return M;
    } else {
      throw "Server is not Found";

    }
  }

  static Future<List<League>> getLeague() async {
    print('FETCH');
    var apiLeague = "https://apiv3.apifootball.com/?action=get_leagues&APIkey=$apikey";
    var res = await http.get(Uri.parse(apiLeague));
    var output = jsonDecode(res.body);

    List<League> listleague = [];

    for (var i in output) {
      League a = League.Json(i);
      listleague.add(a);
    }

    return listleague;
  }


}
