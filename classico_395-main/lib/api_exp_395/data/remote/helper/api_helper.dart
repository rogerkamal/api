import 'dart:convert';
import 'dart:io';

import 'package:classico_395/api_exp_395/data/remote/helper/app_exception.dart';
import 'package:http/http.dart' as http;

class ApiHelper{
  ///get

/*  static Future<dynamic> getApi({required String url}) async {
    http.Response res = await http.get(Uri.parse(url));

    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }else{
      return null;
    }
  }*/


   Future<dynamic> getApi({required String url}) async {
    try{
      http.Response res = await http.get(Uri.parse(url));
      return returnResponse(res);
    } on SocketException catch (e){
      throw NoInternetException(msg: "Not connected to the internet");
    } catch (e){
      throw MyException(title: "Some thing went wrong", message: e.toString());
    }

}


   dynamic returnResponse(http.Response res){

    switch(res.statusCode){

      case 200: {
        return jsonDecode(res.body);
      }

      case 400: {
        throw BadRequestException(msg: "Bad Request");
      }

      case 401: {
        throw UnauthorizedException(msg: "Unauthorised");
      }

      case 404: {
        throw NotFoundException(msg: "Not Found");
      }

      case 500:
      default: {
        throw ServerException(msg: "Internal Server Error");
      }

    }

  }


}