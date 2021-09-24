import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treeved_flutter_task/controller/treeved_contoller.dart';
import 'package:treeved_flutter_task/data/data.dart';
import 'package:treeved_flutter_task/data/view/search_view.dart';
import 'package:treeved_flutter_task/widgets/car_card_widgets.dart';
import 'package:treeved_flutter_task/widgets/header.dart';

class ExploreView extends GetView<TreeVedController> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Colors.grey.shade100,
          leading: Image.asset(
            'assets/icons/treeved_flutter_task.png',
            height: 30,
            scale: 0.6,
            width: 30,
            // fit: BoxFit.fill,
            // fit: BoxFit.cover,
          ),
          actions: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icons/Profile-Male.png'),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Header(),
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
                      children: List.generate(
                        controller.rent.length,
                        (index) => Obx(
                          () => InkWell(
                            onTap: () {
                              controller.isSetcectedrent.value = index;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: controller.isSetcectedrent.value == index
                                  ? 170
                                  : 100,
                              padding: const EdgeInsets.all(15.0),
                              decoration: controller.isSetcectedrent.value ==
                                      index
                                  ? BoxDecoration(
                                      color: const Color(0xff5A6EFD),
                                      borderRadius: BorderRadius.circular(15.0),
                                    )
                                  : null,
                              child: Text(
                                controller.rent[index],
                                style: TextStyle(
                                  color:
                                      controller.isSetcectedrent.value == index
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
            (context, index) => InkWell(
              onTap: () {
                Get.to(()=>SearchView());
              },
              child: CarCardWidget(
                car: carsList[index],
              ),
            ),
            childCount: carsList.length,
          ),
        ),
      ],
    );
  }
}
