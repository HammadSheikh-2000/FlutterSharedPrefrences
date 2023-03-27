import 'package:flutter/material.dart';
import 'package:multirolebase/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: ()async
            {
              SharedPreferences sp=await SharedPreferences.getInstance();
              sp.clear();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
            child: Center(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Text('Logout',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
