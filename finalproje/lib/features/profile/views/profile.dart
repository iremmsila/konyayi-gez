import 'dart:math';

import 'package:finalproje/features/profile/repository/profile_repository.dart';
import 'package:finalproje/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
            image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/more.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
        child: Padding(
          padding:const EdgeInsets.all(15),
      child: FutureBuilder<UserModel>(
              future: ref.read(profileRepositoryProvider).getUser(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  final userModel = snapshot.data!;

                  return Center(
                  child:Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(padding: EdgeInsets.symmetric(vertical: 10) ,
                      /*child: CircleAvatar(
                      backgroundColor:const  Color.fromARGB(255, 163, 135, 238),
                      radius: 80,
                      child: CircleAvatar(
                      radius: 70,
                      backgroundImage: CachedNetworkImageProvider(
                      userModel.profilePhoto!
                    
            ),
          ),
        ),*/
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text("hoş geldin ${userModel.name} ${userModel.surname}!",
        style: const TextStyle(
          
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),)
        ),
        const Padding(padding: const EdgeInsets.symmetric(vertical: 9),
        
        /*child: Text("@${userModel.username}",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),*/),
        QuoteBox()
      /* MaterialButton(
          color: const Color.fromARGB(255, 139, 109, 222),
          onPressed: (){},
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color:Colors.white,
            )
          ),
          minWidth: 200,
          height: 52,
        child: const Text("Edit Profile",
        style: TextStyle(color: Colors.white),), ),*/
      ],
      ),);
      }
      else if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(),);
      }
      else{
        return const Center(child: Text("Something went wrong"),);
      }
      },),
      ),),
    );
  }
  
}
class QuoteBox extends StatefulWidget {
  @override
  _QuoteBoxState createState() => _QuoteBoxState();
}

class _QuoteBoxState extends State<QuoteBox> {
  List<String> quotes = [
    "Her yerde olmak gibi bir duan varsa, gönüllere gir; çünkü sevenler, sevdiklerini gönüllerinde taşırlar.",
    "Ay doğmuyorsa yüzüne, güneş vurmuyorsa pencerene, kabahati ne güneşte ne de ay da ara! Gözlerindeki perdeyi arala!",
    "Ey sevgili. Biz seninle bir salkımın iki aşık üzümüyken, başka şişelerde şarap olmuşuz, başka hayallerde harap olmuşuz.",
    "Misafirsin bu hanede ey gönül, umduğunla değil bulduğunla gül, hane sahibi ne derse o olur, ne kimseye sitem eyle, ne üzül.",
    "İyiyim desem yalan olur, kötüyüm desem inancıma dokunur. En iyisi şükre vurayım dilimi, belki o zaman kalbim kurtulur.",
    "Sen çiçek olup etrafa gülücükler saçmaya söz ver. Toprak olup seni başının üstünde taşıyan bulunur."
  ];

  String currentQuote = "";

  @override
  void initState() {
    super.initState();
    generateRandomQuote();
  }

  void generateRandomQuote() {
    int index = Random().nextInt(quotes.length);
    setState(() {
      currentQuote = quotes[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(19.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          Text(
            currentQuote,
            style:const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,),
            textAlign: TextAlign.center,

          ),
          SizedBox(height: 19.0),
          ElevatedButton(
            onPressed: generateRandomQuote,
            child: Text('Yenile',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
          ),
          
        ],
      ),
    );
  }
}



