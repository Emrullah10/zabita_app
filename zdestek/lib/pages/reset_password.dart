import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parola Sıfırlama'),
        backgroundColor: Colors.blue[900], // Lacivert renk
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Parola sıfırlama adımları burada yer alacak.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Parola sıfırlama işlemleri burada yapılabilir
                // Örneğin, e-posta ile parola sıfırlama linki gönderme vb.
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900], // Lacivert renk
              ),
              child: Text('Parola Sıfırla'),
            ),
          ],
        ),
      ),
    );
  }
}
