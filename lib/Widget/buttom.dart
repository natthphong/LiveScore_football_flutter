import 'package:flutter/material.dart';

class buttom extends StatefulWidget {
  const buttom({Key? key}) : super(key: key);

  @override
  State<buttom> createState() => _buttomState();
}

class _buttomState extends State<buttom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [Icon(Icons.stadium), Text('All Games')],
            ),
            Column(
              children: [Icon(Icons.live_tv_outlined), Text('Live')],
            ),
            Column(
              children: [Icon(Icons.star_border_outlined), Text('Favorites')],
            ),
            Column(
              children: [Icon(Icons.wine_bar_outlined), Text('Standings')],
            )
          ],
        ),
      ),
    );
  }
}
