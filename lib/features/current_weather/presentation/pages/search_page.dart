import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/features/current_weather/domain/repositories/location_search_repo.dart';
import 'package:weather/features/current_weather/presentation/bloc/current_weather_bloc.dart';
import 'package:weather/features/current_weather/presentation/pages/cities_manager.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I.get<CurrentWeatherBloc>(),
      child: _SearchPage(),
    );
  }
}

class _SearchPage extends StatefulWidget {
  _SearchPage({Key? key}) : super(key: key);
  final debounce = Debouncer(milliseconds: 1000);
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<_SearchPage> {
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
            Hero(
              tag: 'hero_search',
              child: TextField(
                onChanged: (value) async {
                  await widget.debounce.run(() {
                    GetIt.I.get<LocationSearchRepo>().locationSearch(value);
                  });
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
          ])),
    );
  }
}
