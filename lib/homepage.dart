import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notdefteri/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<NoteData> notlar = [
  NoteData(yazi: "Un/su/Süt", baslik: "Alisveris Listesi"),
  NoteData(yazi: "16.00", baslik: "Berber"),
  NoteData(yazi: "07.00-13.50", baslik: "Okul saati"),
  NoteData(yazi: "07.00-13.50", baslik: "Okul saati"),
  NoteData(yazi: "07.00-13.50", baslik: "Okul saati"),
];
List<Color> renkListesi = [
  AppConstants().blue,
  AppConstants().purple,
  AppConstants().greysish,
  AppConstants().green,
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                TextEditingController _baslikController =
                    TextEditingController();
                TextEditingController _notController = TextEditingController();
                return AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        notlar.add(NoteData(
                            yazi: _notController.text,
                            baslik: _baslikController.text));
                        setState(() {});
                      },
                      child: Text(
                        "EKLE",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                  backgroundColor: AppConstants().blue,
                  title: Text(
                    "Not Ekle",
                    style: TextStyle(color: Colors.white),
                  ),
                  content: SizedBox(
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Başlık",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CupertinoTextField(
                          controller: _baslikController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Not",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CupertinoTextField(
                          controller: _notController,
                          maxLength: 3,
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(CupertinoIcons.add),
      ),
      appBar: AppBar(
        title: Text(
          "NOT DEFTERİ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 2, 81, 126),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: notlar.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppConstants().blue,
                          actions: [],
                          title: Text(notlar[index].baslik),
                          content: Text(
                            notlar[index].yazi,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: renkListesi[index % renkListesi.length],
                  child: Center(
                      child: Text(
                    notlar[index].baslik,
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              );
            }),
      ),
    );
  }
}

class NoteData {
  final baslik;
  final yazi;
  NoteData({required this.yazi, required this.baslik});
}
