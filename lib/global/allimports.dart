// ignore_for_file: file_names, must_be_immutable
//assets
export 'dart:async';
export 'dart:convert';
export 'dart:io';
export 'package:flutter/services.dart';
export 'package:testapp/global/colors.dart';
export 'package:testapp/global/appapi.dart';

//Utils
export 'package:testapp/global/utils/SnackBars.dart';
export 'package:testapp/global/utils/Converts.dart';
export 'package:testapp/global/utils/SecureStorage.dart';

//third party imports
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:equatable/equatable.dart';
export 'package:page_transition/page_transition.dart';
export 'package:flutter_secure_storage/flutter_secure_storage.dart';
export 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
export 'package:http/http.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:google_maps_flutter/google_maps_flutter.dart';

//screens  
export 'package:testapp/screens/LoginPage.dart';
export 'package:testapp/screens/MainPage.dart';
export 'package:testapp/screens/DetailsPage.dart';

//widgets
export 'package:testapp/global/widgets/ElevatedButtonWidget.dart';
export 'package:testapp/global/widgets/HotelListItemWidget.dart';

//Models
export 'package:testapp/models/HotelListModel.dart';

//Controllers
export 'package:testapp/controllers/AuthController.dart';
export 'package:testapp/controllers/HttpController.dart';
export 'package:testapp/controllers/MainController.dart';

//Blocs
export 'package:testapp/blocs/login_bloc.dart';
export 'package:testapp/blocs/auth_bloc.dart';
export 'package:testapp/blocs/hotel_list_bloc.dart';