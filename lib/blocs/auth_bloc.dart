// ignore_for_file: must_be_immutable, duplicate_ignore, unused_import
import 'package:nb_utils/nb_utils.dart';
import 'package:testapp/global/allimports.dart';
//Events
class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class CheckAuth extends AuthEvent {
  const CheckAuth();
  @override
  List<Object> get props => [];
}

//States
class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AppAuthInitial extends AuthState {}

class AppLoginPage extends AuthState {
  Widget widget;
  AppLoginPage({
    required this.widget,
  });
  @override
  List<Object> get props => [widget];
}



class AppHomePage extends AuthState {
  Widget widget;
  AppHomePage({
    required this.widget,
  });
  @override
  List<Object> get props => [widget];
}

class AppErrorPage extends AuthState {
  Widget widget;
  AppErrorPage({
    required this.widget,
  });
  @override
  List<Object> get props => [widget];
}

//Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AppAuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is CheckAuth) {
        try {
            bool isLoggedIn = await AuthConroller.checkAuth();
            if (isLoggedIn) {
              //get user data from secure storeage
              String? name =  await SecureStoreage.getFromSecureStorage("name");
              String? email =  await SecureStoreage.getFromSecureStorage("email");
              emit(AppHomePage(widget: HomePage(
                name:name!,
                email: email!,
                )));
            }else{
               emit(AppLoginPage(widget: LoginPage()));
            }
        } on SocketException {
          emit(AppErrorPage(widget: const Text("No Internet Connection")));
        } on HttpException {
          emit(AppErrorPage(widget: const Text("No Service Found")));
        } on FormatException {
          emit(AppErrorPage(widget: const Text("Invalid Response Format")));
        } catch (e) {
          emit(AppErrorPage(widget: Text(e.toString())));
        }
      }
    });
  }
}
