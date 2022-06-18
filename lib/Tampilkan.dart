import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammadreyhansetiawan_2009106052/CrudController.dart';
import 'package:muhammadreyhansetiawan_2009106052/FirestoreController.dart';
import 'package:muhammadreyhansetiawan_2009106052/kritikSaran.dart';

class Tampilkan extends StatelessWidget {
  Tampilkan({Key? key}) : super(key: key);

  final FirestoreController fsc = Get.put(FirestoreController());
  final CrudController crudController = Get.put(CrudController());

  Widget builder(context, snapshot) {
    return (snapshot.hasData)
        ? Column(
            children: snapshot.data!.docs
                .map<Widget>(
                  (e) => MyListTile(
                    title: e.get('name'),
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomAlert(
                          id: e.id,
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
  }

  walked() {
    return StreamBuilder<QuerySnapshot>(
      stream: fsc.users.value.orderBy('name').snapshots(),
      builder: builder,
    );
  }

  called() {
    return FutureBuilder<QuerySnapshot>(
      future: fsc.users.value.orderBy('name').get(),
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 227, 210),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
        title: Text(
          "Kritik dan Saran for Resepien",
          style: TextStyle(
            color: Color.fromARGB(255, 218, 234, 243),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Neucha",
          ),
        ),
      ),
      body: ListView(
        children: [
          walked(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => KritikSaran()),
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 0, 0, 0)),
    );
  }
}

class CustomAlert extends StatelessWidget {
  const CustomAlert({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    FirestoreController fsc = Get.find();
    return AlertDialog(
      title: const Text("Hapus Kritik"),
      content: const Text("Apakah anda yakin?"),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            fsc.users.value.doc(id).delete();
            Get.back();
          },
          child: const Text(
            "Hapus",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({Key? key, required this.title, this.onLongPress})
      : super(key: key);

  final String title;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onLongPress: onLongPress,
    );
  }
}
