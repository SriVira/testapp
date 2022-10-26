import 'package:testapp/global/allimports.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(title: Text("Login Page"),
        automaticallyImplyLeading: false,
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSucess) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                      child: HomePage(name: state.userObj['name'], email: state.userObj['email'])));
            }
    
            if (state is LoginError) {
              SnackBars.Danger(context, state.error);
            }
          },
          child: Center(
            child: ElevatedButtonWidget(
              text: "Login With Facebook",
              primary: ColorPrimary,
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(LoginWithFb());
              },
            ),
          ),
        ),
      ),
    );
  }
}
