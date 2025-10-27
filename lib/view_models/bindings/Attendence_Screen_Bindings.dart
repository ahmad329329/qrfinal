
import 'package:get/get.dart';
import 'package:qrfinal/view_models/Controller/Attendence_Screen_Controller.dart';


class AttendenceScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendenceScreenController>(() => AttendenceScreenController());
  }
}
