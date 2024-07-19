import 'package:finalproje/features/auth/controller/auth_controller.dart';
import 'package:finalproje/features/home/views/home.dart';
import 'package:finalproje/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final TextEditingController  _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    _nameController.dispose();
    _usernameController.dispose();
    _surnameController.dispose();
    
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
              controller: _nameController,
              validator: (value){
                if (value!.isEmpty){
                  return "Name is required";
                }
                return null;
              },
              decoration:InputDecoration(
                labelText: "Name",
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
              controller: _surnameController,
              validator: (value){
                if (value!.isEmpty){
                  return "Surname is required";
                }
                return null;
              },
              decoration:InputDecoration(
                labelText: "Surname",
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
              controller: _usernameController,
              validator: (value){
                if (value!.isEmpty){
                  return "Username is required";
                }
                return null;
              },
              decoration:InputDecoration(
                labelText: "Username",
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
                  UserModel userModel = UserModel(name: _nameController.text, surname: _surnameController.text, email: widget.email, username: _usernameController.text);

                  ref
                  .read(authControllerProvider)
                  .storeUserInfoToFirebase(userModel)
                  .whenComplete(() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const Home(),
                  ), (route) => false),
                  );
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