import 'package:back4appgraphqldemo/add_geopointer.dart';
import 'package:back4appgraphqldemo/add_pointer.dart';
import 'package:back4appgraphqldemo/add_relation.dart';
import 'package:flutter/material.dart';

import 'add_date-time.dart';

class ComplexMutationPage extends StatelessWidget {
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
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.green,
                  onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>AddRelation()
                      ),);
                  },
                  child: Center(
                    child: Text(
                      'Add Relation',
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
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>AddPointer()
                    ),);
                  },
                  child: Center(
                    child: Text(
                      'Add Pointers',
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
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>AddGeoPointer()
                    ),);
                  },
                  child: Center(
                    child: Text(
                      'Add Geopointers',
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
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>AddDateTime()
                    ),);
                  },
                  child: Center(
                    child: Text(
                      'Add Date-time',
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
