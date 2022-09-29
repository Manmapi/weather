import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/features/current_weather/presentation/bloc/current_weather_bloc.dart';
import 'package:weather/features/current_weather/presentation/pages/search_page.dart';
import 'package:weather/features/current_weather/presentation/widgets/citi_banner.dart';

class CitiesManager extends StatelessWidget {
  const CitiesManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I.get<CurrentWeatherBloc>(),
      child: _CitiesManager(),
    );
  }
}

class _CitiesManager extends StatefulWidget {
  _CitiesManager({Key? key}) : super(key: key);
  final debounce = Debouncer(milliseconds: 1000);
  @override
  CitiesManagerState createState() => CitiesManagerState();
}

class CitiesManagerState extends State<_CitiesManager> {
  @override
  void initState() {
    super.initState();
    GetIt.I.get<CurrentWeatherBloc>().add(GetCurrentWeather());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Manage cities',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Hero(
              tag: 'hero_search',
              child: TextField(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SearchPage();
                    },
                  ));
                },
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    hintText: 'Enter location',
                    hintStyle: const TextStyle(fontSize: 20),
                    fillColor: const Color.fromARGB(45, 158, 158, 158),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
              builder: (context, state) {
                if (state is CurrentWeatherLoaded) {
                  return Column(
                    children: [
                      CitiBanner(
                        citiName: state.currentWeather.name,
                        minTemp: state.currentWeather.main.tempMin,
                        maxTemp: state.currentWeather.main.tempMin,
                        temp: state.currentWeather.main.temp,
                      ),
                    ],
                  );
                }
                return const CircularProgressIndicator.adaptive();
              },
            )
          ])),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
