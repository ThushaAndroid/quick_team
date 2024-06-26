import 'package:enternment_app/get_started_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder:(_){
          return GetStarted();
        //   if(user==null){
        //     return LginScreen();
        //  }      
        //   else{
        //     return Dashboard();
        //   }
        }
         )
        );
    });
    super.initState();
  }

   @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color:  Color.fromARGB(251, 253, 63, 63),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(Icons.location_pin)
            //Lottie.asset('assests/animation/Animation - 1710921638017.json')
            Image.asset('assests/images/logo.png',
                        fit: BoxFit.fill,),

            SizedBox(
              height: 20,
            ),
            Text('QuickTeam',
            style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),

             SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(left:20,right:20),
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 5000,
                lineHeight: 20,
                //width: 50,
                percent: 1,
                progressColor: Colors.white,
                backgroundColor:Color.fromARGB(251, 253, 63, 63),
                barRadius: Radius.circular(20),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}