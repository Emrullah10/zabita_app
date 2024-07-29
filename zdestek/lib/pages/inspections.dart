import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:zdestek/widgets/inspection_table.dart';
import 'package:zdestek/widgets/inspections_process.dart';
import 'package:zdestek/widgets/merkezveribilgileri.dart';
import 'package:zdestek/widgets/pazar_ara.dart';

class InspectionPage extends StatelessWidget {
  const InspectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 30.0, // Kayan yazı yüksekliği
            width: 450,
            child: Marquee(
              text:
                  'SON DAKİKA bildiri: Belediye Başkanı, Pazarcılar Odası Başkanı ile bir araya geldi. Pazarcılar için yeni düzenlemeler yapılacak.',
              style: TextStyle(color: Colors.black, fontSize: 20),
              scrollAxis: Axis.horizontal,
              blankSpace: 20.0,
              velocity: 100.0,
            ),
          ),
        ),
        title: Column(
          children: [
            Text('E-ZABITA',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 39, 79, 138), // Lacivert renk
        centerTitle: true,
        // toolbarHeight: 150.0, // AppBar yüksekliğini artırıyoruz
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Center(
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
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Denetim İşlemleri",
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
                      Tab(
                        text: 'Denetim İşlemleri',
                      ),
                      Tab(text: 'Pazarcı Bilgileri'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        InspectionsProcess(),
                        InspectionTable(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
