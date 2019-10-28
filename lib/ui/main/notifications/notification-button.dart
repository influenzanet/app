import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Ink(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          width: 48,
          height: 48,
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            highlightColor: Colors.red[100].withOpacity(0.5),
            splashColor: Colors.red[100].withOpacity(0.75),
            onTap: () {
              Navigator.of(context).pushNamed(MainNavigator.notificationRoute);
            },
            child: Center(
              child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(100)),
                  child: Center(
                      child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.0),
                  ))),
            ),
          ),
        ),
      ),
    );
  }
}
