import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammadreyhansetiawan_2009106052/tampilkan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/Hal1",
      routes: {
        "/Hal1": (context) => Hal1(),
      },
    );
  }
}

class Hal1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                "Resepien",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Neucha",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text(
                "Foodie",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Neucha",
                ),
              ),
              tileColor: Color.fromARGB(255, 248, 242, 206),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Hal2()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text(
                "Dessert",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Neucha",
                ),
              ),
              leading: Icon(Icons.fastfood_outlined),
              tileColor: Color.fromARGB(255, 243, 238, 169),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Hal3()));
              },
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text(
                "Kritik & Saran",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Neucha",
                ),
              ),
              leading: Icon(Icons.pin_end),
              tileColor: Color.fromARGB(255, 243, 238, 169),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Tampilkan()));
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Resepien by Reyhan",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Neucha'),
                    ),
                    SizedBox(height: 20.0),
                    Image.asset("assets/images/landing.jpg",
                        width: 450.0, height: 450.0, fit: BoxFit.fill),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close App",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Hal2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final mySnackBar = SnackBar(
            content: Text(
              "Ini merupakan halaman Resep Populer Hari ini",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            duration: Duration(seconds: 3),
            padding: EdgeInsets.all(8),
            backgroundColor: Color.fromARGB(255, 97, 97, 96),
          );
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
        },
        backgroundColor: Color(0XFFffbf00),
        child: Icon(Icons.star),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Resepien by Reyhan",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Neucha'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Kumpulan Resep Makanan terupdate",
                      style: TextStyle(
                          color: Color(0XFFffbf00),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Neucha'),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                Icon(Icons.search, color: Color(0XFFffbf00)),
                            hintText: "Cari Resep",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Resep Hari Ini',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // height: 300,
                      height: MediaQuery.of(context).size.height / 2.8,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          cardView(
                              'assets/images/chickenteriyaki.jpeg', context),
                          cardView2('assets/images/nasigoreng.jpeg', context),
                          cardView3(
                              'assets/images/chickencordon.jpeg', context),
                          cardView4('assets/images/udang.jpeg', context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardView(image, context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Color(0xffd6dbdc)),
          child: Column(
            children: <Widget>[
              Hero(
                tag: image,
                child: Container(
                    height: 195,
                    width: 185.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.contain))),
              ),
              Text(
                "Chicken Teriyaki",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blueGrey,
                  height: 1.0,
                  width: 50.0,
                ),
              ),
              SizedBox(height: 7.0),
              Text("Klik untuk Resep Lengkap",
                  style: TextStyle(
                      color: Color(0xFFff7f00),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardView2(image, context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Color(0xffd6dbdc)),
          child: Column(
            children: <Widget>[
              Hero(
                tag: image,
                child: Container(
                    height: 195,
                    width: 185.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.contain))),
              ),
              Text(
                "Nasi Goreng",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blueGrey,
                  height: 1.0,
                  width: 50.0,
                ),
              ),
              SizedBox(height: 7.0),
              Text("Klik untuk Resep Lengkap",
                  style: TextStyle(
                      color: Color(0xFFff7f00),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardView3(image, context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Color(0xffd6dbdc)),
          child: Column(
            children: <Widget>[
              Hero(
                tag: image,
                child: Container(
                    height: 195,
                    width: 185.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.contain))),
              ),
              Text(
                "Chicken Cordon Bleu",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blueGrey,
                  height: 1.0,
                  width: 50.0,
                ),
              ),
              SizedBox(height: 7.0),
              Text("Klik untuk Resep Lengkap",
                  style: TextStyle(
                      color: Color(0xFFff7f00),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardView4(image, context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Color(0xffd6dbdc)),
          child: Column(
            children: <Widget>[
              Hero(
                tag: image,
                child: Container(
                    height: 195,
                    width: 185.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.contain))),
              ),
              Text(
                "Udang Asam Manis",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blueGrey,
                  height: 1.0,
                  width: 50.0,
                ),
              ),
              SizedBox(height: 7.0),
              Text("Klik untuk Resep Lengkap",
                  style: TextStyle(
                      color: Color(0xFFff7f00),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.home, color: Color(0XFFffbf00)),
                          Icon(Icons.share, color: Colors.grey[400])
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.bookmark,
                            color: Colors.grey[400],
                          ),
                          Icon(Icons.notifications, color: Colors.grey[400])
                        ],
                      )),
                ])));
  }
}

class Hal3 extends StatefulWidget {
  const Hal3({Key? key}) : super(key: key);

  @override
  State<Hal3> createState() => _Hal3State();
}

class _Hal3State extends State<Hal3> {
  final List<BottomNavigationBarItem> _myItem = [
    BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "1"),
    BottomNavigationBarItem(icon: Icon(Icons.fastfood_outlined), label: "2"),
    BottomNavigationBarItem(icon: Icon(Icons.fastfood_sharp), label: "3"),
  ];

  final List<Widget> _myPages = [
    Container(
      color: Color.fromARGB(255, 183, 132, 238),
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Blueberry Oreo Mousse",
            style: TextStyle(
              color: Color.fromARGB(255, 5, 15, 20),
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontFamily: 'Neucha',
            ),
          ),
          SizedBox(height: 20.0),
          Image.asset("assets/images/dessert1.jpg",
              width: 450.0, height: 450.0, fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
        ],
      ),
    ),
    Container(
      color: Color.fromARGB(255, 230, 141, 191),
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Puding Strawberry Cake",
            style: TextStyle(
                color: Color.fromARGB(255, 4, 11, 14),
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Neucha'),
          ),
          SizedBox(height: 20.0),
          Image.asset("assets/images/dessert2.jpg",
              width: 450.0, height: 450.0, fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
        ],
      ),
    ),
    Container(
      color: Color.fromARGB(255, 238, 203, 132),
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Pudding Custard",
            style: TextStyle(
                color: Color.fromARGB(255, 12, 35, 47),
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Neucha'),
          ),
          SizedBox(height: 20.0),
          Image.asset("assets/images/dessert3.jpg",
              width: 450.0, height: 450.0, fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
        ],
      ),
    ),
  ];
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dessert"),
        backgroundColor: Color.fromARGB(255, 228, 128, 128),
      ),
      body: _myPages.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _myItem,
        currentIndex: _pageIndex,
        onTap: (int newIndex) {
          setState(() {
            _pageIndex = newIndex;
          });
        },
      ),
    );
  }
}
