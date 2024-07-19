// event_screen.dart
import 'package:finalproje/features/duyurular/duyurular.dart';
import 'package:finalproje/features/duyurular/favori3.dart';
import 'package:finalproje/features/duyurular/favorite.dart';
import 'package:flutter/material.dart';


class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<Event> events = [
    Event('Etkinlik 1', 'Bu bir etkinlik açıklamasıdır. Katılın!', 'assets/images/bedesten.jpg'),
    Event('Etkinlik 2', 'Harika bir gün geçireceğiz. Bekliyoruz!', 'assets/images/bedesten.jpg'),
    Event('Etkinlik 3', 'Gel ve eğlen, unutulmaz anılar biriktirelim!', 'assets/images/bedesten.jpg'),
  ];

  List<Event> likedEvents = [];
  FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etkinlikler'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          Event event = events[index];
          bool isLiked = likedEvents.contains(event);

          return buildEventCard(event, isLiked, () {
            // Etkinlik kartına tıklandığında yapılacak işlemler
            print('Etkinlik detay sayfasına git: ${event.title}');
          }, () async {
            // Beğeni durumunu güncelle
            setState(() {
              if (isLiked) {
                likedEvents.remove(event);
              } else {
                likedEvents.add(event);
              }
            });

            // Firebase'e etkinliği beğenme durumunu kaydet
            await _firebaseService.likeEvent(event);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Beğenilen etkinlikleri göstermek için yeni bir sayfa aç
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LikedEventsScreen(),
            ),
          );
        },
        child: Icon(Icons.favorite),
      ),
    );
  }

  Widget buildEventCard(Event event, bool isLiked, VoidCallback onTap, VoidCallback onLike) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              event.imagePath,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(event.description),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Beğen: ${isLiked ? 'Evet' : 'Hayır'}'),
                      IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : null,
                        ),
                        onPressed: onLike,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
