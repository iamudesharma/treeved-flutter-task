import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TreeVedController extends GetxController {
  List<String> rent = [
    "Buy",
    "Rent",
    "Sell",
  ];

  var start = RxnDouble();
  var end = RxnDouble();

  var isSetectedtype1 = 1.obs;
  var isSetectedType2 = 1.obs;
  List<String> type1 = ['Suv', "Hatchback", "Plug-In-Hybird"];
  List<String> type2 = ["Hybird", "Pickup", "Van"];
  var values = const SfRangeValues(140.0, 580.0).obs;

  var isSetcectedrent = 1.obs;

  List<IconData> icon = [
    Icons.search,
    Icons.favorite_border,
    Icons.message_outlined,
    Icons.person,
  ];

  List<String> title = ["Explore", "Favorites", "Messages", "Person"];

  var isSetectetdItems = 0.obs;

  @override
  void onReady() {
    init();
    super.onReady();
  }

  void init() {
    start.value = values.value.start;
    end.value = values.value.start;
  }
}
