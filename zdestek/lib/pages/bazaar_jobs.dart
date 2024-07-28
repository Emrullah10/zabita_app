import 'package:flutter/material.dart';
import 'package:zdestek/widgets/merkezveribilgileri.dart';
import 'package:zdestek/widgets/pazar_ara.dart';

class Bazaarjob extends StatelessWidget {
  const Bazaarjob({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      //pazarcı işlemleri
      child: Container(
        height: 600,
        width: 370,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: DefaultTabController(
          length: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pazarcı İşlemleri",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )),
              SizedBox(height: 20),
              TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'Pazarcı Ara'),
                  Tab(text: 'Pazarcı Bilgileri'),
                  Tab(text: 'Pazarcı Yeri Bilgileri'),
                  Tab(text: 'Ceza Bilgileri'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    pazarAra(),
                    MerkezVeriBilgileri(),
                    Text("data"),
                    Text("data2"),
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
