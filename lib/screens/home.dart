import 'package:coffee_ui/constants/color_palette.dart';
import 'package:coffee_ui/screens/black_gold.dart';
import 'package:coffee_ui/screens/cold_brew.dart';
import 'package:coffee_ui/screens/gold_brew.dart';
import 'package:coffee_ui/screens/macafe.dart';
import 'package:coffee_ui/screens/nescafe.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final colorPalette = ColorPalette();
  var _selectOption = 0;
  List allOptions = [
    GoldBrew(),
    ColdBrew(),
    Macafe(),
    Nescafe(),
    BlackGold(),
  ];
  List isSelected = [true, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    var screenHight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: screenHight,
          width: screenWidth,
          color: Colors.transparent,
        ),
        Container(
          height: screenHight,
          width: screenWidth / 5,
          color: colorPalette.leftBarColor,
        ),
        Positioned(
          left: screenWidth / 5,
          child: Container(
            height: screenHight,
            width: screenWidth - (screenWidth / 5),
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 35.0,
          left: 20.0,
          child: Icon(
            Icons.menu,
          ),
        ),
        Positioned(
          top: 35.0,
          right: 20.0,
          child: Icon(Icons.shopping_bag_outlined),
        ),
        Positioned(
          top: screenHight - (screenHight - 100.0),
          left: (screenWidth / 5) + 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CoffeHouse",
                style: TextStyle(
                    fontFamily: "BigShouldersText",
                    color: Colors.indigo[900],
                    fontSize: 40.0),
              ),
              Text(
                "A lot can happen over coffee",
                style: TextStyle(
                    fontFamily: "BigShouldersText",
                    color: Colors.grey[400],
                    fontSize: 15.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 40.0,
                width: 225.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
                    hintText: "Search...",
                    hintStyle: TextStyle(
                        fontFamily: "BigShouldersText",
                        color: Colors.grey[400],
                        fontSize: 15.0),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        buildSideNavigator(),
        Positioned(
            top: (screenHight / 3) + 5.0,
            left: (screenWidth / 5) + 25.0,
            child: Container(
                height: screenHight - ((screenHight / 3) + 50.0),
                width: screenWidth - ((screenWidth / 5) + 40.0),
                child: allOptions[_selectOption]))
      ],
    ));
  }

  buildSideNavigator() {
    return Positioned(
        top: 75.0,
        child: RotatedBox(
          quarterTurns: 3,
          child: Container(
            width: MediaQuery.of(context).size.height - 100.0,
            height: MediaQuery.of(context).size.width / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOption("Black Gold", 0),
                buildOption("Macafe", 1),
                buildOption("Nescafe", 2),
                buildOption("Cold Brew", 3),
                buildOption("Gold Brew", 4),
              ],
            ),
          ),
        ));
  }

  buildOption(String name, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.indigo[900]),
              )
            : Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent)),
        SizedBox(
          height: 5.0,
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                _selectOption = index;
                isOptionSelected(index);
              },
            );
          },
          child: Text(
            name,
            style: isSelected[index]
                ? TextStyle(
                    fontFamily: "BigShouldersText",
                    color: Colors.indigo[900],
                    fontSize: 18.0)
                : TextStyle(
                    fontFamily: "BigShouldersText",
                    color: Colors.grey[400],
                    fontSize: 17.0),
          ),
        )
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
