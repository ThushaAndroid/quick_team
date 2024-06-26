
import 'dart:convert';

import 'package:enternment_app/dashboard_screen.dart';
import 'package:enternment_app/register_screen.dart';
import 'package:enternment_app/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var token;

 // List<Post>?posts;

//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }

//   getData()async{

//   }
void login(String email,String password)async{

//   try{
//   Response response=await post(
//     Uri.parse('{{Base_quickteam}}auth/login'),
// body:{
//   "email": email,
//   "password": password,
//   "device_type": "Android",
//   "push_token": "5SaobxKGA5d3oWRDLjl8AcEVmEMjygiVa03JmWTbdapyppMHvmxacn7HiL8HqgoP70UK0PlF7QBHyhhpMeFYXmLkCwRtYqzr5Wow1626084592946"
// }
//     );
// //http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//   //print(await response.stream.bytesToString());
//   print("account created successfully");
// }
// else {
//   print('faild');
// }
//   }catch(e){
// print(e);
//   }
//var getJson=[];
try{
var headers = {
  'Content-Type': 'application/json'
};
var request = await http.Request('POST', Uri.parse('http://139.180.215.165:3007/api/v1/user/auth/login/'));
request.body = json.encode({
  "email": email,
  "password": password,
  "device_type": "iOS",
  "push_token": "5SaobxKGA5d3oWRDLjl8AcEVmEMjygiVa03JmWTbdapyppMHvmxacn7HiL8HqgoP70UK0PlF7QBHyhhpMeFYXmLkCwRtYqzr5Wow1626084592946"
});
Map body={
 "email": email,
  "password": password,
};
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

http.Response respons=await http.post(Uri.parse('http://139.180.215.165:3007/api/v1/user/auth/login/'),body: jsonEncode(body),headers: headers );
if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
  final json=jsonDecode(respons.body);
  var message=json["message"];
  token=json["session_token"];
  if(json["validate"]==1){
    //var message=json["message"];
    //int user=await response.stream.length;
     print(message);
  print("Login is Succeffully");
  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (_) => UserProfile(token),
                                      ));

   ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Center(
                                              child: Text(
                                                 "OTP validated successfully")),
                                          //child: Text('Error ${error.toString()}'),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ));    
}else{
  if(message=="This email is not registered with us "){
      print(message);
ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Center(
                                              child: Text(
                                                 "This email is not registered with us ")),
                                          //child: Text('Error ${error.toString()}'),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ));    
  }
  if(message=="Your password is wrong"){
      print(message);
ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Center(
                                              child: Text(
                                                 "Your password is wrong")),
                                          //child: Text('Error ${error.toString()}'),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ));    
  }
}                           
}
else {
  print(response.reasonPhrase);
   ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Center(
                                              child: Text(
                                                 'Login is Invailed')),
                                          //child: Text('Error ${error.toString()}'),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ));         
}
}
catch(e){
print(e);
}
  
}


// void updateInterests()async{

// try{
// var headers = {
//   'Content-Type': 'application/json',
//   'Authorization': 'Bearer {{key_quickteam}}'
// };
// var request = http.Request('POST', Uri.parse('http://139.180.215.165:3007/main/update-my-interests/'));
// request.body = json.encode({
//   "interests": [
//     "1",
//     "2",
//     "3"
//   ],
//   "device_type": "iOS",
//   "push_token": "5SaobxKGA5d3oWRDLjl8AcEVmEMjygiVa03JmWTbdapyppMHvmxacn7HiL8HqgoP70UK0PlF7QBHyhhpMeFYXmLkCwRtYqzr5Wow1626084592946"
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
   
// }
// else {
//   print(response.reasonPhrase);
  
// }

// }catch(e){
// print(e);
//  print("error");
// }
  
// }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final _email = TextEditingController();
  final _password = TextEditingController();

  //final user = FirebaseAuth.instance.currentUser;

   bool isSecurePassword=true;
   bool ?isChecked=false;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children:[
            Padding(padding: EdgeInsets.only(top: 30.0.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Sign In',
                 //textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.sp,color: Color.fromRGBO(253,63,63,4),fontWeight: FontWeight.bold),),
              ),
            ),
          Container(
            height: double.infinity,
            width: double.infinity,
            //  height: size.height,
            //    width: size.height,
            padding: EdgeInsets.only(top: 120.0.h, left: 20.0.w, right: 20.0.w),
            child: SingleChildScrollView(
              child: Form(
                 key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  
                  
                                //User Name TextFormField
                                TextFormField(
                                  //cursorColor: Colors.blue,
                                    controller: _email,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      suffixIcon:
                                          Icon(Icons.face, color: Colors.grey),
                                      label: Text('User Name',
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              //color: Colors.lightBlue
                                              )),
                                    ),
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return 'User name can not be empty';
                                      }
                                      return null;
                                    },
                                   
                      
                                              
                                    ),
                      
                                    //Password TextFormField
                                TextFormField(
                                  //cursorColor: Colors.blue,
                                    controller: _password,
                                    decoration: InputDecoration(
                                       suffixIcon: IconButton(
                                          color: Colors.grey, onPressed: () { 
                                            setState(() {
                                              isSecurePassword=!isSecurePassword;
                                            });
                                           }, icon: isSecurePassword? Icon(Icons.visibility_off):Icon(Icons.visibility)),
                                      label: Text('Password',
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              //color: Colors.lightBlue
                                              )),
                                    ),
                                    obscureText: isSecurePassword,
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return 'Password can not be empty';
                                      }
                                      // if(text.length<6){
                                      //   return 'Password must not be less than 6 characters';
                                      // }
                                      return null;
                                    },
                                    ),
            
                                      SizedBox(
                                  height: 20.h,
                                ),
                                    //Forgot Password Text
                                Row(
                                  children: [
                                     Checkbox(
                                                value: isChecked,
                                                //tristate: true,
                                              onChanged: (newBool){
                                                setState(() {
                                                  isChecked=newBool;
                                                });
                                              }),
                                     Text(
                                            'Remember me',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                //fontWeight: FontWeight.bold,
                                                //color: Colors.lightBlue
                                                ),
                                          ),
                                    
                                     SizedBox(
                                  width: MediaQuery.of(context).size.width/9,
                                ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                          onTap: () {
                                            
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (_) => UserProfile(token),
                                            ));
                                            
                                          },
                                          child: Text(
                                            'Forgot Password ?',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                //fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(253,63,63,4)),
                                          )),
                                    ),
                                  ],
                                ),
            
                                 SizedBox(
                                  height: 80.h,
                                ),
            
                                GestureDetector(
                                onTap: ()async{
                                   if (_formKey.currentState!.validate()) {
                                      login(_email.text,_password.text);
                                   }
                                //  Navigator.of(context).push(MaterialPageRoute(
                                //               builder: (_) => Onboard(),
                                //             ));
                               
                                },
                                child: Container(
                                   height: 50.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    // gradient: LinearGradient(
                                    //   colors: [Colors.blueGrey,Colors.blue],
                                    // ),
                                    //color: Colors.deepOrangeAccent
                                    color: Color.fromRGBO(253,63,63,4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
            
            
                                 SizedBox(
                                  height: 40.h,
                                ),
            
            
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                            'Dont you have account?',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                //fontWeight: FontWeight.bold,
                                                //color: Colors.lightBlue
                                                ),
                                     ),
                                //      SizedBox(
                                //   width: 130,
                                // ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                          onTap: (){
                                            
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (_) => Register(),
                                            ));
                                          },
                                          child: Text(
                                            ' Sign Up',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold,
                                                color:Color.fromRGBO(253,63,63,4)
                                                //color: Colors.lightBlue
                                                ),
                                          )),
                                    ),
                                  ],
                                ),
                  ],
                ),
              ),
            ),
          ),
          ]
        ),
      ),
    );
  }
}