
import 'package:qrfinal/data/network/network_api_servies.dart';
import 'package:qrfinal/res/ap_url/app_url.dart';


class LoginRepository{

  final _apiServices= NetworkApiServices();

  Future <dynamic> loginapi(var data) async{
    dynamic response = _apiServices.postapi(data, AppUrl.loginApi);
    return response;

  }
}