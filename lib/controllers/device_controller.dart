import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DeviceController extends GetxController {
  static DeviceController instance = Get.find();
  FirebaseFirestore db = FirebaseFirestore.instance;
  final CollectionReference TestingCollection = FirebaseFirestore.instance.collection('Testing');

  DateTime openApp = DateTime.now();
  Timestamp DeviceInfo = Timestamp.now();
  Timestamp SinceDate = Timestamp.now();

  Future<void> getInfoa() async {
    print('object');
  }

  Future getInfo(String deviceID) async {
    var docRef = db.collection("Testing").doc(deviceID);
    docRef.get().then((doc) {
      if (doc.exists) {
        SinceDate = doc['sinceAt'];
        print('**************');
        print({"Document data:", doc['sinceAt']});
      } else {
        print('**************');
        print("No such document!");
      }
    });
  }
}