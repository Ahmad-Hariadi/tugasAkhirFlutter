import 'package:cloud_firestore/cloud_firestore.dart';
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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Cuti'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
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
              return ListView(
                  children: snapshot.data!.docs.map((document) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.black54],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight),
                        border: Border.all(color: Colors.deepPurple, width: 4),
                        borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 6,
                    padding: EdgeInsets.all(8),
                    // leading: CircleAvatar(child: Text(document['name'][0])),
                    // title: Text('Name: ' + document['name']),
                    // subtitle: Text('Email: ' + document['email']),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Name',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 50),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(document['name'],
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
                            SizedBox(width: 53),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(document['email'],
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
                            SizedBox(width: 21),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(document['tanggalawal'],
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
                            SizedBox(width: 29),
                            Text(':',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            SizedBox(width: 10),
                            Text(document['tanggalakhir'],
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
                            Text(document['keterangan'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                      ],
                    ),
                    // trailing: ,
                  ),
                );
              }).toList());
            } else {
              return Text('Loading..');
            }
          }),
    );
  }
}
