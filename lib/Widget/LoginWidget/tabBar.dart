import 'package:flutter/material.dart';

import '../../Pages/setting.dart';

class tabBar extends StatefulWidget {
  const tabBar({Key? key}) : super(key: key);

  @override
  State<tabBar> createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.sports_soccer_outlined, size: 35,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Football',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),

                  Icon(Icons.filter_list, size: 15,),


                ],
              ),
            ),
          )
          ,
          Row(children: [
            Icon(Icons.search_outlined, size: 20,),
            SizedBox(width: 16,),
            InkWell( onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>setting()));}, child: Icon(Icons.settings, size: 20,))
          ],)
        ],
      ),
    );
  }
}


// Widget tabBar() {
//   return Container(
//     margin: EdgeInsets.only(left: 10 , right: 10 ),
//     child: Row(
//       children: [
//         Expanded(
//           child: Container(
//             child: Row(
//               children: [
//                 Icon(Icons.sports_soccer_outlined,size: 35,),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Football',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//
//                 Icon(Icons.filter_list,size: 15,),
//
//
//               ],
//             ),
//           ),
//         )
//         ,
//             Row(children: [Icon(Icons.search_outlined,size: 20,) ,  SizedBox(width: 16,),Icon(Icons.settings,size: 20,) ],)
//         ],
//     ),
//   );
// }
