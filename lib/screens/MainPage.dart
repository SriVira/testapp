import 'package:nb_utils/nb_utils.dart';

import 'package:testapp/global/allimports.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String name;
  String email;
  HomePage({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final hotelbloc = HotelBloc()..add(GetHotel());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: AppBar(
              title: Text("List View"),
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    10.height,
                    Text(widget.name),
                    Text(widget.email),
                    10.height,
                    ElevatedButtonWidget(
                      text: "Logout",
                      primary: ColorDanger,
                      onPressed: () async {
                        await FacebookAuth.instance
                            .logOut()
                            .then((value) async {
                          await AuthConroller.AccountLogout()
                              .then((value) async {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: const Duration(milliseconds: 400),
                                    type: PageTransitionType.leftToRight,
                                    child: LoginPage()));
                          });
                        });
                      },
                      height: 45,
                    ),
                    10.height,
                    // hotel list Bloc
                    BlocBuilder(
                      bloc: hotelbloc,
                      builder: (context, state) {
                        if (state is HotelLoading) {
                          return Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        if (state is HotelLoaded) {
                          return Expanded(
                            flex: 1,
                            child: ListView.builder(
                              padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                              scrollDirection: Axis.vertical,
                              itemCount: state.HotelList.length,
                              itemBuilder: (context, index) {
                                return HotelListItemWidget(
                                    hotel: state.HotelList[index]);
                              },
                            ),
                          );
                        }

                        if (state is HotelEmpty) {
                          return Expanded(
                            child: Center(
                              child: Text("No Hotels Found!"),
                            ),
                          );
                        }

                        if (state is HotelError) {
                          return Expanded(
                            child: Center(
                              child: Text("Error When loading data"),
                            ),
                          );
                        }

                        return Expanded(
                          child: Center(
                            child: Text("Error When loading data"),
                          ),
                        );
                      },
                    )
                  ]),
            )));
  }
}
