import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'package:bhbbites/views/launch_view.dart';
import 'package:bhbbites/services/auth_service.dart';
import 'package:bhbbites/views/sign_up_view.dart';
import 'package:bhbbites/widgets/provider_widget.dart';


void main()
{ runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
  Widget build(BuildContext context) {
      return Provider(
        auth: AuthService(),
        child: MaterialApp(
        title: 'Baby Healthy Bites',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
    //    home: Home(),
          home: HomeController(),
          routes: <String, WidgetBuilder> {
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
            '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
            '/home': (BuildContext context) => HomeController(),

          }

         ),
      );

  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot){
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : LaunchView();

        }
        return CircularProgressIndicator();
      },
    );
  }
}

