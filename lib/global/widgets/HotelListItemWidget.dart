// ignore_for_file: must_be_immutable
//Hotel List Item
import 'package:nb_utils/nb_utils.dart';
import 'package:testapp/global/allimports.dart';


class HotelListItemWidget extends StatelessWidget {
  HotelListModel hotel;
  HotelListItemWidget({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
          Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 400),
                  type: PageTransitionType.rightToLeft,
                  child: DetailsPage(hotel: hotel)));
      }),
      child: Card(
        child: Container(
          width: context.width(),
          height: 80,
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"),
                  ),
                ),
              ),
              10.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                Container(
                  width: context.width()/1.5,
                  child: Text(hotel.title,style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,maxLines: 1,
                  softWrap: false,)),
                Text(hotel.address,style: TextStyle(fontSize: 12),),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
