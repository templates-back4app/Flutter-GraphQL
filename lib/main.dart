import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'constants.dart';
import 'dart:ui';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import "programing_languages_model.dart";

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
        cache: InMemoryCache(),
        link: httpLink,
      ),
    );
    return MaterialApp(
      home: GraphQLProvider(
        child: CacheProvider(
          child: MyHomePage(),
        ),
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
  SharedPreferences sharedPrefs;
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

  Future<void> _getPrefs() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProgrammingLanguageList>(
        future: SharedPreferencesHelper.getCache(),
        builder: (prefs, snapshot) {
          final offlineData = snapshot.data;
          if (!snapshot.hasError) {
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
                    final data = result.data == null
                        ? offlineData
                        : programmingLanguageListFromJson(
                            jsonEncode(result.data));
                    if (data == null) {
                      return Center(
                          child: Text(
                        "Loading...",
                        style: TextStyle(fontSize: 20.0),
                      ));
                    } else {
                      SharedPreferencesHelper.setCache(data);
                      return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Center(
                              child: RaisedButton(
                                onPressed: refetch,
                                child: result.loading == true
                                    ? Text("Loading...")
                                    : Text("Refetch"),
                              ),
                            );
                          }
                          return ListTile(
                            title: Text(data.programmingLanguages
                                .edges[index - 1].node.name),
                            trailing: Text(data.programmingLanguages
                                    .edges[index - 1].node.stronglyTyped
                                ? "Strongly Typed"
                                : "Weekly Typed"),
                          );
                        },
                        itemCount: data.programmingLanguages.edges.length + 1,
                      );
                    }
                  },
                ),
              ),
            );
          }
          return Center(
            child: Text("Loading"),
          );
        });
  }
}

class SharedPreferencesHelper {
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static final String _offline_cache_key = 'programmingLanguageListResponse';

  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static Future<ProgrammingLanguageList> getCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cache = prefs.getString(_offline_cache_key);
    final offlineData =
        cache != null ? programmingLanguageListFromJson(cache) : null;

    return offlineData;
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------
  static Future<bool> setCache(dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_offline_cache_key, jsonEncode(value));
  }
}

