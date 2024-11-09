import 'package:assignment_by_kewisolutionary/screens/complaint_tracking_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ComplaintTrackingPage(),
    );
  }
}


