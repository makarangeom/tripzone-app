import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripzone/controllers/device_controller.dart';
import 'package:uuid/uuid.dart';

class FirebaseServices {
  DateTime now = DateTime.now();
  FirebaseFirestore db = FirebaseFirestore.instance;

  // *--- get product ---*
  Future getData(String deviceID) async {
    List itemList = [];

    db.collection('Testing').where("deviceID", isEqualTo: deviceID).snapshots()
    .listen((data) => {
      data.docs.map((doc) => {
        print('----------sgagaga------------'),
        print(doc['age']),
        if(doc['deviceID'] != deviceID){
          db.doc('jdSd7vaRpptxDS1LVzha').update(
            {
              'name': 'firstname',
              'age': '26',
              'sinceAt': now,
              'deviceID': deviceID
            }
          )
        }else{
          db.doc(deviceID).set(
            {
              'name': 'firstname',
              'age': '26',
              'sinceAt': now,
              'deviceID': deviceID
            }
          )
        }
      }).toList()
    });
    // try {
    //     await db.doc('jdSd7vaRpptxDS1LVzha').update(
    //       {
    //         'name': 'firstname',
    //         'age': '18',
    //         'sinceAt': now,
    //         'deviceID': deviceID
    //       }
    //     );
    //     print('++++++++++++++++++++');
    // } catch (e) {
      
    // }
  }

  /// Add Data When User Install The App
  Future appInstalled(String deviceID, String deviceName) async {
    // db.collection('Testing').where("deviceID", isEqualTo: deviceID).snapshots()
    // .listen((data) => {
    //   data.docs.map((doc) => {
    //     if(doc['deviceID'] != deviceID){
    //       db.doc(deviceID).set(
    //         {
    //           'name': 'firstname',
    //           'age': '16',
    //           'sinceAt': now,
    //           'deviceID': deviceID
    //         }
    //       )
    //     }else{
    //       print('This Device Aleady Installed The App.')
    //     }
    //   }).toList()
    // });
    var userRef = db.collection('Testing').doc(deviceID);
    var snapShot = userRef.get();
    await snapShot.then( ( doc ) => {
      if ( doc.exists ) {
        print(doc.exists),
        print('This Device Aleady Installed The App.'),
      }else{
        print('*******dsfgs*******'),
        userRef.set(
          {
            'deviceName': deviceName,
            'sinceAt': now,
            'deviceID': deviceID
          }
        )
      }
    });
  }

  /// Add Data When User Install The App
  Future AppPickupCounted(String deviceID, String deviceName, int minutes) async {
    var document = db.collection('appPickup').doc();
    var docID = document.id;
    db.collection('appPickup').doc(docID).set(
      {
        'id': docID,
        'deviceName': deviceName,
        'time': minutes,
        'sinceAt': now,
        'deviceID': deviceID
      }
    );
  }

  /// Add Data When User Install The App
  Future getDeviceInstalled(String deviceID) async {
    var docRef = db.collection("Testing").doc(deviceID);
    docRef.get().then((doc) {
      if (doc.exists) {
        DeviceController.instance.DeviceInfo = doc['sinceAt'];
        print('**************');
          print({"Document data:", doc['sinceAt']});
      } else {
          // doc.data() will be undefined in this case
        print('**************');
          print("No such document!");
      }
    });
  }
}