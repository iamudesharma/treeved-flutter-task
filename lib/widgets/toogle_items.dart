import 'package:flutter/material.dart';

class ToogleItems extends StatefulWidget {
  const ToogleItems({Key? key}) : super(key: key);

  @override
  _ToogleItemsState createState() => _ToogleItemsState();
}

class _ToogleItemsState extends State<ToogleItems> {
  List<String> list = [
    "All",
    "1",
    "2",
    "3",
    "4+",
  ];

  int isSetected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        list.length,
        (index) => Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isSetected = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              // width: 82,
              decoration: BoxDecoration(
                borderRadius: isSetected == index
                    ? BorderRadius.circular(
                        5.0,
                      )
                    : null,
                color: isSetected == index
                    ? const Color(0xff5A6EFD)
                    : Colors.grey.shade300,

                // color: Colors.blue,
              ),
              child: Text(
                list[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isSetected == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
