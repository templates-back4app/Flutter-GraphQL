import 'package:back4appgraphqldemo/graphql_configration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DatabaseUtils{

  final String langName,saveFormat,objectId;

  DatabaseUtils({this.langName="",this.saveFormat="",this.objectId=""});

  String delete='''
  mutation DELETE_LANGUAGES(\$id: ID!){
    deleteLanguage(input: {id:\$id}){
      language{
        name,
        id
      }
    }
  }
  ''';

  String addData='''
  mutation CREATE_LANGUAGES(\$input: CreateLanguageFieldsInput){
    createLanguage(input: {fields: \$input}){
      language{
        name,
        saveFormat
      }
    }
  }
  ''';
  String update='''
  mutation UPDATE_LANGUAGES(\$id: ID!,\$input: UpdateLanguageFieldsInput){
    updateLanguage(input: {id:\$id, fields:\$input}){
      language{
        name,
        id
      }
    }
  }
  ''';

 Future<QueryResult> sendData() async{

   final variable ={
     "input":{
       "name" : langName,
       "saveFormat" : saveFormat,
     }
   };
   print('sendingData');

    GraphQlConfiguration configuration = GraphQlConfiguration();
   GraphQLClient client = configuration.clientToQuery();

   QueryResult queryResult = await client.query(
     QueryOptions(documentNode: gql(addData), variables: variable),
   );
   return queryResult;

 }
 Future<QueryResult> updateData() async{
   final variable={
     "id":objectId,
     "input":{
       "name" : langName
     }
   };

   GraphQlConfiguration configuration = GraphQlConfiguration();
   GraphQLClient client = configuration.clientToQuery();

   QueryResult queryResult = await client.query(
     QueryOptions(documentNode: gql(update), variables: variable),
   );
   return queryResult;
 }


 Future<QueryResult> deleteData() async{
   final variable={
     "id":objectId,
   };

   GraphQlConfiguration configuration = GraphQlConfiguration();
   GraphQLClient client = configuration.clientToQuery();

   QueryResult queryResult = await client.query(
     QueryOptions(documentNode: gql(delete), variables: variable),
   );

   return queryResult;
 }

 Future<QueryResult> addRelation(String rowObjectId, String relationId) async{
   //code for add/update Relation.
   print('addRelation');
 }

 Future<QueryResult> deleteRelation(String rowObjectId, String relationId) async{
   print('deleteRelation');
   //code for delete Relation
 }

 Future<QueryResult> addPointers(String rowObjectId, String PointersId) async{
   print('addPointers');
   //code for add/update Pointers
 }

 Future<QueryResult> deletePointers(String rowObjectId, String PointersId) async{
   print('deletePointers');
   //code for delete pointers
 }

 Future<QueryResult> addGeoPointers(String rowObjectId, String latitude, String longitude) async{
   print('add GeoPointers');
   //code for add/update Geopointers
 }

 Future<QueryResult> addDateTime(String rowObjectId, String dateTime) async{
   print('addDateTime');
   //code for add/update date-time
 }

}
