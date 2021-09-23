import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treeved_flutter_task/data/view/search_view.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      offset: const Offset(-5.0, -5.0),
                      color: Colors.grey.shade200),
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: const Offset(5.0, 5.0),
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
                      Get.to(() => const SearchView());
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
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type city, neighborhood or address',
                            hintStyle: TextStyle(color: Colors.grey.shade400))),
                  )
                ],
              ),
              height: 50,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
