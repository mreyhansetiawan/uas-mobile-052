import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhammadreyhansetiawan_2009106052/CrudController.dart';
import 'package:muhammadreyhansetiawan_2009106052/FirestoreController.dart';
import 'package:muhammadreyhansetiawan_2009106052/TextController.dart';
import 'package:muhammadreyhansetiawan_2009106052/tampilkan.dart';

class KritikSaran extends StatelessWidget {
  KritikSaran({Key? key, this.isUpdate = false}) : super(key: key);

  bool isUpdate;

  @override
  Widget build(BuildContext context) {
    FirestoreController fsc = Get.find();
    TextController tsc = Get.put(TextController());
    CrudController crudController = Get.find();

    id(isUpdate) {
      tsc.kritikCtrl.text = crudController.kritik.value;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 255, 214),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
        title: Text(
          "Tambah Kritik dan Saran",
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
          Column(
            children: [
              MyTextField(
                controller: tsc.kritikCtrl,
                labelText: "Silahkan berikan kritik dan saran anda",
              ),
              SizedBox(height: 35),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      isUpdate
                          ? fsc.users.value.doc(crudController.id.value).update(
                              {
                                "name": tsc.kritikCtrl.text,
                              },
                            )
                          : fsc.users.value.add({
                              "name": tsc.kritikCtrl.text,
                            });
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Kritik dan Saran berhasil Ditambahkan",
                          ),
                        ),
                      );
                    },
                    child: Text('Tambah'),
                  ),
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Tampilkan())),
                    child: Text("Lihat Kritik & Saran"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
