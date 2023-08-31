import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Services/ChatProvider.dart';
class ActionButtonSmall extends StatelessWidget {
  final route;
  final title;
  final Color color;
  const ActionButtonSmall({Key? key, this.route, this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context) ;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          if(title=='Cancel')
            {
              Navigator.pop(context);
            }
            else {
              chatProvider.dispose();
              Navigator.pushNamed(context, route);
          }
        },
        child: Container(
          height:50,
          width: 150,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(32)),
          child: Center(
            child: Text(
              title,
              style:   TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
