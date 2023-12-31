import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resource/components/color.dart';
import 'package:mvvm_architecture/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.chekcAUthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Splash Screen",
        style: AppColors.textStyle,
      ),
    ));
  }
} 

//35 mit  
//https://www.youtube.com/watch?v=q1ngVwxt2uI&list=PLFyjjoCMAPtzn7tFLRV3eny7G74LnlMRt&index=23