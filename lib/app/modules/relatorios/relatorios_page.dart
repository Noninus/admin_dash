import 'dart:math';

import 'package:admin_dash/app/modules/home/my_scaffold.dart';
import 'package:admin_dash/app/modules/relatorios/components/data_table.dart';
import 'package:admin_dash/app/modules/relatorios/relatorios_controller.dart';
import 'package:admin_dash/app/shared/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RelatoriosPage extends StatefulWidget {
  final String title;
  const RelatoriosPage({Key? key, this.title = "Dashboard"}) : super(key: key);

  @override
  _RelatoriosPageState createState() => _RelatoriosPageState();
}

class _RelatoriosPageState
    extends ModularState<RelatoriosPage, RelatoriosController> {
  //use 'controller' variable to access controller

  List<Usuario> _usuarios = [];
  int _rowsPerPage = 5;
  ScrollController? _scrollController;
  var random = Random();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    List.generate(
        100,
        (index) => _usuarios.add(Usuario(
            id: index,
            nome: "Nome $index",
            email: "E-mail $index",
            telefone: "${random.nextInt(1000000) + 99000000}")));
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            "Relátorios",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(height: 10),
          SelectableText(
            "Exemplo de uma DataTable",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              showTrackOnHover: true,
              child: ListView(controller: _scrollController, children: [
                Theme(
                  data: Theme.of(context).copyWith(
                      cardTheme:
                          CardTheme(elevation: 10, color: Colors.grey[100])),
                  child: PaginatedDataTable(
                      rowsPerPage: _rowsPerPage,
                      onRowsPerPageChanged: (v) {
                        setState(() {
                          _rowsPerPage = v!;
                        });
                      },
                      availableRowsPerPage: [5, 10, 15, 16],
                      // header: Text("Clientes"),
                      // actions: [
                      //   IconButton(icon: Icon(Icons.add), onPressed: () {}),
                      //   IconButton(icon: Icon(Icons.search), onPressed: () {})
                      // ],
                      showCheckboxColumn: true,
                      sortAscending: true,
                      columns: <DataColumn>[
                        DataColumn(label: Text("Código")),
                        DataColumn(label: Text("Nome")),
                        DataColumn(label: Text("E-mail")),
                        DataColumn(label: Text("Telefone")),
                        DataColumn(label: Text("Ações")),
                      ],
                      source: MyDataTableSource(_usuarios, context)),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
