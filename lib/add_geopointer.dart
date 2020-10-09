import 'package:back4appgraphqldemo/database_utils.dart';
import 'package:flutter/material.dart';

class AddGeoPointer extends StatefulWidget {
  @override
  _AddGeoPointerState createState() => _AddGeoPointerState();
}

class _AddGeoPointerState extends State<AddGeoPointer> {
  DatabaseUtils utils;

  TextEditingController latitudeController = TextEditingController();

  TextEditingController longitudeController = TextEditingController();

  TextEditingController objectIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Complex Muatation'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: TextField(
                controller: objectIdController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.yellow,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'ObjectId of row',
                ),
                onChanged: (text) {},
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: TextField(
                controller: latitudeController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.yellow,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Enter Latitude',
                ),
                onChanged: (text) {},
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: TextField(
                controller: longitudeController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.yellow,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Enter Longitude',
                ),
                onChanged: (text) {},
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
              child: FlatButton(
                color: Colors.green,
                onPressed: () {
                  utils = DatabaseUtils();
                  utils.addGeoPointers(
                      objectIdController.text.trim(),
                      latitudeController.text.trim(),
                      longitudeController.text.trim());
                },
                child: Center(
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
