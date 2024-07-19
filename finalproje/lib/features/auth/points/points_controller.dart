import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PointsPage extends StatefulWidget {
  final String foodId;

  PointsPage({required this.foodId});

  @override
  _PointsPageState createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _pointsController = TextEditingController();

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


  Future<void> _addPoints() async {
    if (_user == null) {
      // Kullanıcı oturum açmamışsa yorum ekleyemez.
      // Giriş yapma ekranına yönlendirebilirsiniz.
      return;
    }

    String pointsText = _pointsController.text.trim();
    if (pointsText.isNotEmpty) {
      await _firestore.collection('foods').doc(widget.foodId).collection('pointss').add({
        'userId': _user!.uid,
        'userName': _user!.displayName,
        'comment': pointsText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Yorum ekledikten sonra text alanını temizleyin.
      _pointsController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yıldızlar'),
      ),
      body: Column(
        children: [
          // Her yorum için ayrı bir StreamBuilder kullanabilirsiniz.
          StreamBuilder(
            stream: _firestore.collection('stars').doc(widget.foodId).collection('point').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              // Firestore'dan alınan yorumları liste olarak elde etme
              List<DocumentSnapshot> point = snapshot.data!.docs;

              // Yorumları ekrana yazdırma
              return Expanded(
                child: ListView.builder(
                  itemCount: point.length,
                  itemBuilder: (context, index) {
                    var pointData = point[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(pointData['userName']),
                      subtitle: Text(pointData['comment']),
                    );
                  },
                ),
              );
            },
          ),

          // Yorum ekleme alanı
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _pointsController,
                    decoration: InputDecoration(
                      hintText: 'Yorumunuzu buraya yazın',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _addPoints,
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }
}
