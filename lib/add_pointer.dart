import 'package:back4appgraphqldemo/database_utils.dart';
import 'package:flutter/material.dart';

class AddPointer extends StatefulWidget {
  @override
  _AddPointerState createState() => _AddPointerState();
}

class _AddPointerState extends State<AddPointer> {
  TextEditingController pointerController = TextEditingController();

  TextEditingController objectIdController = TextEditingController();

  DatabaseUtils utils;

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
                controller: pointerController,
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
                  hintText: 'ObjectId of pointer',
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
                  utils.addPointers(objectIdController.text.trim(),
                      pointerController.text.trim());
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
              child: FlatButton(
                color: Colors.green,
                onPressed: () {
                  utils = DatabaseUtils();
                  utils.deletePointers(
                      objectIdController.text.trim(),
                      pointerController.text.trim()
                  );
                },
                child: Center(
                  child: Text(
                    'Delete',
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
