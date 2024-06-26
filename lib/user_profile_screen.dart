import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class UserProfile extends StatefulWidget {

  late String token;

  UserProfile(String token){
    this.token=token;
  }

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  List <String>interests=[];


   void updateInterests()async{

try{
var headers = {
  'Content-Type': 'application/json',
  'Authorization': widget.token
};
var request = http.Request('POST', Uri.parse('http://139.180.215.165:3007/main/update-my-interests/'));
request.body = json.encode({
  "interests": [
    "1",
    "2",
    "3"
  ],
  //"session_token": "2F1iqlcusrld8uTY8dkfiP5ma5zG9cFLpVQ9BenHwA0o6dkunfgNFJGNiR1XaeFid6GwVtucW5WuoRQgtVgsSohJzcnUY1FyoPux1715784607160"
 // "session_token": widget.token
  // "device_type": "iOS",
  // "push_token": "5SaobxKGA5d3oWRDLjl8AcEVmEMjygiVa03JmWTbdapyppMHvmxacn7HiL8HqgoP70UK0PlF7QBHyhhpMeFYXmLkCwRtYqzr5Wow1626084592946"
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
   
}
else {
  print(response.reasonPhrase);
  
}

}catch(e){
print(e);
 print("error");
}
  
}

  bool isClickedMusic=true;
  bool isClickedSport=true;
  bool isClickedGames=true;
  bool isClickedCamp=true;
  bool isClickedTrek=true;               
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 15.w,top: 40.h),
              child: Text("Select Your Interests",
              style: TextStyle(fontSize: 25.sp,color: Colors.black,fontWeight: FontWeight.bold)),
            ),


            // SizedBox(
            //                     height: 60.h,
            //                   ),

            Padding(
              padding: EdgeInsets.only(top: 80.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Lottie.asset('assests/animation/Add Check list items.json',width: 200.w,height: 200.h)),
            ),

            Padding(
              padding: EdgeInsets.only(top: 300.0.h),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                mainAxisExtent: 50,
                
                ),
                controller: new ScrollController(keepScrollOffset: false),
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.w,right: 5.w,bottom: 5.h),
                    child:  GestureDetector(
                      onTap: () {
                        String val="1";
                        setState(() {
                          isClickedMusic=!isClickedMusic;
                        });

                        if(isClickedMusic==false){
                          interests.add(val);
                        }else{
                          interests.remove(val);
                        }
                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //   builder: (_) => UserProfile(),
                                            // ));
                                            
                                          },
                                  child: Container(
                                     height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color:isClickedMusic?Colors.white: Color.fromRGBO(253,63,63,4),
                                      
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[ 
                                        Icon(Icons.music_note,color: isClickedMusic?Colors.grey:Colors.white,),
                                        SizedBox(width: 10.w,),
                                        Text(
                                        'Musical Events',
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                            color: isClickedMusic?Colors.grey:Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ]
                                    ),
                                  ),
                                ),
                  ),
            
                   Padding(
                    
                    padding: EdgeInsets.only(left: 5.w,right: 12.w,bottom: 5.h),
                    child:  GestureDetector(
                      onTap: () {
                        String val="2";
                        setState(() {
                          isClickedSport=!isClickedSport;
                        });

                         if(isClickedSport==false){
                          interests.add(val);
                        }else{
                          interests.remove(val);
                        }
                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //   builder: (_) => UserProfile(),
                                            // ));
                                            
                                          },
                                  child: Container(
                                     height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color:isClickedSport?Colors.white: Color.fromRGBO(253,63,63,4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[ 
                                        Icon(Icons.gamepad_sharp,color: isClickedSport?Colors.grey:Colors.white,),
                                        SizedBox(width: 10.w,),
                                        Text(
                                        'Sports',
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                             color: isClickedSport?Colors.grey:Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ]
                                    ),
                                  ),
                                ),
                  ),
            
                   Padding(
                     padding: EdgeInsets.only(left: 12.w,right: 5.w,bottom: 5.h),
                    child:  GestureDetector(
                      onTap: () {
                        String val="3";
                        setState(() {
                          isClickedGames=!isClickedGames;
                        });

                         if(isClickedGames==false){
                          interests.add(val);
                        }else{
                          interests.remove(val);
                        }
                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //   builder: (_) => UserProfile(),
                                            // ));
                                            
                                          },
                                  child: Container(
                                     height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color:isClickedGames?Colors.white: Color.fromRGBO(253,63,63,4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[ 
                                        Icon(Icons.keyboard,color: isClickedGames?Colors.grey:Colors.white,),
                                        SizedBox(width: 10.w,),
                                        Text(
                                        'Board Games',
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                             color: isClickedGames?Colors.grey:Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ]
                                    ),
                                  ),
                                ),
                  ),
            
                   Padding(
                    padding: EdgeInsets.only(left: 5.w,right: 12.w,bottom: 5.h),
                    child:  GestureDetector(
                      onTap: () {
                        String val="4";
                        setState(() {
                          isClickedCamp=!isClickedCamp;
                        });

                        if(isClickedCamp==false){
                          interests.add(val);
                        }else{
                          interests.remove(val);
                        }
                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //   builder: (_) => UserProfile(),
                                            // ));
                                            
                                          },
                                  child: Container(
                                     height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                     color:isClickedCamp?Colors.white: Color.fromRGBO(253,63,63,4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[ 
                                        Icon(Icons.home_mini,color: isClickedCamp?Colors.grey:Colors.white,),
                                        SizedBox(width: 10.w,),
                                        Text(
                                        'Camping',
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                             color: isClickedCamp?Colors.grey:Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ]
                                    ),
                                  ),
                                ),
                  ),
            
                  Padding(
                    
                    padding: EdgeInsets.only(left: 12.w,right: 5.w,bottom: 5.h),
                    child:  GestureDetector(
                      onTap: () {
                        String val="5";
                        setState(() {
                          isClickedTrek=!isClickedTrek;
                        });

                        if(isClickedTrek==false){
                          interests.add(val);
                        }else{
                          interests.remove(val);
                        }
                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //   builder: (_) => UserProfile(),
                                            // ));
                                            
                                          },
                                  child: Container(
                                     height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color:isClickedTrek?Colors.white: Color.fromRGBO(253,63,63,4),
                                    ),
                                   child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children:[ 
                                        Icon(Icons.hiking,color: isClickedTrek?Colors.grey:Colors.white,),
                                        SizedBox(width: 10.w,),
                                        Text(
                                        'Treking',
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                             color: isClickedTrek?Colors.grey:Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      ]
                                    ),
                                  ),
                    ),
                                ),
          ])
      ),
       Padding(
                    padding: EdgeInsets.only(left: 12.w,right: 12.w,top: 500.h),
                    child:  GestureDetector(
                      onTap: () {
                        setState(() {
                          print(interests);
                        });
                        updateInterests();

                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //   builder: (_) => UserProfile(),
                                            // ));
                                            
                                          },
                                  child: Container(
                                     height: 50.h,
                                     //width: 200.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
                                      color: Color.fromARGB(249, 211, 101, 238),
                                    ),
                                    child:Center(
                                      child: Text(
                                          'Next',
                                          style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                    ),
                                    
                                  ),
                                ),
                  ),
            
      
      
      ]),
            )
    );
          
        
      
    
  }
}