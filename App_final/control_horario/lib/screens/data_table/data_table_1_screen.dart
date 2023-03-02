import 'package:data_table_app/screens/data_table/data_table_2_screen.dart';
import 'package:flutter/material.dart';

class DataTable1Screen extends StatefulWidget {
  static const String id = 'data_table_1_screen';

  @override
  _DataTable1ScreenState createState() => _DataTable1ScreenState();
}

class _DataTable1ScreenState extends State<DataTable1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Seccion de Registros', style: TextStyle(fontSize: 40)),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DataTable2Screen.id);
                },
                child: Icon(
                  Icons.navigate_next,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
