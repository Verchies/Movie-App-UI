import 'package:film_uygulamasi/DetaySayfa.dart';
import 'package:film_uygulamasi/Filmler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Filmler>> filmleriGetir() async{
    var filmList = <Filmler>[];

    var f1 = Filmler(1, "assets/anadoluda.png", "Anadoluda", 15.99,"Bir cinayet sonrasinda yola çikan bir doktor ve bir savcinin 12 saatlik gerlimli öyküsü.");
    var f2 = Filmler(1, "assets/django.png", "Django",9.99,"Django, Quentin Tarantino'nun yazdığı ve yönettiği 2012 yapımı western film.");
    var f3 = Filmler(1, "assets/inception.png", "Inception", 19.99,"Başlangıç, Christopher Nolan tarafından yazılan ve yönetilen bilimkurgu türündeki ABD filmidir.");
    var f4 = Filmler(1, "assets/interstellar.png", "Interstellar", 19.99,"Yıldızlararası, Christopher Nolan tarafından yönetilen epik bilim kurgu türündeki, 2014 yapımı ABD filmi.");
    var f5 = Filmler(1, "assets/thehatefuleight.png", "The Hateful Eight", 8.99,"The Hateful Eight, Quentin Tarantino'nun yazıp yönettiği ve Samuel L. Jackson, Kurt Russell, Jennifer Jason Leigh, Walton Goggins, Demián Bichir, Tim Roth, Michael Madsen ve Bruce Dern'in yer aldığı Amerikan western filmi.");
    var f6 = Filmler(1, "assets/thepianist.png", "The Pianist", 7.99,"Piyanist, ya da orijinal ismiyle The Pianist, Roman Polanski'nin 2002 yapımı uzun metrajlı dramatik ve biyografik savaş filmidir.");

    filmList.add(f1);
    filmList.add(f2);
    filmList.add(f3);
    filmList.add(f4);
    filmList.add(f5);
    filmList.add(f6);

    return filmList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Filmler"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){
                showDialog(
                 context: context,
                 builder: (BuildContext context){
                   return AlertDialog(
                     title: Text("Info",textAlign: TextAlign.center,),
                     content: Text("Bu uygulama Flutter'da FutureBuilder, ListView ve GridView yapılarını öğrenirken geliştirdiğim bir film uygulaması arayüzü projesidir. ",textAlign: TextAlign.center,),
                   );
                 }
                );
              },
              icon: Icon(Icons.info_outline)
            ),
          ],
        ),
        body: FutureBuilder<List<Filmler>>(
          future: filmleriGetir(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              var filmList = snapshot.data!;

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.2,
                crossAxisSpacing:  8,
                ),
                itemCount: filmList.length,
                itemBuilder: (context, indeks) {
                  var film = filmList[indeks];

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(film)));
                    },
                    child: Card(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                        [
                          Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8,top: 3),
                            child: Image.asset("${film.filmResim}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("${film.filmAd}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                          Text("${film.filmFiyat} ₺",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return Center();
            }
          },
        ),
      ),
    );
  }
}
