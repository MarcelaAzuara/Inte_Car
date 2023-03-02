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
