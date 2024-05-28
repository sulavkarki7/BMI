import 'dart:math';
import 'reusable_container.dart';
import 'icon_content.dart';
import 'constant.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  // Color maleContainerColor = inactiveContainerColor;
  // Color femaleContainerColor = inactiveContainerColor;

  // void updateColor(Gender selectedGender) {
  //   setState(() {
  //     if (selectedGender == Gender.male) {
  //       maleContainerColor = maleContainerColor == inactiveContainerColor          ? activeContainerColor
  //           : inactiveContainerColor;
  //       femaleContainerColor = inactiveContainerColor;
  //     }
  //     if (selectedGender == Gender.female) {
  //       femaleContainerColor = femaleContainerColor == inactiveContainerColor           ? activeContainerColor
  //           : inactiveContainerColor;
  //       maleContainerColor = inactiveContainerColor;
  //     }
  //   });
  // }

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender =
                            selectedGender == Gender.male ? null : Gender.male;
                      });
                    },
                    child: ReusableContainer(
                      colorr: selectedGender == Gender.male
                          ? kActiveContainerColor
                          : kInactiveContainerColor,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = selectedGender == Gender.female
                            ? null
                            : Gender.female;
                      });
                    },
                    child: ReusableContainer(
                      colorr: selectedGender == Gender.female
                          ? kActiveContainerColor
                          : kInactiveContainerColor,
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
            // child: Container(
            //   margin: EdgeInsets.all(15.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     color: kActiveContainerColor,
            //   ),
            //   height: 200.0,
            //   width: 400.0,
            // ),
            child: ReusableContainer(
              colorr: kActiveContainerColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      label: '$height',
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    colorr: kActiveContainerColor,
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
                    colorr: kActiveContainerColor,
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
            height: kBottomContainerHeight,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kBottomContainerColor,
            ),
          ),
        ],
      ),
    );
  }
}
