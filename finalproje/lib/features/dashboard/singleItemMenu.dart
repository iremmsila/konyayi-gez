
// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproje/features/comment/repository/comment_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SingleItemMenu extends StatelessWidget {
  final String stringValue;
  final String imagePathValue;
  final String baslik;
  final String id;
  
  final CollectionReference ratingsCollection = FirebaseFirestore.instance.collection('ratings');

  SingleItemMenu({super.key, required this.stringValue, required this.imagePathValue, required this.baslik, required this.id,});
  int currentNumber = 1;
  double rating =4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: ElevatedButton(

                onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>FoodDetailsPage(
              id_no: id,
            ),
          ),
        );
      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text("YORUMLAR"),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePathValue),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fixedSize: const Size(50, 50),
                        ),
                        icon: const Icon(CupertinoIcons.chevron_back),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.width - 50,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                ),

              
              ],
            ),
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    baslik,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(stringValue,
                      style:const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  RatingBar(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.only(top: 10),
              ratingWidget:RatingWidget(full: const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              half: const Icon(
                Icons.star_half,
                color: Colors.yellow,
              ),
              empty:const Icon(
                Icons.star,
                color: Colors.grey,
              ),

              ),
              onRatingUpdate: (newRating) {
                setState(){
                  rating = newRating;
                  
                }
              },
            ),
            SizedBox(height: 20),
            

            
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  /*Future<void> _saveRatingToFirestore(double userRating) async {
    try {
      await ratingsCollection.add({
        'rating': userRating,
        'timestamp': FieldValue.serverTimestamp(),
      });
      // Başarıyla eklendiğinde kullanıcıya geri bildirim verebilirsiniz.
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
        content:  Text('Puanınız başarıyla kaydedildi.'),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      // Hata durumunda kullanıcıya hata mesajını gösterebilirsiniz.
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
        content: Text('Hata oluştu. Tekrar deneyin.'),
        duration: Duration(seconds: 2),
      ));
    }
  }*/
}
