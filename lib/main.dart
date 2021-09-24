import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeved_flutter_task/controller/treeved_contoller.dart';


import 'data/view/explore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(TreeVedController());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey.shade200,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Treeved',
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends GetView<TreeVedController> {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              controller.title.length,
              (index) => InkWell(
                    onTap: () {
                      controller.isSetectetdItems.value = index;
                    },
                    child: Obx(() => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              controller.icon[index],
                              // ignore: unrelated_type_equality_checks
                              color: controller.isSetectetdItems == index
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            Text(
                              controller.title[index],
                              style: TextStyle(
                                  // ignore: unrelated_type_equality_checks
                                  color: controller.isSetectetdItems == index
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                          ],
                        )),
                  )),
        ),
        height: kTextTabBarHeight * 1.3,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff5F70F7),
            Color(0xff7F87EF),
            Color(0xffAEA8E7),
          ]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: const ExploreView(),
    );
  }
}
