import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCuti extends StatefulWidget {
  const InfoCuti({super.key});

  @override
  State<InfoCuti> createState() => _InfoCutiState();
}

class _InfoCutiState extends State<InfoCuti> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Color(0xFF363567),
      appBar: AppBar(
        title: Text('Leave Info'),
        // automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.deepPurple],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: users.doc(user!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot data = snapshot.data!;

              String date = data['tanggalakhir'];
              String dateNow = DateTime.now().toString();

              print(date.split(" ")[0]);
              print(dateNow.split(" ")[0]);

              if (date.split(" ")[0] == dateNow.split(" ")[0]) {
                users.doc(user.uid).update({"status": "Pending"});
              }

              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.black54],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight),
                      border:
                          Border.all(color: Colors.deepPurpleAccent, width: 4),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(35),
                          bottomLeft: Radius.circular(35))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Name',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 55),
                          Text(':',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['name'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Email',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 58),
                          Text(':',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['email'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Start Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 23),
                          Text(':',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['tanggalawal'].toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('End Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 31),
                          Text(':',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['tanggalakhir'].toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Description',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 12),
                          Text(':',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['keterangan'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('Status',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 51),
                          Text(':',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 10),
                          Text(data['status'],
                              style: TextStyle(
                                  color: data['status'] == 'Approved'
                                      ? Colors.green
                                      : data['status'] == 'Rejected'
                                          ? Colors.red
                                          : Colors.amber,
                                  fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                  // trailing: ,
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
