import 'package:admin_dash/app/shared/models/usuario.dart';
import 'package:flutter/material.dart';

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data, this.context);

  final List<Usuario> data;
  BuildContext context;
  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].id}')),
        DataCell(Text('${data[index].nome}')),
        DataCell(Text('${data[index].email}')),
        DataCell(Text('${data[index].telefone}')),
        DataCell(Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                          title: Text("Deseja Remover esse cliente?"),
                          content: Container(
                            height: 70,
                            child: Column(
                              children: [
                                Text("Confirme a exclusão do cliente"),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton.icon(
                                    icon: Icon(Icons.delete),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    onPressed: () {},
                                    label: Text("Excluir Usuario"))
                              ],
                            ),
                          ));
                    });
              },
              label: Text("Deletar"),
            ),
            SizedBox(
              width: 6,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              icon: Icon(Icons.edit),
              onPressed: () {},
              label: Text("Editar"),
            ),
            SizedBox(
              width: 6,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              icon: Icon(Icons.visibility),
              onPressed: () {},
              label: Text("Visualizar"),
            ),
          ],
        )),
      ],
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}
