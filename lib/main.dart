import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'constants.dart';
import 'dart:ui';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      uri: kParseApiUrl,
      headers: {
        'X-Parse-Application-Id': kParseApplicationId,
        'X-Parse-Client-Key': kParseClientKey,
        'X-Parse-REST-API-Key': kParseRestApiKey
      }, //getheaders()
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        link: httpLink,
      ),
    );

    return MaterialApp(
      home: GraphQLProvider(
        child: MyHomePage(),
        client: client,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name;
  String saveFormat;
  String objectId;

  String query = '''
    query {
      programmingLanguages {
        edges {
          node {
            id
            name
            stronglyTyped
          }
        }
      }
    }
  ''';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Parsing data using GraphQL',
          ),
        ),
        body: Query(
          options: QueryOptions(
            documentNode: gql(query),
          ),
          builder: (
            QueryResult result, {
            Refetch refetch,
            FetchMore fetchMore,
          }) {
            print(result.exception);
            if (result.data == null) {
              return Center(
                  child: Text(
                "Loading...",
                style: TextStyle(fontSize: 20.0),
              ));
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(result.data["programmingLanguages"]["edges"]
                        [index]["node"]['name']),
                    trailing: Text(result.data["programmingLanguages"]["edges"]
                            [index]["node"]['stronglyTyped']
                        ? "Strongly Typed"
                        : "Weekly Typed"),
                  );
                },
                itemCount: result.data["programmingLanguages"]["edges"].length,
              );
            }
          },
        ),
      ),
    );
  }
}
