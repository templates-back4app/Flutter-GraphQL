import 'package:back4appgraphqldemo/app_ui.dart';
import 'package:back4appgraphqldemo/database_utils.dart';
import 'package:flutter/material.dart';

class MutationPage extends StatelessWidget {

  String langName,saveFormat,objectId;
  DatabaseUtils utils;

  @override
  Widget build(BuildContext context) {
    return AppUI(
      onChangedName: (text){
        langName=text;
      },
      onChangedSaveFormat: (text){
        saveFormat=text;
        },
      onChangedObjectId: (text){
        objectId=text;
      },

      sendDataButtonPressed: (){
        if(langName.isNotEmpty && saveFormat.isNotEmpty){
          utils = DatabaseUtils(
            langName: langName,
            saveFormat: saveFormat ,
          );
          utils.sendData();
        }
      },
      deleteDataButtonPressed: (){
        if(objectId.isNotEmpty){
          utils = DatabaseUtils(
            objectId: objectId,
          );
          utils.deleteData();
        }
      },
      updateButtonPressed: (){
        if(langName.isNotEmpty && saveFormat.isNotEmpty && objectId.isNotEmpty){
          utils = DatabaseUtils(
            langName: langName,
            saveFormat: saveFormat ,
            objectId: objectId
          );
          utils.updateData();
        }
      },
    );
  }
}
