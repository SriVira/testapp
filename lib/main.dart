
import 'package:testapp/global/allimports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //M-bloc Provider
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
         BlocProvider(
          create: (context) => AuthBloc()..add(const CheckAuth()),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Auth check bloc
      home:BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AppLoginPage) {
              return state.widget;
            }
            if (state is AppHomePage) {
              return state.widget;
            }
            if (state is AppErrorPage) {
              return state.widget;
            }
            return const SizedBox();
          },
        ),
    ),
    );
  }
}

