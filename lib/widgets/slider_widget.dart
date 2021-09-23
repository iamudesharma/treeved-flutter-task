import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:treeved_flutter_task/controller/treeved_contoller.dart';

class SliderWidget extends GetView<TreeVedController> {
  const SliderWidget({Key? key}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.bottomCenter,
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/icons/treeved_flutter_task 2.png',
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
                width: MediaQuery.of(context).size.width * 0.9,
                child: SfRangeSliderTheme(
                  data: SfRangeSliderThemeData(
                    activeTrackHeight: 3,
                  ),
                  child: SfRangeSlider(
                    // trackShape: SfTrackShape(),
                    inactiveColor: Colors.grey.shade300,

                    minorTickShape: const SfTickShape(),
                    startThumbIcon: const Icon(
                      Icons.fiber_manual_record,
                      color: Colors.white,
                      size: 6,
                    ),
                    endThumbIcon: const Icon(
                      Icons.fiber_manual_record,
                      color: Colors.white,
                      size: 6,
                    ),
                    // overlayShape: SfOverlayShape(),
                    activeColor: const Color(0xff5A6EFD),
                    interval: 10,
                    // showLabels: true,
                    values: controller.values.value,
                    onChanged: (value) {
                      // print(value.start);
                      controller.values.value = value;

                      controller.start.value = value.start;
                      controller.end.value = value.end;
                    },
                    max: 1000,
                    min: 100,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
