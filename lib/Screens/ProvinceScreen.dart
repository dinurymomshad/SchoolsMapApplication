import 'package:flutter/material.dart';
import 'package:schoolsmapapplication/Screens/MapScreen.dart';

class ProvinceScreen extends StatefulWidget {
  @override
  _ProvinceScreenState createState() => _ProvinceScreenState();
}

TextStyle style = TextStyle(fontSize: 25);

class _ProvinceScreenState extends State<ProvinceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schools Map App"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Image.asset(
            "images/school.png",
            height: 50,
            width: 50,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Click on the province of \n                interest",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          buttons("  All", context),
          buttons("Eastern Cape", context),
          buttons("Gauteng", context),
          buttons("KwaZulu-Natal", context),
          buttons("Limpopo", context),
          buttons("Mpumalanga", context),
          buttons("Northern Cape", context),
          buttons("North West", context),
          buttons("Western Cape", context),
        ],
      ),
    );
  }
}

Widget buttons(String name, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
    child: Card(
        elevation: 10.0,
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(""),
                Text(
                  name,
                  style: style,
                ),
                Icon(
                  Icons.navigate_next,
                  size: 40,
                )
              ],
            ),
          ),
        )),
  );
}
