import 'package:back4appgraphqldemo/constants.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'constants.dart';


class GraphQlConfiguration {

 GraphQLClient clientToQuery({String sessionToken}) {

   var httpLink = HttpLink(
     uri: 'https://parseapi.back4app.com/graphql',
     headers: {
      'X-Parse-Application-Id' : kParseApplicationId,
      'X-Parse-Client-Key' : kParseClientKey,
      'X-Parse-Master-Key': kParseMasterKey,
      //'X-Parse-REST-API-Key' : kParseRestApiKey,
    },
   );


   return GraphQLClient(
     cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
     link: httpLink,
   );
 }


}