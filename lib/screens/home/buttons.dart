import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ButtonsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(20),
        child: IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Share.share(
                'Check out Rich Flutter app on Google Play \n'
                'https://play.google.com/store/apps/details?'
                'id=com.lins.rich_flutter',
                subject: 'Rich Flutter app');
          },
          color: Color(0xf1fcff).withOpacity(0.7),
        ),
      );
}
