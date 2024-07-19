import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  final String foodId;

  CommentsPage({required this.foodId});

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _commentController = TextEditingController();

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


  Future<void> _addComment() async {
    if (_user == null) {
      // Kullanıcı oturum açmamışsa yorum ekleyemez.
      // Giriş yapma ekranına yönlendirebilirsiniz.
      return;
    }

    String commentText = _commentController.text.trim();
    if (commentText.isNotEmpty) {
      await _firestore.collection('foods').doc(widget.foodId).collection('comments').add({
        'userId': _user!.uid,
        'userName': _user!.displayName,
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
        title: Text('Yorumlar'),
      ),
      body: Column(
        children: [
          // Her yorum için ayrı bir StreamBuilder kullanabilirsiniz.
          StreamBuilder(
            stream: _firestore.collection('foods').doc(widget.foodId).collection('comments').snapshots(),
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
                      title: Text(commentData['userName']),
                      subtitle: Text(commentData['comment']),
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
