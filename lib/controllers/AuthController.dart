
import 'package:testapp/global/allimports.dart';

class AuthConroller {
  
  //Check auth for login state
  static Future<bool> checkAuth() async {
    bool Status = false;
    await SecureStoreage.getFromSecureStorage("Is_Login").then((status) {
      Status = Converts.ConvertStringToBool(status.toString());
    });
    return Status;
  }

  //Acount logout
  static Future<void> AccountLogout() async {
    await SecureStoreage.deleteFromSecureStorage("Is_Login");
  }
}