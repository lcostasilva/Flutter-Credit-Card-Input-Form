import 'package:flutter/material.dart';
import 'package:flutter_credit_card/provider/card_name_provider.dart';
import 'package:flutter_credit_card/provider/state_provider.dart';
import 'package:flutter_credit_card/util/util.dart';
import 'package:provider/provider.dart';

import 'package:flutter_credit_card/constants/constanst.dart';

class YellowBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentState = Provider.of<StateProvider>(context).getCurrentState();

    final align = getAlign(currentState);
    final height = getHeight(currentState);
    final width = getWidth(context, currentState);
    final margin = getMargin(currentState);

    return AnimatedAlign(
      child: AnimatedContainer(
        margin: margin,
        duration: Duration(milliseconds: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.yellow, //                   <--- border color
            width: 1.0,
          ),
        ),
        height: height,
        width: width,
      ),
      alignment: align,
      duration: Duration(milliseconds: 300),
    );
  }

  Alignment getAlign(currentState) {
    var align = Alignment.centerLeft;
    switch (currentState) {
      case InputState.NUMBER:
        align = Alignment.centerLeft;
        break;
      case InputState.NAME:
        align = Alignment.bottomLeft;
        break;
      case InputState.CVV:
      case InputState.VALIDATE:
        align = Alignment.bottomRight;
        break;
    }
    return align;
  }

  double getHeight(InputState currentState) {
    var height = 0.0;
    switch (currentState) {
      case InputState.NUMBER:
        height = textSize('1234  5678  1234', kCardNumberTextStyle).height + 15;
        break;
      case InputState.NAME:
        height = textSize('hello world', kNametextStyle).height + 15;
        break;
      case InputState.CVV:
      case InputState.VALIDATE:
        height = textSize('12/12', kNametextStyle).height + 15;
        break;
    }
    return height;
  }

  double getWidth(context, currentState) {
    var width = 330.0;
    switch (currentState) {
      case InputState.NUMBER:
        width =
            textSize('XXXX XXXX XXXX XXXX', kCardDefaultTextStyle).width +
                10;
        break;
      case InputState.NAME:
        String name = Provider.of<CardNameProvider>(context).cardName;
        if (name.isEmpty) {
          name = 'NAME SURNAME';
        }

        width = textSize(name, kNametextStyle).width + 10;
        break;
      case InputState.CVV:
      case InputState.VALIDATE:
        width = textSize('MM/YY', kNametextStyle).width + 10;
        break;
    }
    return width;
  }

  getMargin(InputState currentState) {
    var lefrMargin = 0.0;
    var rightMargin = 0.0;
    switch (currentState) {
      case InputState.NUMBER:
        break;
      case InputState.NAME:
        lefrMargin = 2.5;
        break;
      case InputState.CVV:
        break;
      case InputState.VALIDATE:
        rightMargin = 3;

        break;
    }
    return EdgeInsets.only(left: lefrMargin, right: rightMargin);
  }
}
