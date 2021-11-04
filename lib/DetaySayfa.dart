import 'package:film_uygulamasi/Filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {

  Filmler film;

  DetaySayfa(this.film);

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Film Detayı"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("${widget.film.filmResim}"),
            Text("${widget.film.filmAd}",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text("${widget.film.filmAciklama}",style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
            ),
            SizedBox(
              width: 180,
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                  print("${widget.film.filmAd} kiralandı.");
                },
                style: ElevatedButton.styleFrom(
                 primary: Colors.black
                ),
                child: Text("KİRALA   ${widget.film.filmFiyat} ₺",style: TextStyle(fontSize: 16,color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
