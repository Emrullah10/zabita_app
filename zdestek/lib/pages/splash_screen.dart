import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _showText = false;
  late AnimationController _controller;
  late Animation<Offset> _slidePhotoAnimation;
  late Animation<Offset> _slideTextAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _slidePhotoAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0), // Sağdan kayar
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideTextAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Alttan yukarı kayar
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _showText = true;
      });
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacementNamed('/login');
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _slidePhotoAnimation,
              child: AnimatedOpacity(
                opacity: _showText ? 0.0 : 1.0,
                duration: Duration(seconds: 1),
                child: Image.asset('assets/logo.png'), // Logo dosyasının konumu
              ),
            ),
            SizedBox(height: 30),
            SlideTransition(
              position: _slideTextAnimation,
              child: AnimatedOpacity(
                opacity: _showText ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'e-Zabıta',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
