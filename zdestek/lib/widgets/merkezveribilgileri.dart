import 'package:flutter/material.dart';

class MerkezVeriBilgileri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'TC Kimlik No',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Adı',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Soyadı',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Faaliyet Durumu',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'İşe Başalama Tarihi',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        print(pickedDate.toString());
                      }
                    },
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'İşten Bırakma Tarihi',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        print(pickedDate.toString());
                      }
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Ara butonuna basıldığında yapılacak işlemler
              },
              child: Text('Sorgula'),
            ),
            SizedBox(height: 20),
            Text(
              'Sonuçlar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
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
        ),
      ),
    );
  }
}
