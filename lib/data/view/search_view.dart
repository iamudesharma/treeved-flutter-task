import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:treeved_flutter_task/controller/treeved_contoller.dart';
import 'package:treeved_flutter_task/data/data.dart';
import 'package:treeved_flutter_task/data/view/filters_view.dart';
import 'package:treeved_flutter_task/widgets/car_card_widgets.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController textcontroller;
  @override
  void initState() {
    textcontroller = TextEditingController(text: 'Tesla Model 3');
    super.initState();
  }

  final controller = Get.find<TreeVedController>();

  final _rent = ["Rent", "Sale"];

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
                Colors.white
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
                            controller: textcontroller,
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
              SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      _rent.length,
                      (index) => Obx(
                        () => InkWell(
                          onTap: () {
                            controller.isSetcectedrent.value = index;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: controller.isSetcectedrent.value == index
                                ? MediaQuery.of(context).size.width * 0.50
                                : MediaQuery.of(context).size.width * 0.43,
                            padding: const EdgeInsets.all(15.0),
                            decoration: controller.isSetcectedrent.value ==
                                    index
                                ? BoxDecoration(
                                    color: controller.isSetcectedrent.value ==
                                            index
                                        ? const Color(0xff5A6EFD)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15.0),
                                  )
                                : null,
                            child: Text(
                              "For ${_rent[index]}",
                              style: TextStyle(
                                color: controller.isSetcectedrent.value == index
                                    ? Colors.white
                                    : Colors.grey.shade600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
          ),
        ),
      ),
    );
  }
}
