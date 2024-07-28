import 'package:flutter/material.dart';
import 'package:zdestek/widgets/complaint_card.dart';

class PeopleComplain extends StatelessWidget {
  const PeopleComplain({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      //vatandaş şikayetleri
      child: Container(
        alignment: Alignment.center,
        height: 600,
        width: 360,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < 10; i++) ComplaintCard(),
            ],
          ),
        ),
      ),
    );
  }
}
