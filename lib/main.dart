import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:linea21/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context 
      builder: (_ , child) {
    
     return  GetMaterialApp(
 
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade, // Ou n'importe quelle autre transition
      theme: ThemeData(
           scaffoldBackgroundColor: Colors.white, // Couleur de fond pour toutes les pages
        // colorScheme: ColorScheme.fromSeed(seedColor: vert),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
  
      
    );
     }
     );
  }
}

