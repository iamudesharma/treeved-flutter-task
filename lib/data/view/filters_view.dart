import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({Key? key}) : super(key: key);

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  int isSetected = 1;
  int isSetected1 = 1;
  List<String> type1 = ['Suv', "Hatchback", "Plug-In-Hybird"];
  List<String> type2 = ["Hybird", "Pickup", "Van"];
  SfRangeValues _values = const SfRangeValues(40.0, 80.0);
  bool issetect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(
          0xffF8F9FD,
        ),
        leading: const Icon(
          Icons.cancel_outlined,
          color: Colors.black,
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
                  children: [
                    const Padding(
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
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              height: 70,
                              width: 70,
                              child: Center(
                                child: Image.asset(
                                    'assets/icons/580b585b2edbce24c47b2cc9.png'),
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade500,
                                    offset: const Offset(4.0, 4.0),
                                    blurRadius: 15,
                                    spreadRadius: 1.0,
                                  ),
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //todo:
              Expanded(
                  child: Container(
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
                        'Vehicy Type',
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            type1.length,
                            (index) => OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  isSetected = index;
                                });
                              },
                              child: Text(
                                type1[index],
                                style: TextStyle(
                                  color: isSetected == index
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                color: isSetected == index
                                    ? Colors.blue
                                    : Colors.grey,
                              )),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          type2.length,
                          (index) => OutlinedButton(
                            onPressed: () {
                              setState(() {
                                isSetected1 = index;
                              });
                            },
                            child: Text(
                              type2[index],
                              style: TextStyle(
                                  color: isSetected1 == index
                                      ? Colors.blue
                                      : Colors.grey),
                            ),
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                              color: isSetected1 == index
                                  ? Colors.blue
                                  : Colors.grey,
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Price Range',
                            style: TextStyle(
                              color: Color(
                                0xff393363,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        alignment: Alignment.bottomCenter,
                        child: SfRangeSlider(
                          interval: 10,
                          showLabels: true,
                          values: _values,
                          onChanged: (value) {
                            setState(() {
                              _values = value;
                            });
                          },
                          max: 100,
                          min: 0.0,
                        ),
                      ),
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
                      ToogleView(),
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class ToogleView extends StatefulWidget {
  ToogleView({Key? key}) : super(key: key);

  @override
  _ToogleViewState createState() => _ToogleViewState();
}

class _ToogleViewState extends State<ToogleView> {
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
              padding: EdgeInsets.all(10.0),
              // width: 82,
              decoration: BoxDecoration(
                borderRadius: isSetected == index
                    ? BorderRadius.circular(
                        5.0,
                      )
                    : null,
                color: isSetected == index ? Colors.blue : Colors.grey.shade300,

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
