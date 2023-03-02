import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Table',
      debugShowCheckedModeBanner: false,
      initialRoute: DataTable1Screen.id,
      routes: {
        DataTable1Screen.id: (context) => DataTable1Screen(),
        DataTable2Screen.id: (context) => DataTable2Screen()
      }
    );
  }
}

class DataTable1Screen extends StatefulWidget {
  static const String id = 'data_table_1_screen';

  @override
  _DataTable1ScreenState createState() => _DataTable1ScreenState();
}

//Pantalla principal
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

//Pantalla 2 con la tabla
class DataTable2Screen extends StatefulWidget {
  static const String id = 'data_table_2_screen';

  @override
  _DataTable2ScreenState createState() => _DataTable2ScreenState();
}

class _DataTable2ScreenState extends State<DataTable2Screen> {
  List<table> paises;
  bool sortAscending;

  @override
  void initState() {
    super.initState();
    sortAscending = false;
    paises = table.getTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Registros de Ingresos', style: TextStyle(fontSize: 40)),
              DataTable(
                dividerThickness: 2,
                dataRowHeight: 50,
                headingRowHeight: 50,
                sortColumnIndex: 0,
                sortAscending: sortAscending,
                columns: [
                  DataColumn(
                      label: Text('Dia'),
                      numeric: true,
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          sortAscending = !sortAscending;
                        });
                        ordenarColumna(columnIndex, ascending);
                      }),
                  DataColumn(
                    label: Text('Entrada'),
                    numeric: false,
                    tooltip: '',
                  ),
                  DataColumn(label: Text('Salida'), numeric: false),
                ],
                rows: paises
                    .map(
                      (pais) => DataRow(
                        selected: pais.selected,
                        onSelectChanged: (s) {
                          setState(() {
                            pais.selected = s;
                          });
                        },
                        cells: [
                          DataCell(
                            Text(
                              pais.dia,
                            ),
                          ),
                          DataCell(
                            Text(
                              pais.entrada,
                            ),
                          ),
                          DataCell(
                            Text(
                              pais.salida,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      children: paises
                          .map(
                            (pais) => (pais.selected)
                                ? TextSpan(
                                    text: pais.dia + '    ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )
                                : TextSpan(
                                    text: '',
                                  ),
                          )
                          .toList(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ordenarColumna(int columnIndex, bool ordenar) {
    if (columnIndex == 0) {
      if (ordenar) {
        paises.sort((a, b) => a.dia.compareTo(b.dia));
      } else {
        paises.sort((a, b) => b.dia.compareTo(a.dia));
      }
    }
  }
}


//Datos que se almacenan
class table {
  bool selected;
  String dia;
  String entrada;
  String salida;

  table({this.selected, this.dia, this.entrada, this.salida});

  static List<table> getTable() {
    return <table>[
      table(
        selected: false,
        dia: '1',
        entrada: '8:01',
        salida: '4:32',
      ),
      table(
        selected: false,
        dia: '6',
        entrada: '7:58',
        salida:'6:45',
      ),
      table(
        selected: false,
        dia: '11',
        entrada: '8:13',
        salida:'5:18',
      ),
    ];
  }
}
