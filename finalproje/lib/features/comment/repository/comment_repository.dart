import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FoodDetailsPage extends StatefulWidget {
  final String id_no;
  FoodDetailsPage({required this.id_no});
  @override
  _FoodDetailsPageState createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  late String _displayText;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _commentController = TextEditingController();

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

  Future<void> _addComment() async {
    if (_user == null) {
      // Kullanıcı oturum açmamışsa yorum ekleyemez.
      // Giriş yapma ekranına yönlendirebilirsiniz.
      return;
    }

    

    String commentText = _commentController.text.trim();
    if (commentText.isNotEmpty) {
      await _firestore.collection(_displayText).add({
        'userId': _user!.uid,
        'userName': _user!.email,
        'comment': commentText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Yorum ekledikten sonra text alanını temizleyin.
      _commentController.clear();
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
        
        /* FutureBuilder(
            future: _firestore.collection('users').get(),
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
                    Text('Products Collection:'),
                    for (var product in products) Text('Name: ${product['name']}'),
                  ],
                );
              }
            },
          ),*/
          // Yemek bilgilerini gösteren bir widget eklenebilir.
          /*FutureBuilder(
                future: _getUserData(),
                builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Hata: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    Map<String, dynamic>? userData = snapshot.data!.data();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Kullanıcı Adı: ${_user!.displayName}'),
                        Text('Email: ${_user!.email}'),
                        userData != null
                            ? Text('Diğer Bilgiler: ${_user!.displayName}')
                            : Text('Diğer Bilgiler: Yok'),
                      ],
                    );
                  } else {
                    return Text('Veri bulunamadı.');
                  }
                },
              ),*/
          // Her yemek için ayrı bir StreamBuilder kullanabilirsiniz.
          /*StreamBuilder(
            stream: _firestore.collection('foods').doc(_displayText).collection('comments').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              // Firestore'dan alınan yorumları liste olarak elde etme
              List<DocumentSnapshot> comments = snapshot.data!.docs;

              // Yorumları ekrana yazdırma
              return Expanded(
                child: ListView.builder(
                
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    var commentData = comments[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text("${_user?.email}"),
                      subtitle: Text(commentData['comment']),
                    );
                  },
                ),
              );
            },
          ),*/
      
          // Yorum ekleme alanı
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Yorumunuzu buraya yazın',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _addComment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
