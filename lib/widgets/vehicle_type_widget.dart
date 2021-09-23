
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treeved_flutter_task/controller/treeved_contoller.dart';

class VehicleTypeWidgets extends GetView<TreeVedController> {
  const VehicleTypeWidgets({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              controller.type1.length,
              (index) => Obx(
                () => OutlinedButton(
                  onPressed: () {
                    controller.isSetectedtype1.value = index;
                  },
                  child: Text(
                    controller.type1[index],
                    style: TextStyle(
                      color: controller.isSetectedtype1.value ==
                              index
                          ? const Color(0xff5A6EFD)
                          : Colors.grey,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                    color:
                        controller.isSetectedtype1.value == index
                            ? const Color(0xff5A6EFD)
                            : Colors.grey,
                  )),
                ),
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            controller.type2.length,
            (index) => Obx(
              () => OutlinedButton(
                onPressed: () {
                  controller.isSetectedType2.value = index;
                },
                child: Text(
                  controller.type2[index],
                  style: TextStyle(
                      color: controller.isSetectedType2.value ==
                              index
                          ? const Color(0xff5A6EFD)
                          : Colors.grey),
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                  color: controller.isSetectedType2.value == index
                      ? const Color(0xff5A6EFD)
                      : Colors.grey,
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
