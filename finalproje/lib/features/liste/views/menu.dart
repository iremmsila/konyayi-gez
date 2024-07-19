
import 'package:finalproje/features/dashboard/singleItemMenu.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(Menu(buttonText: '', imagePath: '',id:''));
}

class Menu extends StatelessWidget {
  final String buttonText;
  final String imagePath;
  final String id;

  Menu({required this.buttonText, required this.imagePath, required this.id});

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
        appBar: AppBar(
          title:const Text('Menu'),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue:"patates ile servis edilir",
              imagePathValue: "assets/images/ton-balikli-sandvic.png",
              baslik:"TON BALIKLI SANDVİC",
              id:'1',
            ),
          ),
        );
      },

          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
          
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/ton-balikli-sandvic.png'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: 'Merhaba Flutter',
              imagePathValue: "assets/images/ton-balikli-salata.png",
              baslik:"TON BALIKLI SALATA",
              id:'2',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
            
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/ton-balikli-salata.png'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),

            ),
          ),
            ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue:"SALATA",
              imagePathValue: 'assets/images/sezar-salata.png',
              baslik:"SEZAR SALATA",
              id:'3',
            ),
          ),
        );
      },

          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
          
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/sezar-salata.png'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: 'Merhaba Flutter',
              imagePathValue: "assets/images/hamburger.png",
              baslik:"HAMBURGER",
              id:'4',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
            
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/hamburger.png'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: "Mevlânâ Müzesi, Konya'da bulunan, eskiden Mevlâna'nın dergâhı olan yapı kompleksinde 1926 yılından beri faaliyet gösteren müzedir. 'Mevlana Türbesi' olarak da anılır.Yeşil Kubbe yani Mevlana'nın türbesi dört kalın sütun (fil ayağı) üzerine yapılmıştır. O günden sonra farklı tarihlerde çeşitli eklemeler yapılmasıyla yapı genişlemiştir. Osmanlı sultanlarının bir kısmının Mevlevi tarikatından olması Türbe'ye özel bir önem verilmesini ve iyi korunmasını sağlamıştır.",
              imagePathValue: "assets/images/tavuktava.jpeg",
              baslik:"a",
              id:'5',
            ),
          ),
        );
      },

          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
          
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/tavuktava.jpeg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: 'Merhaba Flutter',
              imagePathValue: "assets/images/pizza.jpeg",
              baslik:"PİZZA",
              id:'6',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
            
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pizza.jpeg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: "Mevlânâ Müzesi, Konya'da bulunan, eskiden Mevlâna'nın dergâhı olan yapı kompleksinde 1926 yılından beri faaliyet gösteren müzedir. 'Mevlana Türbesi' olarak da anılır.Yeşil Kubbe yani Mevlana'nın türbesi dört kalın sütun (fil ayağı) üzerine yapılmıştır. O günden sonra farklı tarihlerde çeşitli eklemeler yapılmasıyla yapı genişlemiştir. Osmanlı sultanlarının bir kısmının Mevlevi tarikatından olması Türbe'ye özel bir önem verilmesini ve iyi korunmasını sağlamıştır.",
              imagePathValue: "assets/images/eriste.png",
              baslik:"ERİŞTE",
              id:'7',
            ),
          ),
        );
      },

          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
          
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/eriste.png'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: 'Merhaba Flutter',
              imagePathValue: "assets/images/beyaz-peynirli.png",
              baslik:"BEYAZ PEYNİRLİ SANDVİC",
              id:'8',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
            
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/beyaz-peynirli.png'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: "Mevlânâ Müzesi, Konya'da bulunan, eskiden Mevlâna'nın dergâhı olan yapı kompleksinde 1926 yılından beri faaliyet gösteren müzedir. 'Mevlana Türbesi' olarak da anılır.Yeşil Kubbe yani Mevlana'nın türbesi dört kalın sütun (fil ayağı) üzerine yapılmıştır. O günden sonra farklı tarihlerde çeşitli eklemeler yapılmasıyla yapı genişlemiştir. Osmanlı sultanlarının bir kısmının Mevlevi tarikatından olması Türbe'ye özel bir önem verilmesini ve iyi korunmasını sağlamıştır.",
              imagePathValue: "assets/images/anne-kofte.png",
              baslik:"ANNE KÖFTE",
              id:'9',
            ),
          ),
        );
      },

          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
          
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/anne-kofte.png'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: 'Merhaba Flutter',
              imagePathValue: "assets/images/waffle.jpeg",
              baslik:"a",
              id:'10',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
            
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/waffle.jpeg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              
            ),
          ),
            ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: "Mevlânâ Müzesi, Konya'da bulunan, eskiden Mevlâna'nın dergâhı olan yapı kompleksinde 1926 yılından beri faaliyet gösteren müzedir. 'Mevlana Türbesi' olarak da anılır.Yeşil Kubbe yani Mevlana'nın türbesi dört kalın sütun (fil ayağı) üzerine yapılmıştır. O günden sonra farklı tarihlerde çeşitli eklemeler yapılmasıyla yapı genişlemiştir. Osmanlı sultanlarının bir kısmının Mevlevi tarikatından olması Türbe'ye özel bir önem verilmesini ve iyi korunmasını sağlamıştır.",
              imagePathValue: "assets/images/bedesten.jpg",
              baslik:"a",
              id:'11',
            ),
          ),
        );
      },

          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
          
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/bedesten.jpg'), // Fotoğrafın yolunu belirtin
                ),
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
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: 'Merhaba Flutter',
              imagePathValue: "assets/images/bedesten.jpg",
              baslik:"a",
              id:'12',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
            
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/bedesten.jpg'), // Fotoğrafın yolunu belirtin
                ),
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
              ],
            ),
            const SizedBox(height: 20),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: "Mevlânâ Müzesi, Konya'da bulunan, eskiden Mevlâna'nın dergâhı olan yapı kompleksinde 1926 yılından beri faaliyet gösteren müzedir. 'Mevlana Türbesi' olarak da anılır.Yeşil Kubbe yani Mevlana'nın türbesi dört kalın sütun (fil ayağı) üzerine yapılmıştır. O günden sonra farklı tarihlerde çeşitli eklemeler yapılmasıyla yapı genişlemiştir. Osmanlı sultanlarının bir kısmının Mevlevi tarikatından olması Türbe'ye özel bir önem verilmesini ve iyi korunmasını sağlamıştır.",
              imagePathValue: "assets/images/bedesten.jpg",
              baslik:"a",
              id:'13',
            ),
          ),
        );
      },

          style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
          
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/bedesten.jpg'), // Fotoğrafın yolunu belirtin
                ),
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
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItemMenu(
              stringValue: 'Merhaba Flutter',
              imagePathValue: "assets/images/bedesten.jpg",
              baslik:"a",
              id:'14',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(0),
            
          ),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/bedesten.jpg'), // Fotoğrafın yolunu belirtin
                ),
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
              ],
            ),
              ],
            )
          ],
        ),
    );
  }
}


