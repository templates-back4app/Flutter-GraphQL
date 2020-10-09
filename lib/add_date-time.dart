import 'package:back4appgraphqldemo/database_utils.dart';
import 'package:flutter/material.dart';

class AddDateTime extends StatefulWidget {

  @override
  _AddDateTimeState createState() => _AddDateTimeState();
}

class _AddDateTimeState extends State<AddDateTime> {
  TextEditingController dateTime = TextEditingController();
  DatabaseUtils utils = DatabaseUtils();
  TextEditingController objectIdController =TextEditingController();

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
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: TextField(
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
               controller: objectIdController,
               // onChanged: (text){},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: TextField(
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
                  hintText: 'Enter Date Time',
                ),
               // onChanged: (text){},
                controller: dateTime,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
              child: FlatButton(
                color: Colors.green,
                onPressed: (){
                  utils = DatabaseUtils();
                  utils.addDateTime(objectIdController.text.trim(),
                  dateTime.text.trim()
                  );
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
