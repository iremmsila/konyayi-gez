import 'package:finalproje/features/dashboard/views/single_item.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(YerlerListesi(buttonText: '', imagePath: '',));
}

class YerlerListesi extends StatelessWidget {
  final String buttonText;
  final String imagePath;

  YerlerListesi({required this.buttonText, required this.imagePath});

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
          title: Text('Gezilecek Yerler'),
        ),
        body: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
        // Tıklandığında Navigator ile başka bir sayfaya geçiş yapma
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleItem(
              stringValue: "Mevlânâ Müzesi, Konya'da bulunan, eskiden Mevlâna'nın dergâhı olan yapı kompleksinde 1926 yılından beri faaliyet gösteren müzedir. 'Mevlana Türbesi' olarak da anılır.Yeşil Kubbe yani Mevlana'nın türbesi dört kalın sütun (fil ayağı) üzerine yapılmıştır. O günden sonra farklı tarihlerde çeşitli eklemeler yapılmasıyla yapı genişlemiştir. Osmanlı sultanlarının bir kısmının Mevlevi tarikatından olması Türbe'ye özel bir önem verilmesini ve iyi korunmasını sağlamıştır.",
              imagePathValue: "assets/images/mevlana.jpg",
              baslik: "Mevlana Müzesi",
              googleMapsUrl: 'https://www.google.com/maps/d/viewer?mid=1vwopY-u2V7T9qoVNIXyU82Zmyqs',
            ),
          ),
        );
      },


              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/mevlana.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'MEVLANA \n MÜZESİ',
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
            builder: (context) => SingleItem(
              stringValue: 'Bedesten Çarşısı içerisinde Konya’nın tarihî dokusunu yansıtan 40 adet sokak ve 2687 tane dükkân bulunmaktadır. Kapu Câmisi ile Aziziye Câmisinin de bulunduğu tarihî Bedestende Mevlâna’nın gezdiği sokaklarda gezerek, alışveriş yapabilirsiniz. Ağırlıklı olarak giyim kuşam, ev tekstili ve aksesuarların bulunduğu Bedesten, özellikle düğün hazırlığı yapan çiftlerin ve ailelerinin uğrak yeridir.Çarşı esnafının neredeyse tümü babadan, dededen kalma mesleği icra etmesinden dolayı bu tarihi dokuya esnafta katılmaktadır. Çarşı içerisinde her yerde görülen marka ürünlerin yerine geleneksel ve kültürel ürünlerin satıldığı dükkanlar mevcut.Gezi için Konya’da bulunuyorsanız bu çarşıya mutlaka uğramalısınız. Osmanlı mimari yapısının altında hala yaşatılan bir çarşı olan Bedesten Çarşısında hiç bir yerde görmediğiniz ürünlere ve antikalarada rastlayabilirsiniz.',
              imagePathValue: "assets/images/bedesten.jpg",
              baslik: "BEDESTEN ÇARŞISI", googleMapsUrl: 'https://www.google.com/maps/d/embed?mid=1dsGImXhVEI6i1D5NLtlkcoPX9SA&hl=en_US&ehbc=2E312F',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
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
                'BEDESTEN \n ÇARŞISI',
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
            builder: (context) => SingleItem(
              stringValue: 'Konya Büyükşehir Belediyesi tarafından Japon mimarisine uygun olarak yapılan Japon Kyoto Parkı İstanbul Yolu üzeri Sancak Mahallesi’nde yer alıyor. Japonya’nın Kyoto şehri ile kardeş şehir ilişkilerinin geliştirilmesi amacıyla yapılan park, Konya’nın yeşil dokusuna katkıda bulunurken farklı mimari yapısıyla da ziyaretçi akınına uğruyor. 30 bin m² alana kurulan parkın inşaat döneminde Japon kültürüne uygunluğu konusunda Kyoto Belediyesi ile sürekli görüş alışverişinde bulunularak, zaman zaman Kyoto’dan Japon mühendisler gelerek incelemeler yapmıştır. Japon mimarisi ve kültürüne uygun olarak...',
              imagePathValue: "assets/images/japon.jpg",
              baslik: "JAPON PARKI", googleMapsUrl: 'https://www.google.com/travel/hotels/s/12ENF4UVedB2sd3w8',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/japon.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'JAPON \n PARKI',
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
            builder: (context) => SingleItem(
              stringValue: "Arkeoloji Müzesi ilk defa 1901 yılında Karma Ortaokulu'nun güneybatı köşesindeki yapıda açılmıştır. 1927 yılında eserler sergilenmek üzere buradan Mevlânâ Müzesi'ne, 1953 yılında da İplikçi Camii'ne taşınmıştır. 1962 yılında ise bugünkü müze kurularak hizmete sunulmuştur.\nMüzemiz Neolitik Çağdan başlamak üzere, Eski Tunç, Orta Tunç (Asur Ticaret Kolonileri), Demir (Frig, Urartu) Klasik, Hellenistik, Roma ve Bizans Devrine ait eserler sergilenmektedir.",
              imagePathValue: "assets/images/arkeoloji.jpg",
              baslik:"ARKEOLOJİ MÜZESİ", googleMapsUrl: 'https://www.google.com/travel/hotels/s/29PwzBRG7Kco1RsNA',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/arkeoloji.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'ARKEOLOJİ \n MÜZESİ',
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
            builder: (context) => SingleItem(
              stringValue: 'Konya Kalehan Ecdat Bahçesi yapımı 2017 yılında tamamlanmıştır. Konya ili Selçuklu ilçesinde bulunan Kalehan Ecdat Parkı 110 bin metrekarelik bir alana sahiptir. Bu büyük proje Konya Büyükşehir Belediyesi tarafından yapılmış olup, Konya için önemli bir değer olmuştur. Projede tarihin mimari izleri gözetilmiş olup, Selçuklu ve Osmanlı mimarisi izlerini yansıtan örneklere yer verilmiştir. ',
              imagePathValue: "assets/images/ecdat.jpeg",
              baslik:"ECDAT PARKI", googleMapsUrl: '',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/ecdat.jpeg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'ECDAT \n PARKI',
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
            builder: (context) => SingleItem(
              stringValue: "Türk Yıldızları Parkı'nın diğer parklardan farklılaşan iki önemli özelliği bulunmaktadır. İlk olarak, 321 bin metrekarelik geniş park alanı ve doğal yeşil dokusuyla, Konya'nın en büyük parkı olmasıdır. Ayrıca, içerisinde Airbus A300 uçağı yer almaktadır. Bu kısa ve orta menzilli, geniş gövdeli yolcu ve nakliye uçağı, dünyada çift motorlu ilk örneği olup, 1972 yılında üretilen 557 uçaktan biridir.Uçak parkı, her gün 08.30 ila 22.00 saatleri arasında ziyaretçilerini ağırlamaktadır. İçinde bulunan 100 kişilik restoran ve 300 kişilik açık kafeterya, burayı ziyaret edenlere Konya'nın eşsiz mutfağından lezzetler sunma fırsatı vermektedir.",
              imagePathValue: "assets/images/yildizparki.jpg",
              baslik: "YILDIZ PARKI", googleMapsUrl: 'https://www.google.com.tr/travel/entity/key/ChkI0vHd1Nzwj_YoGg0vZy8xMWM0Yms1ejY5EAQ?g2lb=2502405%2C2502548%2C4208993%2C4254308%2C4258168%2C4260007%2C4270442%2C4274032%2C4285990%2C4289525%2C4291318%2C4301054%2C4305595%2C4308216%2C4308983%2C4313006%2C4314846%2C4315873%2C4317816%2C4317915%2C4324293%2C4326405%2C4328159%2C4329288%2C4339687%2C4340902%2C4270859%2C4284970%2C4291517%2C4292955%2C4316256%2C4333108&hl=en&gl=tr&un=1&rp=ELWv9Of1rtSTygE4AUAASAI&ictx=1&sa=X&tcfs=EhoaGAoKMjAxOS0xMi0yNhIKMjAxOS0xMi0yN1IA&utm_campaign=sharing&ap=MAA&ts=CAEaBAoCGgAqBAoAGgA&ved=0CAAQ5JsGahcKEwj4u9f7wc2DAxUAAAAAHQAAAAAQAw&utm_medium=link_btn&utm_source=poi',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/yildizparki.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'YILDIZ \n PARKI',
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
            builder: (context) => SingleItem(
              stringValue: "Türkiye’nin ilk kelebek bahçesi ve Avrupa’nın en büyük kelebek uçuş alanına sahip Konya Tropikal Kelebek Bahçesi 2015 yılında ziyarete açılmıştır. Tropikal Kelebek Bahçesi 7.200 m2 kullanım alanına sahiptir. Kelebek Uçuş Alanı ve Böcek Müzesi olmak üzere iki ana bölümde 3.500 m2’lik gezi alanında hizmet verilmektedir. Binanın inşasında 630 ton çelik ve her biri farklı ölçüde 1730 adet camın olduğu cam giydirme cephe kaplama sistemi kullanılmıştır. Ayrıca camlarda, kelebeklerin doğal ortamlarında olduğu gibi güneşten gelen ışınlarla yönlerini bulmalarını sağlayan UV ışınlarının bahçe içerisine maximum oranda geçişini sağlayan özel PVB malzemesi kullanılmıştır. Bahçemiz, yetişkinlere özellikle de çocuklara doğa ve hayvan sevgisini aşılamak amacıyla doğaya uygun bir şekilde kelebek formunda inşa edilmiştir. Bahçe sıcaklığı 28 °C % 80 nem olacak şekilde kontrol altında tutulmaktadır.",
              imagePathValue: "assets/images/kelebek.jpg",
              baslik: "KELEBEK VADİSİ", googleMapsUrl: '',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/kelebek.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'KELEBEK \n VADİSİ',
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
            builder: (context) => SingleItem(
              stringValue: "Cami, 1558 yılında II. Selim tarafından sancak beyi olarak görev yapan şehzade iken yaptırılmıştır. Cami, Mimar Sinan'ın baş mimarlık görevinde bulunduğu sırada yapılmış olmasına rağmen, yapı hiçbir otobiyografisinde yer almamaktadır. [1] Konya'da Mimari Sinan sadece bir bakımevinin tadilatını sağlar. [1] Yapı, Selim'in padişah olmasından sonra 1570 yılında tamamlandı. Daha sonra 1685, 1816 ve 1914'te üç kez onarılmıştır.",
              imagePathValue: "assets/images/selimiye.jpg",
              baslik: "SELİMİYE CAMİ", googleMapsUrl: '',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/selimiye.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'SELİMİYE \n CAMİ',
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
            builder: (context) => SingleItem(
              stringValue: "Meram Bağları, Konya’nın batısındaki Loras ve Takkeli dağlarının eteklerinden demiryoluna kadar uzanan geniş bir arazide yer almaktadır. Bağlar, batıdaki dağlık araziden kaynaklanıp Meram vadisi yoluyla tüm Meram ve hatta Konya kentini de sulayan Meram Çayı’nın hayat verdiği verimli topraklar üzerindedir. Tarih boyunca coğrafyası, yeşil dokusu ve bağlarıyla dillere destan olmuş bir bağ yerleşmesidir. Muhteşem tabii ortamı, havası, yeşil dokusu, suyu, kuş sesleri ile özellikle yaz aylarında insanları dinlendiren, hastaları iyileştiren bir yapısı vardır",
              imagePathValue: "assets/images/meram.jpg",
              baslik: "MERAM BAĞLARI", googleMapsUrl: '',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/meram.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'MERAM \n BAĞLARI',
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
            builder: (context) => SingleItem(
              stringValue: "Konya Alâeddin Tepesi’nin doğusunda, geniş bir park içinde bulunan Şems-i Tebrizi Türbe ve Mescidi birbirine bitişiktir. Türbe, klâsik Selçuklu kümbetleri tipindedir. Üstü sonradan örtülen kurşun bir çatı ile kaplıdır ve kubbenin altında büyük bir sanduka mevcut olup burada Şems-i Tebrizi’nin naaşının olduğu kabul edilmektedir. Hz. Mevlâna'nın düşünce hayatından çok önemli bir yere sahip olan Şems-i Tebrizi’nin Türbesi ve Mescidi Konya'da en çok ziyaret edilen yerlerden biridir.",
              imagePathValue: "assets/images/şemsi.jpg",
              baslik: "ŞEMSİ TEBRİZİ", googleMapsUrl: '',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/şemsi.jpg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'ŞEMSİ \n TEBRİZİ',
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
            builder: (context) => SingleItem(
              stringValue: "Sille, Frigyalılar’dan bugüne değin yerleşim görmüş ve Bizans döneminden itibaren de Konya’nın önemli bir yerleşim yeri ve Erken Hristiyanlık devrinin ilk merkezlerinden, İstanbul-Kudüs arasındaki hac yolunun önemli bir durak noktası olmuştur. Günümüzde Selçuklu ilçesine bağlı bir mahalledir. Aynı zamanda Konya Kültür Varlıkları Koruma Bölge Kurulu kararınca 'kentsel sit alanı' olarak ilan edilmiştir.Deniz seviyesinden yaklaşık 1115 metre yüksekliğe sahip ve 1152 metrekare yüzölçümü vardır. Sille’nin etrafında bulunan tepelerin büyük bir kısmı tüften oluşmuştur. Bizans döneminde de bu tepeler rahatlıkla oyularak hristiyanların saklanması ve ibadet etmesi için şapeller oluşturulmuştur.",
              imagePathValue: "assets/images/sille.jpg",
              baslik: "SİLLE", googleMapsUrl: '',
            ),
          ),
        );
      },
              style: ElevatedButton.styleFrom(
            padding:const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/sille.jpeg'), // Fotoğrafın yolunu belirtin
                ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 41, 20, 41),
              child: const Text(
                'SİLLE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
            ),
            const SizedBox(height: 20),
          ],
        ),
    );
  }
}


