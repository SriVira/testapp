// ignore_for_file: must_be_immutable
import 'package:testapp/global/allimports.dart';

//Events
class HotelEvent extends Equatable {
  const HotelEvent();
  @override
  List<Object> get props => [];
}

class GetHotel extends HotelEvent {
  const GetHotel();
  @override
  List<Object> get props => [];
}

//States
class HotelState extends Equatable {
  const HotelState();
  @override
  List<Object> get props => [];
}

class HotelInitial extends HotelState {}

class HotelLoading extends HotelState {
  const HotelLoading();
  @override
  List<Object> get props => [];
}

class HotelLoaded extends HotelState {
  List<HotelListModel>  HotelList;
  HotelLoaded({required this. HotelList});
  @override
  List<Object> get props => [];
}

class HotelEmpty extends HotelState {
  String message;
  HotelEmpty({required this.message});
  @override
  List<Object> get props => [message];
}

class HotelError extends HotelState {
  String error;
 HotelError({required this.error});
  @override
  List<Object> get props => [];
}

//Bloc
class HotelBloc
    extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<HotelEvent>((event, emit) async {
      emit(HotelLoading());
      if (event is GetHotel) {
        try {
          List<HotelListModel> HotelList =
              await MainController.getHotels();

          if (HotelList.isEmpty) {
            emit(HotelEmpty(message: "No Hotels Found!"));
          } else {
            emit(HotelLoaded(HotelList:HotelList));
          }
        } on SocketException {
          emit(HotelError(error: "No Internet Connection"));
        } on HttpException {
          emit(HotelError(error: "No Service Found"));
        } on FormatException {
          emit(HotelError(error: "Invalid Response Format"));
        } catch (e) {
          emit(HotelError(error: e.toString()));
        }
      }
    });
  }
}