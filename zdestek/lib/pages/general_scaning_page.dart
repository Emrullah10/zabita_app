import 'package:flutter/material.dart';
import 'package:zdestek/widgets/merkezveribilgileri.dart';
import 'package:zdestek/widgets/ruhsatbilgileri.dart';

class GeneralScanning extends StatelessWidget {
  const GeneralScanning({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 600,
        width: 370,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Genel Bilgi Taraması",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )),
              SizedBox(height: 20),
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'Ruhsat Bilgileri'),
                  Tab(text: 'Merkez Veri Bilgileri'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    RuhsatBilgileri(),
                    MerkezVeriBilgileri(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
