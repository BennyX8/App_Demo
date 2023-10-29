import 'package:app_demo/views/pages/store_front_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'controller/product_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());

  await requestPermissions();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: InitalBinding(),
      color: Colors.orange,
      home: StoreFrontPage(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey.shade700,
            surfaceTintColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.orange),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

Future<void> requestPermissions() async {
  if (await Permission.contacts.request().isGranted) {}

// You can request multiple permissions at once.
  await [
    Permission.storage,
    Permission.mediaLibrary,
    Permission.camera,
  ].request();
}

class InitalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController(), permanent: true);
  }
}
