import 'package:flutter/material.dart';

class InspectionsProcess extends StatefulWidget {
  InspectionsProcess({super.key});

  @override
  State<InspectionsProcess> createState() => _InspectionsProcessState();
}

class _InspectionsProcessState extends State<InspectionsProcess> {
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
            DropdownButton(
              value: _selectedOption2,
              items: [
                DropdownMenuItem(
                  child: Text("Ruhsat Var mı?"),
                  value: "seçiniz",
                ),
                DropdownMenuItem(
                  child: Text("Ruhsat var"),
                  value: "seçenek2",
                ),
                DropdownMenuItem(
                  child: Text("Ruhsat yok"),
                  value: "seçenek3",
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption2 = newValue!;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Firma ADI',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Adres No',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'İhtar Süresi(Gün)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ara butonuna basıldığında yapılacak işlemler
              },
              child: Text('Tamamla'),
            ),
            SizedBox(height: 20),
            Text(
              'Sonuçlar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
