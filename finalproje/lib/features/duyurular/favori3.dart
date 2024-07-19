// liked_events_screen.dart
import 'package:finalproje/features/duyurular/duyurular.dart';
import 'package:finalproje/features/duyurular/favorite.dart';
import 'package:flutter/material.dart';



class LikedEventsScreen extends StatefulWidget {
  @override
  _LikedEventsScreenState createState() => _LikedEventsScreenState();
}

class _LikedEventsScreenState extends State<LikedEventsScreen> {
  late Future<List<Event>> likedEvents;
  FirebaseService _firebaseService = FirebaseService();

  @override
  void initState() {
    super.initState();
    likedEvents = _firebaseService.getLikedEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beğenilen Etkinlikler'),
      ),
      body: FutureBuilder<List<Event>>(
        future: likedEvents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata oluştu: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('Beğenilen etkinlik bulunamadı.');
          } else {
            List<Event> likedEvents = snapshot.data!;
            return ListView.builder(
              itemCount: likedEvents.length,
              itemBuilder: (context, index) {
                Event event = likedEvents[index];

                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(event.description),
                  leading: Image.asset(
                    event.imagePath,
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
