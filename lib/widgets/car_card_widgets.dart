
import 'package:flutter/material.dart';
import 'package:treeved_flutter_task/data/data.dart';

class CarCardWidget extends StatelessWidget {
  const CarCardWidget({
    Key? key,
    required this.car,
  }) : super(key: key);

  final Cars car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            car.carImage,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xffACA7E6).withOpacity(0.4),
                              const Color(0xff5F70F7).withOpacity(0.6),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  // onSurface: Color(0xff42499D),
                                  primary:const Color(0xff5D64B0),
                                  // onPrimary: Color(0xff42499D),
                                ),
                                child: const Text(
                                  '1/34',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  // onSurface: Color(0xff42499D),
                                  primary: Color(0xff5A6EFD),
                                  // onPrimary: Color(0xff42499D),
                                ),
                                child: const Text(
                                  "\$340,000",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Chip(
                        backgroundColor: Color(
                          0xffE8EAEE,
                        ),
                        label: Text(
                          'On Sale',
                          style: TextStyle(
                            color: Color(0xff4D4F67),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Chip(
                        backgroundColor: Color(
                          0xffE8EAEE,
                        ),
                        label: Text(
                          'Installment',
                          style: TextStyle(
                            color: Color(0xff4D4F67),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite_border_sharp,
                    color: Color(
                      0xff6B6B6B,
                    ),
                  )
                ],
              ),
              Text(
                car.carName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff17104D),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xff80898D),
                    size: 20,
                  ),
                  Text(
                    car.address,
                    style: const TextStyle(
                      color: Color(0xff80898D),
                    ),
                  )
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View Details',
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
