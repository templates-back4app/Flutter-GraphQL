import 'package:back4appgraphqldemo/mutation_options.dart';
import 'package:back4appgraphqldemo/main.dart';
import 'package:flutter/material.dart';

class AppUI extends StatefulWidget {
  final Function sendDataButtonPressed,
      deleteDataButtonPressed,
      updateButtonPressed,
      onChangedName,
      onChangedSaveFormat,
      onChangedObjectId;

  const AppUI(
      {this.onChangedName,
      this.onChangedObjectId,
      this.onChangedSaveFormat,
      this.deleteDataButtonPressed,
      this.updateButtonPressed,
      this.sendDataButtonPressed});

  @override
  _AppUIState createState() => _AppUIState();
}

class _AppUIState extends State<AppUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mutation Page'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'complex_mutation',
              child: Text(
                'CM',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>ComplexMutationPage()
                ),);
              }),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: 'query_page',
            child: Text(
              'Q',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: ((context) {
                  return MyApp();
                }),),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                //Language name TextBox
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                      hintText: 'Enter Language name',
                    ),
                    onChanged: widget.onChangedName,
                  ),
                ),

                //saveFormat text box
                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                      hintText: 'Enter save format',
                    ),
                    onChanged: widget.onChangedSaveFormat,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.green,
                    onPressed: widget.sendDataButtonPressed,
                    child: Center(
                      child: Text(
                        'Send Data',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
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
                      hintText: 'ObjectId',
                    ),
                    onChanged: widget.onChangedObjectId,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.green,
                    onPressed: widget.updateButtonPressed,
                    child: Center(
                      child: Text(
                        'Update data',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.green,
                    onPressed: widget.deleteDataButtonPressed,
                    child: Center(
                      child: Text(
                        'Delete data',
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
        ],
      ),
    );
  }
}
