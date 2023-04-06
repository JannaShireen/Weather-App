import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/functions/get_location.dart';
import 'package:weather_app/functions/weather_data.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var client = WeatherData();
  // var data;
  // info() async {
  //var position = await GetPosition();
  // data = await client.getData('Mumbai');
  // data = await client.getData(position.latitude, position.longitude);
  //  return data;

  String query = '';

  TextEditingController searchContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
              future: client.getData(query.isEmpty ? 'Mumbai' : query),
              builder: ((context, snapshot) {
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.78,
                          width: size.width,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff955cd1),
                                    Color(0xff3fa2fa),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  stops: [0.2, 0.85])),
                          child: Column(
                            children: [
                              AnimSearchBar(
                                textFieldColor: Colors.white38,
                                textFieldIconColor: Colors.white,
                                helpText: "Search City",
                                color: Colors.grey,
                                width: 250,
                                textController: searchContrller,
                                onSuffixTap: () {
                                  searchContrller.clear();
                                },
                                onSubmitted: (p0) {
                                  setState(() {
                                    query = p0;
                                  });
                                },
                              ),
                              Text(
                                '${snapshot.data?.cityName}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                dateFormat,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 15,
                                ),
                              ),
                              Image.network(
                                'https:${snapshot.data?.icon}',
                                width: size.width * 0.26,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                '${snapshot.data?.condition}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '${snapshot.data?.temp}°',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/storm.png',
                                        width: size.width * 0.12,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${snapshot.data?.wind}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        'Wind',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/humidity.jpeg',
                                        width: size.width * 0.12,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${snapshot.data?.humidity}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text('Humidity',
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/wind_direction.jpeg',
                                        width: size.width * 0.11,
                                      ),
                                      Text(
                                        '${snapshot.data?.wind_dir}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        'Wind Direction ',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Gust',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapshot.data?.gust}kp/h',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Pressure',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapshot.data?.pressure} hpa',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  '  uv  ',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapshot.data?.uv}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Precipitation',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapshot.data?.precipe} mm',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapshot.data?.wind}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Last Update',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapshot.data?.last_update}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }))),
    );
  }
}
