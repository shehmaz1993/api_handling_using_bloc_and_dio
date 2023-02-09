import 'dart:developer';

import 'package:api_handleing_with_bloc_and_dio/data/modelclass.dart';
import 'package:dio/dio.dart';

import 'API/api_handler.dart';

class Repository{
    API api=API();
   Future<List<TodoClass>>  fetchPosts()async{
      try{
       Response response=  await api.sendRequest.get('/todos');
       //log(response.data);
        List<dynamic> lst=response.data;
        return lst.map((element) => TodoClass.fromJson(element)).toList();
      }
      catch(ex){
        throw  ex;
      }
  }



}