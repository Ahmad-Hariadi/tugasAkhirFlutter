import 'package:flutter/material.dart';

class DataCutiPage extends StatefulWidget {
  const DataCutiPage({super.key});

  @override
  State<DataCutiPage> createState() => _DataCutiPageState();
}

class _DataCutiPageState extends State<DataCutiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pengajuan Cuti'),
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
    );
  }
}
