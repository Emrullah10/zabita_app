import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:zdestek/models/card_data.dart';
import 'package:zdestek/models/navigate_page.dart';
import 'package:flexible_scrollbar/flexible_scrollbar.dart';

class Documents extends StatefulWidget {
  Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  final ScrollController scrollController = ScrollController();

  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Belgeler",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: FlexibleScrollbar(
                alwaysVisible: true,
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Card(
                          elevation: 4.0,
                          child: ListTile(
                            title: Text('Kabahatlar Talimatnamesi'),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              NavigationPage.navigateToPage(
                                  context, '/kabahatlar');
                            },
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cardItems.length,
                          itemBuilder: (context, index) {
                            final cardItem = cardItems[index];
                            return Card(
                              elevation: 4.0,
                              child: InkWell(
                                onTap: () {},
                                child: ListTile(
                                  title: Text(cardItem.title),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            );
                          },
                        ),

                        Card(
                          elevation: 4.0,
                          child: ListTile(
                            title: Text('Zabıta müdürlüğü yönetmeliği'),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              NavigationPage.navigateToPage(
                                  context, '/reset_password');
                            },
                          ),
                        ),

                        // ... daha fazla belge öğesi
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
