import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PointDetailsPage extends StatefulWidget {
  final String id_no;
  PointDetailsPage({required this.id_no});
  @override
  _PointDetailsPageState createState() => _PointDetailsPageState();
}

class _PointDetailsPageState extends State<PointDetailsPage> {
  late String _displayText;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _pointsController = TextEditingController();

  User? _user;
   // Örnek bir yemek ID'si

  @override
  void initState() {
    super.initState();
    _displayText = widget.id_no;
    _checkCurrentUser();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserData() async {
    // Kullanıcının UID'sini kullanarak users koleksiyonundan veri çekme
    if (_user != null) {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await _firestore.collection('users').doc(_user!.uid).get();
      return userSnapshot;
    } else {
      throw Exception('Kullanıcı oturum açmamış.');
    }
  }
    Future<void> _checkCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
    } else {
      // Kullanıcı oturum açmamışsa giriş sayfasına yönlendirin.
      // Örnek: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  Future<void> _signOut() async {
    // Kullanıcı çıkışı için kodları buraya ekleyin.
  }

  Future<void> _addPoints() async {
    if (_user == null) {
      // Kullanıcı oturum açmamışsa yorum ekleyemez.
      // Giriş yapma ekranına yönlendirebilirsiniz.
      return;
    }

    

    String pointsText = _pointsController.text.trim();
    if (pointsText.isNotEmpty) {
      await _firestore.collection(_displayText).add({
        'userId': _user!.uid,
        'userName': _user!.email,
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
        title: Text('Yemek Detayları'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
            future: _firestore.collection(_displayText).get(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Hata: ${snapshot.error}');
              } else {
                // Veriyi işleyin
                List<DocumentSnapshot> products = snapshot.data!.docs;
                return Column(
                  children: [
                    const Text('Kullanıcı Yorumları:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                    for (var product in products)
                    Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: ListTile(
                      title: Text("${product['userName']}"),
                      subtitle: Text("${product['comment']}"),
                    ),
                ),
                
                  ],
                );
              }
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
