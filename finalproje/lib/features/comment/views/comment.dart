import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproje/features/comment/controller/comment_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 // Yorumları göstermek ve eklemek için başka bir sayfa

class FoodDetailsPage extends StatefulWidget {
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
    } else {
      // Kullanıcı oturum açmamışsa, giriş sayfasına yönlendirin veya giriş yapma işlemleri yapın.
      // Örnek: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yemek Detayları'),
      ),
      body: Column(
        children: [

          // Her yemek için ayrı bir StreamBuilder kullanabilirsiniz.
          StreamBuilder(
            stream: _firestore.collection('foods').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              // Firestore'dan alınan yemekleri liste olarak elde etme
              List<DocumentSnapshot> foods = snapshot.data!.docs;

              // Yemekleri ekrana yazdırma
              return Expanded(
                child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    var foodData = foods[index].data() as Map<String, dynamic>;

                    return ListTile(
                      title: Text(foodData['name']),
                      subtitle: ElevatedButton(
                        onPressed: () {
                          // Yorumları göstermek ve eklemek için başka bir sayfaya yönlendirme
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentsPage(foodId: foods[index].id),
                            ),
                          );
                        },
                        child: Text('Yorumlar'),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
