import 'package:flutter/material.dart';
import 'package:solid_software_test_task/color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software Test Task',
      home: MyHomePage(title: 'Solid Software Test Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          _bloc.inputEventSink.add(ColorEvent.generate_new_random_color);
        },
        child: StreamBuilder(
            stream: _bloc.outputStateStream,
            initialData: Colors.blueAccent,
            builder: (context, snapshot) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: snapshot.data,
                alignment: Alignment.center,
                child: Text(
                  'Hey there',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 6.0,
                            color: Colors.black),
                        Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 2.0,
                            color: Color.fromARGB(125, 0, 0, 0)),
                      ],
                      color: Colors.white,
                      fontSize: 60,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w200),
                ),
              );
            }),
      ),
    );
  }
}
