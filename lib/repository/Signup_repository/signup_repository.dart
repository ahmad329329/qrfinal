
import 'package:qrfinal/data/network/network_api_servies.dart';
import 'package:qrfinal/res/ap_url/app_url.dart';


class SignupRepository{

  final _apiServices= NetworkApiServices();

  Future <dynamic> signup(var data) async{
    dynamic response = _apiServices.postapi(data, AppUrl.signupApi);
    return response;
  }
}