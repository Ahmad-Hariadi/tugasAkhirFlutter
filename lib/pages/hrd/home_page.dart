import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir_flutter/pages/auth/login_page.dart';
import 'package:tugas_akhir_flutter/pages/hrd/list_cuti.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final users = auth.currentUser!;
    final data = firestore.collection('users');
    return Scaffold(
      backgroundColor: Color(0xFF363567),
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black87, Colors.deepPurple],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: StreamBuilder(
          stream: data.where('status', isEqualTo: 'Pending').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'HRD',
                        style: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ClipOval(
                        child: Container(
                            color: Colors.blueGrey[100],
                            width: 120,
                            height: 120,
                            child: Icon(
                              Icons.person,
                              size: 85,
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'HRD Lion Air Group',
                        style: TextStyle(
                            // color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        users.email!,
                        style: TextStyle(
                          color: Colors.blueGrey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[600],
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Employee Leave : ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Text(
                                snapshot.data!.docs.length.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black87,
                                    Colors.deepPurple,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListCuti()));
                              },
                              child: Center(
                                child: Text(
                                  'List Employee Leave',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
