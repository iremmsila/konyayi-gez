
/*
void main() {
  runApp(Duyurular());
}

class Duyurular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventScreen(),
    );
  }
}

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<Event> events = [
    Event('Etkinlik 1', 'Bu bir etkinlik açıklamasıdır. Katılın!', 'assets/images/bedesten.jpg'),
    Event('Etkinlik 2', 'Harika bir gün geçireceğiz. Bekliyoruz!', 'assets/images/bedesten.jpg'),
    Event('Etkinlik 3', 'Gel ve eğlen, unutulmaz anılar biriktirelim!', 'assets/images/bedesten.jpg'),
  ];

  List<Event> likedEvents = [];

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
          }, () {
            // Beğeni durumunu güncelle
            setState(() {
              if (isLiked) {
                likedEvents.remove(event);
              } else {
                likedEvents.add(event);
              }
            });
          });
        },
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

class Event {
  final String title;
  final String description;
  final String imagePath;

  Event(this.title, this.description, this.imagePath);
}
*/

// firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproje/features/duyurular/duyurular.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> likeEvent(Event event) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('likedEvents').doc(user.uid).collection('events').doc(event.title).set(event.toMap());
      }
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  Future<List<Event>> getLikedEvents() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        QuerySnapshot querySnapshot = await _firestore.collection('likedEvents').doc(user.uid).collection('events').get();
        List<Event> likedEvents = querySnapshot.docs.map((doc) => Event.fromMap(doc.data() as Map<String, dynamic>)).toList();
        return likedEvents;
      } else {
        return [];
      }
    } catch (e) {
      print('Hata oluştu: $e');
      return [];
    }
  }
}
