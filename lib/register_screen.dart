import 'dart:convert';
import 'package:enternment_app/dashboard_screen.dart';
import 'package:enternment_app/loging_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  void register(String fullName,String lastName,String email,String password,String conPassword)async{

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
try{
var headers = {
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('http://139.180.215.165:3007/api/v1/user/auth/register/'));
request.body = json.encode({
  "email": email,
  "password": conPassword,
  "first_name": fullName,
  "last_name": lastName,
  "device_type": "iOS",
  "push_token": "5SaobxKGA5d3oWRDLjl8AcEVmEMjygiVa03JmWTbdapyppMHvmxacn7HiL8HqgoP70UK0PlF7QBHyhhpMeFYXmLkCwRtYqzr5Wow1626084592946"
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
  print("Registration is Succeffully");
  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (_) => Dashboard(),
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
                                                 'Registration is Succeffully')),
                                          //child: Text('Error ${error.toString()}'),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ));                                   
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
                                                 'Registration is Invailed')),
                                          //child: Text('Error ${error.toString()}'),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ));         
}
}catch(e){
print(e);
}
  
}

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _conPassword = TextEditingController();

  bool isSecurePassword=true;
  bool isSecureConPassword=true;
  bool ?isChecked=false;

  late String pass;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
           children:[
           Padding (padding: EdgeInsets.only(top: 30.0.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Sign Up',
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
                                    controller: _fName,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      suffixIcon:
                                          Icon(Icons.face, color: Colors.grey),
                                      label: Text('First Name',
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              //color: Colors.lightBlue
                                              )),
                                    ),
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return 'First name can not be empty';
                                      }
                                      return null;
                                    },
                                   
                      
                                              
                                    ),

                                    TextFormField(
                                  //cursorColor: Colors.blue,
                                    controller: _lName,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      suffixIcon:
                                          Icon(Icons.face, color: Colors.grey),
                                      label: Text('Last Name',
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              //color: Colors.lightBlue
                                              )),
                                    ),
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return 'Last name can not be empty';
                                      }
                                      return null;
                                    },
                                   
                      
                                              
                                    ),

                                    TextFormField(
                                  //cursorColor: Colors.blue,
                                    controller: _email,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      suffixIcon:
                                          Icon(Icons.email, color: Colors.grey),
                                      label: Text('Email',
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              //color: Colors.lightBlue
                                              )),
                                    ),
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return 'Email can not be empty';
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
                                    onChanged: (value) {
                                      setState(() {
                                        pass=value;
                                      });
                                    },
                                    ),

                                     TextFormField(
                                  //cursorColor: Colors.blue,
                                    controller: _conPassword,
                                    decoration: InputDecoration(
                                       suffixIcon: IconButton(
                                          color: Colors.grey, onPressed: () { 
                                            setState(() {
                                              isSecureConPassword=!isSecureConPassword;
                                            });
                                           }, icon: isSecureConPassword? Icon(Icons.visibility_off):Icon(Icons.visibility)),
                                      label: Text('Confirm Password',
                                          style: TextStyle(
                                              //fontWeight: FontWeight.bold,
                                              //color: Colors.lightBlue
                                              )),
                                    ),
                                    obscureText: isSecureConPassword,
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return 'Confirm Password can not be empty';
                                      }
                                      if(text!=pass){
                                        return 'Confirm Password is not equal with Password';
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
                                  //mainAxisAlignment: MainAxisAlignment.start,
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
                                            ' I have read and agree to the privacy and \n policy statement',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                //fontWeight: FontWeight.bold,
                                                //color: Colors.lightBlue
                                                ),
                                          ),
                                    
                                //      SizedBox(
                                //   width: MediaQuery.of(context).size.width/9,
                                // ),
                                //     Align(
                                //       alignment: Alignment.centerRight,
                                //       child: GestureDetector(
                                //           onTap: () {
                                //             // Navigator.of(context).push(MaterialPageRoute(
                                //             //   builder: (_) => ChangePassword(),
                                //             // ));
                                            
                                //           },
                                //           child: Text(
                                //             'Forgot Password ?',
                                //             style: TextStyle(
                                //                 fontSize: 15.sp,
                                //                 //fontWeight: FontWeight.bold,
                                //                 color: Color.fromRGBO(253,63,63,4)),
                                //           )),
                                //     ),
                                  ],
                                ),
            
                                 SizedBox(
                                  height: 80.h,
                                ),
            
                                GestureDetector(
                                onTap: ()async{
                                   if (_formKey.currentState!.validate()) {
                                      register(_fName.text,_lName.text,_email.text,_password.text,_conPassword.text);
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
                                      'Submit',
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
                                            'Already have an account?',
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
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                              builder: (_) => Login(),
                                            ));
                                          },
                                          child: Text(
                                            ' Sign In',
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