
// ignore_for_file: must_be_immutable
import 'package:nb_utils/nb_utils.dart';
import 'package:testapp/global/allimports.dart';

//Events
class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginWithFb extends LoginEvent {
  const LoginWithFb();
  @override
  List<Object> get props => [];
}

//States
class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

class LoginSucess extends LoginState {
  Map userObj = {};
  LoginSucess({required this.userObj});

  @override
  List<Object> get props => [];
}


class LoginError extends LoginState {
  String error;
   LoginError({required this.error});
  @override
  List<Object> get props => [error];
}

//Bloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
      bool _isLoggedIn = false;
      Map userObj ={};
      if(event is LoginWithFb){
        try {
          //fb auth login
       await  FacebookAuth.instance.login(permissions: ["public_profile", "email"]).then((value)async{
         await FacebookAuth.instance.getUserData().then((userData) async { 
          userObj = userData;
          //save data in secure storeage
          await SecureStoreage.saveInSecureStorage("name",userObj["name"]);    
          await SecureStoreage.saveInSecureStorage("email",userObj["email"]);     
          log(userData.toString());
             _isLoggedIn = true;
             //save login state   
              await SecureStoreage.saveInSecureStorage("Is_Login",'true');     
            });
          });
          if(_isLoggedIn == true){
              emit(LoginSucess(userObj: userObj));
          }else{
             emit(LoginError(error: "login fail try again"));
          }
        } on SocketException {
          emit(LoginError(error: "No Internet Connection"));
        } on HttpException {
          emit(LoginError(error: "No Service Found"));
        } on FormatException {
          emit(LoginError(error: "Invalid Response Format"));
        } catch (e) {
          emit(LoginError(error: e.toString()));
        }

      }
    });
  }
}