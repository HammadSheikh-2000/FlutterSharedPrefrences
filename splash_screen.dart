import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirolebase/home_screen.dart';
import 'package:multirolebase/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();

  }
  void checkLogin()async
  {
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool flag=sp.getBool('isLogin')??false;
    if(flag)
    {
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      });
    }
    else
    {
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Image(
            height: double.infinity,
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                'https://images.pexels.com/photos/604969/pexels-photo-604969.jpeg?auto=compress&cs=tinysrgb&w=1600')),
      ),
    );
  }

}