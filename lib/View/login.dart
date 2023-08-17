
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weatherforecast/View/WeatherApp.dart';
import 'package:weatherforecast/View/signup.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),centerTitle: true,),
      body: Center(
        child: Container(
          width: 500,
          height: 400,
          margin: EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(controller: emailController,),
                TextField(controller: passwordController,),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () async {
                  String email=emailController.text.trim();
                  String password=passwordController.text.trim();
                  if(email==""||password==""){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Enter Required Details"),
                    ));
                  }else
                    {
                      try{
                        UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                        if(userCredential !=null){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherApp()));
                        }else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Enter Valid Details"),
                          ));
                        }
                      }on FirebaseAuthException catch(err){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(err.toString()),
                        ));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                      }
                    }

                }, child: Text('Login'))
              ]),
        ),
      ),
    );
  }
}
