import 'package:flutter/material.dart';

class RuhsatBilgileri extends StatelessWidget {
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
                labelText: 'Vergi No',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Firma Adı',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Firma Ünvanı',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Şirket Türü',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Adres',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Ruhsat Yıl/No',
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Ruhsat Verildiği Tarih',
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
                      labelText: 'Sicil No',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Mernis No',
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Durum',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ara butonuna basıldığında yapılacak işlemler
              },
              child: Text('Ara'),
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