// ignore_for_file: must_be_immutable

import 'package:nb_utils/nb_utils.dart';
import 'package:testapp/global/allimports.dart';

class DetailsPage extends StatefulWidget {
  HotelListModel hotel;
  DetailsPage({Key? key, required this.hotel}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Completer<GoogleMapController> controller = Completer();
  final Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(
          widget.hotel.latitude.toDouble(), widget.hotel.latitude.toDouble()),
      zoom: 15,
    );
    return Scaffold(
      appBar: AppBar(title: Text("Details Page")),
      body: Column(
        children: [
          HotelListItemWidget(hotel: widget.hotel),
          10.height,
          Text(widget.hotel.description).paddingAll(8),
          // google map
          Expanded(
              child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: {
              Marker(
                  markerId: MarkerId(widget.hotel.address),
                  infoWindow:  InfoWindow(title: widget.hotel.title.toString(),snippet: widget.hotel.address.toString()),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(widget.hotel.latitude.toDouble(),
                      widget.hotel.latitude.toDouble())),
                  
            },
            onMapCreated: (GoogleMapController controller) {},
          ))
        ],
      ),
    );
  }
}
