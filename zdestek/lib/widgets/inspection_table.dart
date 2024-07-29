import 'package:flutter/material.dart';

class InspectionTable extends StatelessWidget {
  const InspectionTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.contain,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Firma/Sicil Adı')),
              DataColumn(label: Text('Firma Ünvanı')),
              DataColumn(label: Text('Ruhsat No')),
              DataColumn(label: Text('Sicil No')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Firma 1')),
                DataCell(Text('Ünvan 1')),
                DataCell(Text('12345')),
                DataCell(Text('67890')),
              ]),
              // Daha fazla satır ekleyin
            ],
          ),
        ),
      ],
    );
  }
}
