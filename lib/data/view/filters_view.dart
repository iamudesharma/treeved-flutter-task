import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treeved_flutter_task/controller/treeved_contoller.dart';
import 'package:treeved_flutter_task/widgets/perfererd_model.widget.dart';
import 'package:treeved_flutter_task/widgets/slider_widget.dart';
import 'package:treeved_flutter_task/widgets/toogle_items.dart';
import 'package:treeved_flutter_task/widgets/vehicle_type_widget.dart';

class FiltersView extends GetView<TreeVedController> {
  // bool issetect = true;

  const FiltersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(
          0xffF8F9FD,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.cancel_outlined,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Filters',
          style: TextStyle(
              color: Color(
            0xff393363,
          )),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Reset',
              style: TextStyle(color: Color(0xff5A6EFD)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                color: const Color(
                  0xffF8F9FD,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(
                        10,
                      ),
                      child: Text(
                        'Prefererd Model',
                        style: TextStyle(
                          color: Color(
                            0xff393363,
                          ),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PerfererdModelwidget(),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Vehicle Type',
                        style: TextStyle(
                          color: Color(
                            0xff393363,
                          ),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const VehicleTypeWidgets(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Price Range',
                            style: TextStyle(
                              color: Color(
                                0xff393363,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Obx(() => Text(
                                    ' \$${controller.start.value!.toInt() * 23}',
                                    style: const TextStyle(
                                      color: Color(
                                        0xff393363,
                                      ),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Obx(() => Text(
                                    '-  \$${controller.end.value!.toInt() * 23}',
                                    style: const TextStyle(
                                      color: Color(
                                        0xff393363,
                                      ),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SliderWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Number of Seats',
                        style: TextStyle(
                          color: Color(
                            0xff393363,
                          ),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ToogleItems(),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Sort by A-Z',
                        style: TextStyle(
                          color: Color(
                            0xff393363,
                          ),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Sort of Defaults',
                        style: TextStyle(
                          color: Color(
                            0xff393363,
                          ),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff5A6EFD),
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 50),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Save Filters',
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
