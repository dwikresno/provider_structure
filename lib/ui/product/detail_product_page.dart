import 'package:flutter/material.dart';

class DetailProducPage extends StatefulWidget {
  DetailProducPage({Key? key}) : super(key: key);

  @override
  State<DetailProducPage> createState() => _DetailProducPageState();
}

class _DetailProducPageState extends State<DetailProducPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Detail Page",
        ),
      ),
    );
  }
}
