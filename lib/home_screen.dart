import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:task_app/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    Provider.of<ApiServices>(context,listen: false).getWeatherData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: screenSize.width*0.01),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenSize.width*0.3),
                    child: const Text("Brussels",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.white
                    ),),
                  )
                ],
              ),
            ),
            const Text(
                "Looks like the air is good",
              style: TextStyle(
                color: Colors.white38
              ),
            ),
             SizedBox(
              height: screenSize.height*0.1,
            ),
            Consumer<ApiServices>(
              builder: (BuildContext context, value, Widget? child) {
                if(value.isLoading){
                  double? aqi = value.data?.data?.aqi?.toDouble();
                  return SizedBox(
                    height: screenSize.height*0.33,
                    child: SleekCircularSlider(
                      onChange: (double value) {
                        // callback providing a value while its being changed (with a pan gesture)
                      },
                      onChangeStart: (double startValue) {
                        // callback providing a starting value (when a pan gesture starts)
                      },
                      onChangeEnd: (double endValue) {
                        // ucallback providing an ending value (when a pan gesture ends)
                      },
                      initialValue: aqi!,
                      max: 100,
                      appearance: CircularSliderAppearance(
                        angleRange: 360,
                        startAngle: 270,
                        size: 250,
                        customColors: CustomSliderColors(
                          progressBarColor: Colors.lightGreenAccent,
                          trackColor: Colors.lightBlueAccent,
                          hideShadow: true,
                          dotColor: Colors.white,
                        ),
                        customWidths: CustomSliderWidths(
                          progressBarWidth: 10,
                          trackWidth: 2,
                        ),
                        infoProperties: InfoProperties(
                            bottomLabelText: "AQI",
                            bottomLabelStyle: const TextStyle(
                                color: Colors.white),
                            mainLabelStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            modifier: (double value) {
                              final roundedValue =
                              value.ceil().toInt().toString();
                              return '$roundedValue ';
                            }),
                      ),
                    ),
                  );
                }
                return SizedBox(
                    height: screenSize.height*0.33,
                    child: const Center(child: CircularProgressIndicator(),));
              },
            ),
            SizedBox(
              height: screenSize.height*0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.water_drop,
                  color: Colors.lightBlue,
                ),
                const Text("94%",
                style: TextStyle(
                  color: Colors.white38
                ),),
                SizedBox(
                  width: screenSize.width*0.03,
                ),
                const Icon(
                  Icons.circle_outlined,
                  color: Colors.yellow,
                ),
                const Text("15 C",
                  style: TextStyle(
                      color: Colors.white38
                  ),),
              ],
            ),
            SizedBox(height: screenSize.height*0.05,),
            Container(
              height: screenSize.height*0.33,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("NO2",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Good",
                              style: TextStyle(
                                color: Colors.black12,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text("29",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.transparent,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0)
                    ),
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      value: 10,
                      activeColor: Colors.green,
                      onChanged: (value) {

                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("PM2.5",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Above Average",
                              style: TextStyle(
                                color: Colors.black12,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text("29",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.transparent,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0)
                    ),
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      value: 10,
                      activeColor: Colors.orange,
                      onChanged: (value) {

                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
