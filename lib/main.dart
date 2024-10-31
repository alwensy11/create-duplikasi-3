import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> judul = [
      'Es Mojito',
      'Es Teh Lemon',
      'Es Blubberry',
      'Kopi Panas'
    ];

    List<String> ulasan = [
      '9 rb ulasan',
      '10,5 rb ulasan',
      '8,2 rb ulasan',
      '6 rb ulasan',
    ];

    List<String> mata = [
      '10,9 rb',
      '25 rb',
      '12,8 rb',
      '10 rb',
    ];
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.chevron_left, size: 35.0),
          title: Text("Menu Caffekyuuu"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 251, 217, 255),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: GridView.count(
            childAspectRatio: 0.6,
            crossAxisCount: 2, // Menentukan jumlah kolom
            children: List.generate(4, (index) {
              return Card(
                color: Color.fromARGB(255, 251, 217, 255),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      children: <Widget>[
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image(
                                  image: const AssetImage('assets/images/logo.jpg'),
                                  fit: BoxFit.cover,
                                  height: constraints.maxWidth * 0.15,
                                  width: constraints.maxWidth * 0.15,
                                ),
                              ),
                            Text(
                              "Caffekyuu Official",
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            CircleAvatar(
                              radius: 5.0,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.check,
                                size: 5.5,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(9.0),
                          child: Image.asset(
                            "assets/images/gambar$index.jpg",
                            width: constraints.maxWidth * 0.7,
                            height: constraints.maxWidth * 0.7,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          judul[index],
                          style: TextStyle(
                              fontSize: constraints.maxHeight * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 10.0),
                        RatingBar.builder(
                          initialRating: 4, // Rating awal
                          minRating: 1, // Rating minimum
                          direction: Axis.horizontal, // Arah rating bar
                          allowHalfRating: true, // Mengizinkan rating setengah
                          itemCount: 5, // Jumlah bintang
                          itemSize: constraints.maxHeight * 0.05,
                          itemPadding: EdgeInsets.symmetric(
                              horizontal: 4.0), // Jarak antar item
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            print(rating); // Menampilkan rating yang dipilih
                          },
                        ),
                        Text(
                          ulasan[index],
                          style: TextStyle(fontSize: constraints.maxHeight * 0.05,),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            SizedBox(width: 30.0),
                            Icon(
                              Icons.visibility,
                              size: constraints.maxHeight * 0.08,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 7.5),
                            Text(
                              mata[index],
                              style: TextStyle(fontSize: constraints.maxHeight * 0.05, color: Colors.black),
                            ),
                            SizedBox(width: 30.0),
                            Icon(
                                Icons.bookmark_border,
                                size: constraints.maxHeight * 0.07,
                                color: Colors.black,
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
