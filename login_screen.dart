import 'package:flutter/material.dart';
import 'package:multirolebase/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final ageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                prefixIconColor: Colors.blue,
                fillColor: Colors.grey.withOpacity(.2),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.email_outlined),
                  prefixIconColor: Colors.blue,
                  fillColor: Colors.grey.withOpacity(.2),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Age',
                  prefixIcon: const Icon(Icons.email_outlined),
                  prefixIconColor: Colors.blue,
                  fillColor: Colors.grey.withOpacity(.2),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: ()async
              {
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.setString('email', emailController.toString());
                sp.setString('age', ageController.toString());
                sp.setBool('isLogin', true);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text('Login',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.bold),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

