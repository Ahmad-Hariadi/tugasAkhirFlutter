import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataCutiPage extends StatefulWidget {
  const DataCutiPage({Key? key}) : super(key: key);

  @override
  State<DataCutiPage> createState() => _DataCutiPageState();
}

class _DataCutiPageState extends State<DataCutiPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Color(0xFF363567),
      appBar: AppBar(
        title: const Text('Leave Data'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black87, Colors.deepPurple],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: users.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];
                  if (data['role'] == "Karyawan") {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.black54],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight),
                            border: Border.all(
                                color: Colors.deepPurpleAccent, width: 4),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(35),
                                bottomLeft: Radius.circular(35))),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4.9,
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Name',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 55),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['name'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Email',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 58),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['email'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Start Date',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 23),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['tanggalawal'].toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('End Date',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 31),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['tanggalakhir'].toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Available Leave',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 20),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text('${data['maxCuti'].toString()} days',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Description',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 12),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 10),
                                Text(data['keterangan'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text('Status',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 51),
                                Text(':',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
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
                    return Container();
                  }
                },
              );
            } else {
              return Text('Loading..');
            }
          }),
    );
  }
}
