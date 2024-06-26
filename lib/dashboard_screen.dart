import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
          child: Align(
            alignment: Alignment.center,
            child: Text("Welcome to Dashboard",
            style: TextStyle(fontSize: 30.sp,color: Color.fromRGBO(253,63,63,4),fontWeight: FontWeight.bold),),),
          ),
        ) ,
    );
  }
}