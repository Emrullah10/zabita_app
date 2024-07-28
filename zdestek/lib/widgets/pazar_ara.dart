import 'package:flutter/material.dart';

class pazarAra extends StatefulWidget {
  const pazarAra({super.key});

  @override
  State<pazarAra> createState() => _pazarAraState();
}

class _pazarAraState extends State<pazarAra> {
  String? _selectedOption = 'seçiniz';
  String? _selectedOption2 = 'seçiniz';
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
                labelText: 'Adı',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Soyadı',
              ),
            ),
            DropdownButton(
              value: _selectedOption,
              items: [
                DropdownMenuItem(
                  child: Text("Merkezdeki Faaliyet Durumu"),
                  value: "seçiniz",
                ),
                DropdownMenuItem(
                  child: Text("seçenek2"),
                  value: "seçenek2",
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
              },
            ),
            DropdownButton(
              value: _selectedOption2,
              items: [
                DropdownMenuItem(
                  child: Text("şirket türü"),
                  value: "seçiniz",
                ),
                DropdownMenuItem(
                  child: Text("Limited Şirket"),
                  value: "seçenek2",
                ),
                DropdownMenuItem(
                  child: Text("Anonim Şirket"),
                  value: "seçenek3",
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption2 = newValue!;
                });
              },
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
