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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    List.generate(
        100,
        (index) => _usuarios.add(Usuario(
            codigo: index,
            nome: "Nome $index",
            endereco: "Endereço $index",
            email: "E-mail $index",
            telefone: "$index")));
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              showTrackOnHover: true,
              child: ListView(controller: _scrollController, children: [
                PaginatedDataTable(
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (v) {
                      setState(() {
                        _rowsPerPage = v!;
                      });
                    },
                    availableRowsPerPage: [5, 10, 15, 16],
                    header: Text("Clientes"),
                    actions: [
                      IconButton(icon: Icon(Icons.add), onPressed: () {}),
                      IconButton(icon: Icon(Icons.search), onPressed: () {})
                    ],
                    showCheckboxColumn: true,
                    sortAscending: true,
                    columns: <DataColumn>[
                      DataColumn(label: Text("Código")),
                      DataColumn(label: Text("Nome")),
                      DataColumn(label: Text("E-mail")),
                      DataColumn(label: Text("Telefone")),
                      DataColumn(label: Text("Endereço")),
                      DataColumn(label: Text("Ações")),
                    ],
                    source: MyDataTableSource(_usuarios, context)),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
