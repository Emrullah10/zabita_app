import 'package:flutter/material.dart';

class Kabahatlar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kabahatlar Talimatnamesi'),
        backgroundColor: Colors.blue[900], // Lacivert renk
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/kabahatlar.jpg'),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Parola sıfırlama işlemleri burada yapılabilir
                // Örneğin, e-posta ile parola sıfırlama linki gönderme vb.
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900], // Lacivert renk
              ),
              child: Text('Göster'),
            ),
          ],
        ),
      ),
    );
  }
}
