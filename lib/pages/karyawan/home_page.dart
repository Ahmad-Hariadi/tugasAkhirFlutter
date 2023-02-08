import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir_flutter/pages/auth/login_page.dart';
// import 'package:tugas_akhir_flutter/widgets/consulatation.dart';
import 'package:tugas_akhir_flutter/widgets/date_range.dart';
// import 'package:tugas_akhir_flutter/widgets/title_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final users = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
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
      body: Center(
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
                  'Employee of Lion Air Group',
                  style: TextStyle(
                      // color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 8,
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
                          'Current Total Leave : ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          '12',
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
                                builder: (context) => DateRange(),
                              ));
                        },
                        child: Center(
                          child: Text(
                            'Apply for Leave',
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
      ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Home'),
    //     automaticallyImplyLeading: false,
    //     flexibleSpace: Container(
    //       decoration: const BoxDecoration(
    //         gradient: LinearGradient(
    //             colors: [Colors.black87, Colors.deepPurple],
    //             begin: FractionalOffset.topLeft,
    //             end: FractionalOffset.bottomRight),
    //       ),
    //     ),
    //     actions: [
    //       IconButton(
    //         onPressed: () {
    //           logout(context);
    //         },
    //         icon: Icon(
    //           Icons.logout,
    //         ),
    //       )
    //     ],
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: Column(
    //       children: [
    //         Container(
    //           color: Colors.white,
    //           width: MediaQuery.of(context).size.width,
    //           height: MediaQuery.of(context).size.height / 7,
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Row(
    //                 children: [
    //                   CircleAvatar(
    //                     radius: 24,
    //                   ),
    //                   SizedBox(
    //                     width: 20,
    //                   ),
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         "Welcome To Lion Air Group",
    //                         style: TextStyle(
    //                             color: Colors.black87,
    //                             fontWeight: FontWeight.bold),
    //                       ),
    //                       Text(
    //                         users.email!,
    //                         style: TextStyle(
    //                             color: Colors.black,
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 24),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         TitleBar(title: "Pengajuan Cuti"),
    //         Row(
    //           children: [
    //             ConsulatationCard(
    //               color: Colors.blue,
    //               name: "Jumlah Cuti Saat ini",
    //               cuti: "12",
    //             ),
    //             SizedBox(
    //               width: 20,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
