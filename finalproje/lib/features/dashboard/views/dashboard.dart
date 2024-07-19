import 'package:finalproje/features/duyurular/favori2.dart';
import 'package:finalproje/features/liste/views/menu.dart';
import 'package:finalproje/features/liste/views/yerler_listesi.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        decoration:const BoxDecoration(
              image:DecorationImage(image:
              AssetImage('assets/images/Metro.jpeg'),
              fit:BoxFit.cover,
              ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(
              onPressed: () {
                // İlk butona tıklandığında "Sayfa 1" e yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YerlerListesi(buttonText: '', imagePath: '',)),
                );
              },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Colors.transparent, // Butonun arka planını şeffaf yapar
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'GEZİLECEK \n YERLER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // İlk butona tıklandığında "Sayfa 1" e yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Menu(buttonText: '', imagePath: '',id:'')),
                );
              },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Colors.transparent, // Butonun arka planını şeffaf yapar
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(35, 40, 35, 40),
              child: const Text(
                'KAFEM \n MENÜ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
            ),
            ],),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ElevatedButton(
              onPressed: () {
                // İlk butona tıklandığında "Sayfa 1" e yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>EventScreen()),
                );
              },
            style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Colors.transparent, // Butonun arka planını şeffaf yapar
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 55, 20, 50),
              child: const Text(
                'DUYURULAR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
            onPressed: () {
                // İlk butona tıklandığında "Sayfa 1" e yönlendirme
                // ignore: deprecated_member_use
                launch('https://www.google.com/maps/d/embed?mid=18wTzJKDKsR1ZnzCgqCuT7GdMmBE&hl=tr&ehbc=2E312F');
              },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10), backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ), // Butonun arka planını şeffaf yapar
          ),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 45,20, 45),
              child: const Text(
                'HARİTADA\nGÖRÜNTÜLE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
            ),
            ],),
          ],
        ),
      ),
    );
  }
}



/*

  @override
  Widget build(BuildContext context) {
    
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: (150/195),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 75, horizontal: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(209, 0, 0, 0),
            boxShadow: [
              BoxShadow(
              color: Colors.white.withOpacity(0.9),
              spreadRadius: 1,
              blurRadius: 8,
            )
            ]
          ),
            child :Padding(padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
            child: ElevatedButton(
              onPressed: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (_)=>const SingleItem(),),),
              child: const Text("GEZİLECEK YERLER",
            style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white,
            ),
            ),
            ),
            ),
            ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 75, horizontal: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(209, 0, 0, 0),
            boxShadow: [
              BoxShadow(
              color: Colors.white.withOpacity(0.9),
              spreadRadius: 1,
              blurRadius: 8,
            )
            ]
          ),
            child :Padding(padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
            child: ElevatedButton(
              onPressed: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (_)=>const SingleItem(),),),
              child: const Text("KAFEM MENÜ",
            style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white,
            ),
            ),
            ),
            ),
            ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 75, horizontal: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(209, 0, 0, 0),
            boxShadow: [
              BoxShadow(
              color: Colors.white.withOpacity(0.9),
              spreadRadius: 1,
              blurRadius: 8,
            )
            ]
          ),
            child :Padding(padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
            child: ElevatedButton(
              onPressed: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (_)=>const SingleItem(),),),
              child: const Text("DUYURULAR",
            style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
            ),
            ),
            ),
            ),
            ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 75, horizontal: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(209, 0, 0, 0),
            boxShadow: [
              BoxShadow(
              color: Colors.white.withOpacity(0.9),
              spreadRadius: 1,
              blurRadius: 8,
            )
            ]
          ),
            child :Padding(padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
            child: ElevatedButton(
              onPressed: ()=>Navigator.push(context,
              MaterialPageRoute(builder: (_)=>const YerlerListesi(),),),
              child: const Text("KONUMDAN BUL",
            style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
            ),
            ),
            ),
            ),
            ),
        ),
      ],
    );
    }
    }*/
    /*
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text("THE BEAR İS HERE!",
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 20,
          ),),
          ),
        ],
      ),
    );
  }
}*/
/*
//yandan açılır sekme
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Menü Tasarımı'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'kullanici@email.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                // Ana sayfa tıklandığında yapılacak işlemler
                Navigator.pop(context);
                // İstediğiniz sayfaya yönlendirebilirsiniz.
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              onTap: () {
                // Ayarlar tıklandığında yapılacak işlemler
                Navigator.pop(context);
                // İstediğiniz sayfaya yönlendirebilirsiniz.
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Çıkış Yap'),
              onTap: () {
                // Çıkış Yap tıklandığında yapılacak işlemler
                Navigator.pop(context);
                // İstediğiniz çıkış işlemlerini yapabilirsiniz.
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Ana Sayfa İçeriği'),
      ),
    );
  }
}*/
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Ahad!', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white
                  )),
                  subtitle: Text('Good Morning', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54
                  )),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/signUp.jpg'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Gezilecek Yerler', Icons.video_call, Colors.deepOrange),
                  itemDashboard('Kafem Menüler', Icons.video_call, Colors.green),
                  itemDashboard('Duyurular', Icons.video_call, Colors.purple),
                  itemDashboard('Harita Üzerinde Göster', Icons.video_call, Colors.brown),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background) => Container(
    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> const GezilecekYerler()));},
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 5
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: Colors.white)
        ),
        const SizedBox(height: 8),
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium)
      ],
    ),
  );
}*/