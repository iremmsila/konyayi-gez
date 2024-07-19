import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puanlama Uygulaması',
      home: RatingScreen(),
    );
  }
}

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 0;
  final CollectionReference ratingsCollection = FirebaseFirestore.instance.collection('ratings');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puanlama Uygulaması'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Puanlama Widget'ı
            RatingBar(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              ratingWidget:RatingWidget(full: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              half: Icon(
                Icons.star_half,
                color: Colors.yellow,
              ),
              empty: Icon(
                Icons.star,
                color: Colors.grey,
              ),

              ),
              onRatingUpdate: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Puanı Firestore'a kaydetme
                _saveRatingToFirestore(rating);
              },
              child: Text('Puanı Kaydet'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveRatingToFirestore(double userRating) async {
    try {
      await ratingsCollection.add({
        'rating': userRating,
        'timestamp': FieldValue.serverTimestamp(),
      });
      // Başarıyla eklendiğinde kullanıcıya geri bildirim verebilirsiniz.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Puanınız başarıyla kaydedildi.'),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      // Hata durumunda kullanıcıya hata mesajını gösterebilirsiniz.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Hata oluştu. Tekrar deneyin.'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}





/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ContentListView extends ConsumerWidget {
  const ContentListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {

                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, '/article',),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image:AssetImage("assets/images/Metro.jpeg")
                                ,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "fcgvhbjkl",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "article.author",
                                      style:  TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "cart curt views",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: AspectRatio(
                                  aspectRatio: 9 / 16,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image:const DecorationImage(
                                        image: AssetImage("assets/images/signUpp.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }}*/