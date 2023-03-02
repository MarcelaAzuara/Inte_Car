import 'package:data_table_app/models/table.dart';
import 'package:flutter/material.dart';

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
