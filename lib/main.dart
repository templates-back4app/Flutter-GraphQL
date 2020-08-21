import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'consonents.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GraphQLProvider(
          child: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Parsing data using GraphQL',
          ),
        ),
        body: Container(),
    ),);
  }
}
