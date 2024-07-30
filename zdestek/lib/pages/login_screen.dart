import 'package:flutter/material.dart';
import 'package:zdestek/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Logo için beyaz alan
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Image.asset('assets/logo.png'), // Logo dosyasının konumu
              ),
            ),
          ),
          // Giriş yapma yerleri ve buton için mavi alan
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 39, 79, 138), // Lacivert renk
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    // Kullanıcı Adı alanı
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'E-posta',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Şifre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                    // Şifre alanı ve göster/gizle butonu

                    SizedBox(height: 20),
                    // Giriş Yap butonu
                    ElevatedButton(
                      onPressed: () async {
                        // Giriş yapma işlemi
                        await AuthService().signIn(_emailController.text,
                            _passwordController.text, context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue[900], backgroundColor: Colors.white, // Lacivert yazı rengi
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Giriş Yap'),
                    ),
                    SizedBox(height: 10),
                    // Parola sıfırlama bağlantısı
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/reset_password');
                      },
                      child: Text(
                        'Parolanızı mı unuttunuz? Parola sıfırla',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
