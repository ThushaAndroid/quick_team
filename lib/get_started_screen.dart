import 'package:enternment_app/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
Size size=MediaQuery.sizeOf(context);
//   double screenWidth=MediaQuery.of(context).size.width;
//     double screenHeight=MediaQuery.of(context).size.height;
// print(screenWidth);
// print(screenHeight);

    return SafeArea(
      child: Scaffold(
        body:Stack(
          children: [
            Container(
              //  height: double.infinity.h,
              //  width: double.infinity.w,
              //  height: double.infinity,
              //  width: double.infinity,

              // width: ScreenUtil().setWidth(double.infinity),
              // height:ScreenUtil().setHeight(double.infinity),
               height: size.height,
               width: size.height,
              

            
              child:Column(
                 //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                        padding: EdgeInsets.only(top: 60.0.h, left: 20.0.w, right: 20.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             
                                Text('Welcome to QuickTeam',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                              
                              SizedBox(
                                height: 40.h,
                              ),
                               Text('You can make new friends and creat events with us,I join with quick team today...!',
                               textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                              
                            ],
                          ),
                      ),
             
          
                 Padding(
                   padding: EdgeInsets.only(top: 20.h),
                   child: Align(
                    alignment: Alignment.topCenter,
                     child: GestureDetector(
                              onTap: ()async{
                               Navigator.of(context).push(MaterialPageRoute(
                                            builder: (_) => Onboard(),
                                          ));
                             
                              },
                              child: Container(
                                height: 50.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // gradient: LinearGradient(
                                  //   colors: [Colors.blueGrey,Colors.blue],
                                  // ),
                                  //color: Colors.deepOrangeAccent
                                  color: Color.fromRGBO(253,63,63,4),
                                ),
                                child: Center(
                                  child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                   ),
                 ),

                 Padding(
                   padding: EdgeInsets.only(top: 40.h),
                   child: Center(
                     child: Container(
                        width: 250.w,
                        //height: 350.h,
                        //width: MediaQuery.of(context).size.width,
                       child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                         child: Container(
                          
                          child: Image.asset('assests/images/welcome.jpg',
                          fit: BoxFit.fill,
                          ),
                          
                         ),
                       ),
                     ),
                   ),
                 )
                    ],
              ),
                   ),
           
          ],
        ) ,));
  }
}