import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weatherforecast/View/login.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController cPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Signup'),centerTitle: true,),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          TextField(controller: emailController,),
          TextField(controller: passwordController,),
          TextField(controller: cPasswordController,),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: () async {
            String email=emailController.text.trim();
            String password=passwordController.text.trim();
            String cPassword=cPasswordController.text.trim();
            if(email==""||password==""||cPassword==""){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Enter Valid Details"),
              ));
            }else if(password==cPassword){
              try{
                UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Account Created Successfully"),
                ));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              }on FirebaseAuthException catch(err)
              {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(err.toString()),
                ));

              }

            }else
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Enter Valid Details"),
                ));
              }

          }, child: Text('Sign Up'))
        ]),
      ),
    );
  }
}
