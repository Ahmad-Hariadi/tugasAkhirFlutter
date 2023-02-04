import 'package:flutter/material.dart';

class ListCuti extends StatefulWidget {
  const ListCuti({super.key});

  @override
  State<ListCuti> createState() => _ListCutiState();
}

class _ListCutiState extends State<ListCuti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pengajuan Cuti'),
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
    );
  }
}
