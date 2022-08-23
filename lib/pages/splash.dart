import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _gotohome();
  }
  _gotohome() async{
    await Future.delayed(Duration(seconds: 6));
    Navigator.pushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: Image.asset('assets/images/default1.png', fit: BoxFit.cover),
                ),
              ),
            
            ),
          SizedBox(height: 90,),
          AwesomeLoader(
            loaderType: AwesomeLoader.AwesomeLoader3,
            color: Colors.white,
            
          ),

          ]
        ),
      ),
    );
  }
}