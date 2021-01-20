import 'package:flutter/material.dart';
import 'package:flutter_app/src/blocs.dart';
import 'package:flutter_app/src/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  const App({
    Key key,
    @required this.weatherRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter app",
      home: BlocProvider(
        create: (context) => WeatherBloc(
          weatherRepository: weatherRepository,
        ),
        child: Text("HelloWorld"),
      ),
    );
  }
}
