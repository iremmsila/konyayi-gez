import 'package:finalproje/features/auth/controller/auth_controller.dart';
import 'package:finalproje/features/auth/views/sign_in.dart';
import 'package:finalproje/features/auth/views/sign_up_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment:Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width:double.infinity,
            decoration:const BoxDecoration(
              image:DecorationImage(image:
              AssetImage('assets/images/signUp.jpg'),
              fit:BoxFit.cover,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              //color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                ),
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10
                  ),
                  alignment: Alignment.centerLeft,
                 //child:const Text("SİGN İN", style:
                 //TextStyle(
                 //color: Colors.black,
                 //fontSize: 24,
                 //fontFamily: 'Roboto',
                //),
               //),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: _emailController,
              validator: (value){
                if (value!.isEmpty){
                  return "Email is required";
                }
                return null;
              },
              decoration:InputDecoration(
                labelText: "Email",
                fillColor: Colors.white.withOpacity(0.8),
                filled:true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: _passwordController,
              validator: (value){
                if (value!.isEmpty){
                  return "Password is required";
                }
                return null;
              },
              obscureText: true,
              decoration:InputDecoration(
                labelText: "Password",
                fillColor: Colors.white.withOpacity(0.8),
                filled:true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            ),
            Consumer(builder: (context, ref, child){
              return Padding(
              padding: const EdgeInsets.only(top: 25),
              child:InkWell(
              child: MaterialButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  ref
                    .read(authControllerProvider)
                    .signUpWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text
                      )
                      .then((value) => Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (_)=> SignUpInfo(
                        email: _emailController.text,
                      ),),
                      (route) => false),);
              }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
                color: const Color.fromARGB(255, 0, 147, 152),
                minWidth: 130.0,
                height: 42.0,
                child: const Text(
                  "KAYIT OL",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ),
              ),
            );
            },
            ),
            Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Text("Bir hesabın var mı?", style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),),
            TextButton(
              onPressed: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (_)=>const SignIn(),),),
              child: const Text("GİRİŞ YAP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
              ],),
            ),),
              ],
              ),
              ),
          ),
            ),
            ),
        ],
      ),
    );
  }
}