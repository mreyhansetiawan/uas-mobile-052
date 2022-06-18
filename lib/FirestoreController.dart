import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController extends GetxController {
  var users = FirebaseFirestore.instance.collection("users").obs;
}
