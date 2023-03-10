import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListCuti extends StatefulWidget {
  const ListCuti({Key? key}) : super(key: key);

  @override
  State<ListCuti> createState() => _ListCutiState();
}

class _ListCutiState extends State<ListCuti> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      backgroundColor: Color(0xFF363567),
      appBar: AppBar(
        title: const Text('List Employee Leave'),
        // automaticallyImplyLeading: false,
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
                    if (data['status'] == 'Rejected' ||
                        data['status'] == 'Approved') {
                      return Container();
                    }
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
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.7,
                        padding: EdgeInsets.all(8),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Name',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 80),
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
                                SizedBox(width: 83),
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
                                SizedBox(width: 48),
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
                                SizedBox(width: 56),
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
                                SizedBox(width: 6),
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
                                SizedBox(width: 37),
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
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      var range =
                                          DateTime.parse(data['tanggalakhir'])
                                              .difference(DateTime.parse(
                                                  data['tanggalawal']));

                                      users.doc(data.id).update({
                                        "maxCuti": ((data['maxCuti'] -
                                            (range.inDays + 1))),
                                        "status": "Approved",
                                      });
                                    },
                                    child: Text(
                                      'Approve',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: new ElevatedButton(
                                    onPressed: () {
                                      users
                                          .doc(data.id)
                                          .update({"status": "Rejected"});
                                    },
                                    child: Text(
                                      'Reject',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                    ),
                                  ),
                                )
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
