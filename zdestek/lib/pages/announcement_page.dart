import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 600,
        width: 360,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title:
                    Text('ümitköy bilicisoft bina yıkım ve tahliye tebligatı'),
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
                            'yapı sahibinin izni ve binanın normal dışı yapım kuralları uymması nedeniyle 3194 sayılı imar kanununun 32. maddesi gereğince binanın yıkımı ve tahliyesi gerekmektedir.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
