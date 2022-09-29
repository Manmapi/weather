import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/features/current_weather/presentation/bloc/current_weather_bloc.dart';
import 'package:weather/features/current_weather/presentation/pages/cities_manager.dart';
import 'package:weather/features/current_weather/presentation/widgets/sun_widget.dart';
import '../../../../core/ultis/date_time.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: GetIt.I.get<CurrentWeatherBloc>(), child: const _WeatherPage());
  }
}

class _WeatherPage extends StatefulWidget {
  const _WeatherPage({Key? key}) : super(key: key);

  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<_WeatherPage> {
  @override
  void initState() {
    super.initState();
    GetIt.I.get<CurrentWeatherBloc>().add(UpdateCurrentWeather());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (context, state) {
        if (state is CurrentWeatherLoaded) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 108, 150, 206),
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const CitiesManager();
                    })));
                  },
                  icon: const Icon(Icons.add)),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                state.currentWeather.name,
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
              ),
            ),
            body: RefreshIndicator(
              semanticsLabel: 'Refresh',
              displacement: 20,
              onRefresh: () async {
                GetIt.I.get<CurrentWeatherBloc>().add(UpdateCurrentWeather());
                await Future.delayed(const Duration(seconds: 1));
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  '\u2103',
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 40,
                                      color: Colors.transparent,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  '${state.currentWeather.main.temp.toInt()}',
                                  style: const TextStyle(
                                      height: 1,
                                      fontSize: 140,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                const Text(
                                  '\u2103',
                                  style: TextStyle(
                                      height: 1,
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                          Text(
                            state.currentWeather.weather[0].main,
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      )),
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(109, 163, 187, 224),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(20),
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.all(20),
                          height: 120,
                          width: double.infinity,
                          child: SunWidget(
                            currentTime: DateTime.now().millisecondsSinceEpoch,
                            sunriseTime: state.currentWeather.sys.sunrise,
                            sunsetTime: state.currentWeather.sys.sunset,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sun rise:${DateTime.fromMillisecondsSinceEpoch(state.currentWeather.sys.sunrise * 1000).getHourMinFormat()}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(
                                'Sun set:${DateTime.fromMillisecondsSinceEpoch(state.currentWeather.sys.sunset * 1000).getHourMinFormat()}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          childAspectRatio: 2,
                          padding: const EdgeInsets.all(20),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: [
                            SizedBox(
                              height: 100,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'FEESL LIKE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "${state.currentWeather.main.fellLike}\u2103",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 100,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'HUMIDITY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      '${state.currentWeather.main.humidity}%',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 100,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'PRESSURE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      '${state.currentWeather.main.pressure} hPa',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 100,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'VISIBILITY',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      '${state.currentWeather.visibility / 1000} km',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 100,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'WIND SPEED',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      '${(state.currentWeather.wind.speed * 3.6).toStringAsFixed(1)} km/h',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 100,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'CLOUDINESS',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      '${state.currentWeather.clouds!.all.toString()}%',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()));
      },
    );
  }
}
