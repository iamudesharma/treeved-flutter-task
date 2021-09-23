import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:treeved_flutter_task/data/data.dart';
import 'package:treeved_flutter_task/data/view/seach_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'Flutter Demo',
      theme: ThemeData(
        // textTheme: GoogleFonts.ubuntuMonoTextTheme(),
        // scaffoldBackgroundColor: Colors.grey.shade200,
        // const Color(0xffF8F9FD),
        // primaryColor: Color(0xff),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Colors.grey.shade100,
            leading: Image.asset(
              'assets/icons/treeved_flutter_task.png',
              height: 30,
              scale: 0.7,
              width: 30,
              // fit: BoxFit.fill,
              // fit: BoxFit.cover,
            ),
            actions: const [
              CircleAvatar(
                backgroundColor: Colors.black,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                newHeader(context),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(
                            90,
                            110,
                            253,
                            0.09,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          )),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Buy',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: const Color(0xff5A6EFD),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: const Text(
                              'Rent',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Text(
                            'Sell',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => CarCardWidget(
                car: carsList[index],
              ),
              childCount: carsList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget newHeader(BuildContext context) {
    return Container(
      // color: Color(0xffF8F9FD),
      color: Colors.grey.shade100,
      // height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: const Text(
                'Thousands of cars waiting for you',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(
                    0xff160F55,
                  ),
                ),
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(-5.0, -5.0),
                      color: Colors.grey.shade200),
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(5.0, 5.0),
                      color: Colors.grey.shade300),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SeachView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: const Color(0xff5A6EFD).withOpacity(0.1),
                          border: Border.all(
                            color: const Color(0xff5A6EFD).withOpacity(0.1),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Rent',
                              style: TextStyle(
                                color: Color(0xff5A6EFD),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Color(0xff5A6EFD),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type city, neighborhood or address',
                            hintStyle: TextStyle(color: Colors.grey.shade400))),
                  )
                ],
              ),
              height: 50,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class CarCardWidget extends StatelessWidget {
  const CarCardWidget({
    Key? key,
    required this.car,
  }) : super(key: key);

  final Cars car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            car.carImage,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xffACA7E6).withOpacity(0.4),
                              const Color(0xff5F70F7).withOpacity(0.6),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  // onSurface: Color(0xff42499D),
                                  primary: Color(0xff5D64B0),
                                  // onPrimary: Color(0xff42499D),
                                ),
                                child: const Text(
                                  '1/34',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  // onSurface: Color(0xff42499D),
                                  primary: Color(0xff5A6EFD),
                                  // onPrimary: Color(0xff42499D),
                                ),
                                child: const Text(
                                  "\$340,000",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Chip(
                        backgroundColor: Color(
                          0xffE8EAEE,
                        ),
                        label: Text(
                          'On Sale',
                          style: TextStyle(
                            color: Color(0xff4D4F67),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Chip(
                        backgroundColor: Color(
                          0xffE8EAEE,
                        ),
                        label: Text(
                          'Installment',
                          style: TextStyle(
                            color: Color(0xff4D4F67),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_border_sharp,
                    color: Color(
                      0xff6B6B6B,
                    ),
                  )
                ],
              ),
              Text(
                car.carName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff17104D),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xff80898D),
                    size: 20,
                  ),
                  Text(
                    car.address,
                    style: const TextStyle(
                      color: Color(0xff80898D),
                    ),
                  )
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'View Details',
                  ))
            ],
          ),
        ],
      ),
    );
  }
}



//  SizedBox(
//                       child: Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(20.0),
//                             child: SizedBox(
//                                 height: 200,
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Image.asset(
//                                   'assets/images/Desktop-ModelY.jpg',
//                                   fit: BoxFit.cover,
//                                 )),
//                           ),
//                           Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Container(
//                               height: 50,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: Colors.blue,
//                               ),
//                               child: Row(),
//                             ),
//                           )
//                         ],
//                       ),
//                       height: MediaQuery.of(context).size.height * 0.5,
//                       width: MediaQuery.of(context).size.width,
//                     ),