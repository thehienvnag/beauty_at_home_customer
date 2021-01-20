import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/blocs/weather_bloc.dart';
import 'package:flutter_app/src/blocs/weather_event.dart';
import 'package:flutter_app/src/blocs/weather_state.dart';
import 'package:flutter_app/src/widgets/city_selection.dart';
import 'package:flutter_app/src/widgets/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter app demo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySelection(),
                ),
              );
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context).add(
                  WeatherRequested(city: city),
                );
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: Text("Please select a location"),
              );
            }
            if (state is WeatherLoadInProgress) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadSuccess) {
              final weather = state.weather;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 100,
                    ),
                  ),
                  Center(
                    child: Location(
                      location: weather.location,
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
