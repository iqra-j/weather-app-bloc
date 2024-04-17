import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/blocs/weather/weather_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget getWeatherIcons(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/icons/1.png');
    }
    switch (code) {
      case >= 300 && < 400:
        return Image.asset('assets/icons/2.png');
    }
    switch (code) {
      case >= 500 && < 600:
        return Image.asset('assets/icons/3.png');
    }
    switch (code) {
      case >= 600 && < 700:
        return Image.asset('assets/icons/4.png');
    }
    switch (code) {
      case >= 700 && < 800:
        return Image.asset('assets/icons/5.png');
    }
    switch (code) {
      case == 800:
        return Image.asset('assets/icons/6.png');
    }
    switch (code) {
      case > 800 && <= 804:
        return Image.asset('assets/icons/7.png');
    }
    return Image.asset('assets/icons/7.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 1.4 * kToolbarHeight, 25,
              1 * NavigationToolbar.kMiddleSpacing),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 137, 9, 160)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.3),
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(color: Colors.blue),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.pin_fill,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${state.weather.areaName}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                              const Text(
                                "Good Morning",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25),
                              ),
                              getWeatherIcons(
                                  state.weather.weatherConditionCode!),
                              Center(
                                child: Text(
                                  "${state.weather.temperature!.celsius!.round()}°C",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 40),
                                ),
                              ),
                              Center(
                                child: Text(
                                  state.weather.weatherDescription!
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                              ),
                              Center(
                                child: Text(
                                  DateFormat('EEEE dd.')
                                      .add_jm()
                                      .format(state.weather.date!),
                                  // "Monday 4, 10:26 PM",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: Image.asset(
                                              'assets/icons/11.png')),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Sunrise",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14)),
                                          Text(
                                              DateFormat().add_jm().format(
                                                  state.weather.sunrise!),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16))
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: Image.asset(
                                              'assets/icons/12.png')),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Sunset",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14)),
                                          Text(
                                              DateFormat().add_jm().format(
                                                  state.weather.sunset!),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Divider(color: Colors.blueGrey),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: Image.asset(
                                              'assets/icons/13.png')),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Temp Max",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14)),
                                          Text(
                                              "${state.weather.tempMax!.celsius!.round()}°C",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16))
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: Image.asset(
                                              'assets/icons/14.png')),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Temp Min",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14)),
                                          Text(
                                              "${state.weather.tempMin!.celsius!.round()}°C",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ]),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ]),
          ),
        ));
  }
}
