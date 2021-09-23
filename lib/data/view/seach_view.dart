import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:treeved_flutter_task/data/data.dart';
import 'package:treeved_flutter_task/data/view/filters_view.dart';
import 'package:treeved_flutter_task/main.dart';
import 'package:treeved_flutter_task/widgets/car_card_widgets.dart';

class SeachView extends StatefulWidget {
  const SeachView({Key? key}) : super(key: key);

  @override
  State<SeachView> createState() => _SeachViewState();
}

class _SeachViewState extends State<SeachView> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: 'Tesla Model 3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffDADCE0),
                Color(0xffF8F9FD),
                Color(0xffF8F9FD),
                Color(0xffF8F9FD),
              ],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Search'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: const Icon(Icons.cancel,
                              color: Color(0xff596CFC)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Show Result',
                            style: TextStyle(
                              color: Color(0xff1E184E),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '94 Matches Found',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Get.to(
                            () => const FiltersView(),
                          );
                        },
                        icon: const Icon(
                          Icons.filter_alt_outlined,
                          color: Color(0xff596EFC),
                        ),
                        label: const Text(
                          'Filters',
                          style: TextStyle(
                            color: Color(0xff596EFC),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            style: BorderStyle.solid,
                            color: Color(0xff596EFC),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return CarCardWidget(
                      car: carsList[index],
                    );
                  },
                  childCount: carsList.length,
                ),
              )
            ],

            // child: Column(
            //   children: [

            //     Expanded(
            //       child: Container(
            //         decoration: const BoxDecoration(
            //             gradient: LinearGradient(colors: [
            //           Color(0xffDADCE0),
            //           Color(0xffF8F9FD),
            //           Color(0xffF8F9FD),
            //           Color(0xffF8F9FD),
            //         ])),
            //       ),
            //     )
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
