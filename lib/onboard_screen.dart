import 'package:enternment_app/loging_sceen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final controller=PageController();
  bool isLastPage=false;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 20.0.h, right: 20.0.w,bottom: 80.h),
          child: PageView(
            controller: controller,
            onPageChanged: (index) => {
              setState(() => isLastPage=index==2)
            },
            children: [
              Container(
                //color: Colors.red,
                child: Center(child: Column(
                  children: [
                      Padding(
                   padding:  EdgeInsets.only(top: 30.h),
                   child: Center(
                     child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                       child: Container(
                        width: 250.w,
                        //height: 350,
                        child: Image.asset('assests/images/welcome.jpg',
                        fit: BoxFit.fill,
                        ),
                        
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                          height: 40.h,
                        ),
                     Text('Arrange your Event Here',
                     textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                        
                        SizedBox(
                          height: 40.h,
                        ),
                         Text('Lorem ipsum dolor sit amet,consecteture adipiscing elit.Aliquam sapien turpis, venenatis at felis euismod, henderit venenatis tellus',
                         textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 10.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                ),),
              ),
              Container(
                //color: Colors.red,
                child: Center(child: Column(
                  children: [
                      Padding(
                   padding: EdgeInsets.only(top: 30.h),
                   child: Center(
                     child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                       child: Container(
                        width: 250.w,
                        //height: 350,
                        child: Image.asset('assests/images/welcome.jpg',
                        fit: BoxFit.fill,
                        ),
                        
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                          height: 40.h,
                        ),
                     Text('Send Invitations and Enjoy Chats',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                        
                        SizedBox(
                          height: 40.sp,
                        ),
                         Text('Lorem ipsum dolor sit amet,consecteture adipiscing elit.Aliquam sapien turpis, venenatis at felis euismod, henderit venenatis tellus',
                         textAlign: TextAlign.center,
                         style: TextStyle(fontSize: 10.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                ),),
              ),
              // Container(
              //   color: Colors.green,
              //   child: Center(child: Text("data"),),
              //   ),
              Container(
                //color: Colors.red,
                child: Center(child: Column(
                  children: [
                      Padding(
                   padding: EdgeInsets.only(top: 30.h),
                   child: Center(
                     child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                       child: Container(
                        width: 250.w,
                        //height: 350,
                        child: Image.asset('assests/images/welcome.jpg',
                        fit: BoxFit.fill,
                        ),
                        
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                          height: 40.h,
                        ),
                     Text('Track the Locations',
                     textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                        
                        SizedBox(
                          height: 40.h,
                        ),
                         Text('Lorem ipsum dolor sit amet,consecteture adipiscing elit.Aliquam sapien turpis, venenatis at felis euismod, henderit venenatis tellus',
                         textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                ),),
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage?TextButton(onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(
                                            builder: (_) => Login(),
                                          ));
        }, 
        child: Text('Get Started'),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
          ),
          primary: Colors.white,
          backgroundColor: Color.fromRGBO(253,63,63,4),
          minimumSize: Size.fromHeight(80.h)
        ),)
        :Container(
          padding: EdgeInsets.symmetric(horizontal:0.1.w),
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                controller.jumpTo(2);
              }, child: Text('SKIP', style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        
                                        color: Color.fromRGBO(253,63,63,4),))),
              Center(
                child: SmoothPageIndicator(
                  controller: controller, 
                  count: 3,
                  effect: WormEffect(
                    spacing: 16.w,
                    dotColor: Colors.blueAccent,
                    activeDotColor: Color.fromRGBO(253,63,63,4),
                  ),
                  onDotClicked: (index) => controller.animateToPage(index, duration: Duration(microseconds: 500), curve: Curves.easeIn),
                  ),
              ),
              TextButton(onPressed: (){
                controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeInOut);
              }, child: Text('NEXT',style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        
                                        color: Color.fromRGBO(253,63,63,4),))),
            ],
          ),
        ),
      ),
    );
  }
}