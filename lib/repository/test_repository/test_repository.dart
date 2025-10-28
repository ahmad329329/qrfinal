
import 'package:qrfinal/data/network/network_api_servies.dart';
import 'package:qrfinal/res/ap_url/app_url.dart';


class TestRepository{

  final _apiServices= NetworkApiServices();

  Future <dynamic> testapi() async{
    dynamic response = _apiServices.postapi({}, AppUrl.testApi);
    return response;

  }
}