
import 'package:testapp/global/allimports.dart';

class MainController {

//Get Hotel Details
 static Future<List<HotelListModel>> getHotels() async {
    List<HotelListModel> Datalist = [];

    Response response = await getRequest(HotelsApi);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result['status'] == 200) {
        Datalist = HotellistModelFromJson(jsonEncode(result['data']));
      } else {
        Datalist = [];
      }
    } else {
      Datalist = [];
    }
    return Datalist;
  }

  
}