import 'package:flutter/material.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          ListTile(
            title: Text('Pazarlar Çok Kirli'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'Pazarlar 1 aydır temiz bırakılmıyor.Çok fazla koku gelmeye başladı herkes rahatsız çok kirli, temizlenmesi gerekiyor.Ve Pazar yerine çöp kutuları konulmalı.Pazarcıar çöplerini yere atıyorlar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  });
            },
          ),
          Positioned(
            top: 1,
            left: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                '23/07/2024',
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
