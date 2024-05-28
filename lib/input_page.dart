import 'dart:math';
import 'reusable_container.dart';
import 'icon_content.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeContainerColor = Color(0xFF1D1E33);
const inactiveContainerColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleContainerColor = inactiveContainerColor;
  Color femaleContainerColor = inactiveContainerColor;

  void updateColor(int gender) {
    setState(() {
      if (gender == 1) {
        maleContainerColor = maleContainerColor == inactiveContainerColor
            ? activeContainerColor
            : inactiveContainerColor;
        femaleContainerColor = inactiveContainerColor;
      } else {
        femaleContainerColor = femaleContainerColor == inactiveContainerColor
            ? activeContainerColor
            : inactiveContainerColor;
        maleContainerColor = inactiveContainerColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: () {
                      updateColor(1);
                    },
                    child: ReusableContainer(
                      colorr: maleContainerColor,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: () {
                      updateColor(2);
                    },
                    child: ReusableContainer(
                      colorr: femaleContainerColor,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: activeContainerColor,
              ),
              height: 200.0,
              width: 400.0,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    colorr: activeContainerColor,
                    cardchild: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'AE',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colorr: activeContainerColor,
                    cardchild: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'MALE0',
                          style: TextStyle(fontSize: 18.0, color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: bottomContainerHeight,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: bottomContainerColor,
            ),
          ),
        ],
      ),
    );
  }
}
