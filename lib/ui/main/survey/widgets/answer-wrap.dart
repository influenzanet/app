import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class AnswerWrap extends Container {
   AnswerWrap(
      {List<Widget> children,
     })
      : super(
          decoration: BoxDecoration(
            color: ThemeElements.canvasColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: children,
            ),
          )
      );

}
