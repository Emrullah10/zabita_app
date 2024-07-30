import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marquee/marquee.dart';
import 'package:zdestek/models/card_data.dart';
import 'package:zdestek/models/navigate_page.dart';
import 'package:zdestek/pages/announcement_page.dart';
import 'package:zdestek/pages/bazaar_jobs.dart';
import 'package:zdestek/pages/documents.dart';
import 'package:zdestek/pages/general_scaning_page.dart';
import 'package:zdestek/pages/login_screen.dart';
import 'package:zdestek/models/pie_data.dart';
import 'package:zdestek/pages/people_complaints.dart';
import 'package:zdestek/services/auth_service.dart';
import 'package:zdestek/widgets/pie_chart_widget.dart';
import 'package:flexible_scrollbar/flexible_scrollbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Başlangıçta HomePage seçili olacak
  final ScrollController scrollController = ScrollController();
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      GeneralScanning(),
      Bazaarjob(),
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 140, // İkon resimlerin yüksekliği
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 16),
                    _BuildIconItems(
                      navigateToPage: (context) {
                        _onItemTapped(0);
                      },
                      assetPath: 'assets/artı.png',
                      description: 'Genel Bilgi Tarama',
                    ),
                    SizedBox(width: 30),
                    _BuildIconItems(
                        navigateToPage: (context) {
                          _onItemTapped(1);
                        },
                        assetPath: 'assets/market.png',
                        description: 'Pazarcı İşlem'),

                    SizedBox(width: 30),
                    _BuildIconItems(
                        navigateToPage: (context) {
                          Navigator.pushNamed(context, '/inspections');
                        },
                        assetPath: 'assets/belge.png',
                        description: 'Son Denetimler'),
                    SizedBox(width: 30),
                    _BuildIconItems(
                        navigateToPage: (context) {
                          _onItemTapped(3);
                        },
                        assetPath: 'assets/tehlike.png',
                        description: 'İstek Şikayet'),
                    SizedBox(width: 30),
                    _BuildIconItems(
                        navigateToPage: (context) {
                          _onItemTapped(4);
                        },
                        assetPath: 'assets/announcementt.png',
                        description: 'Duyurular'),
                    SizedBox(width: 30),
                    _BuildIconItems(
                        navigateToPage: (context) {
                          Navigator.pushNamed(context, '/documents');
                        },
                        assetPath: 'assets/folderdoc.png',
                        description: 'Belgeler'), // Daha fazla ikon ekleyin
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
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
                          IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {
                              NavigationPage.navigateToPage(
                                context,
                                '/documents',
                              );
                            },
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
                                          trailing:
                                              Icon(Icons.arrow_forward_ios),
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
              SizedBox(height: 20),
              Text(
                'Esnaf Dağılımı',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Flexible(
                child: PieChartWidget(
                  pieData: [
                    PieData('Pazar', 60),
                    PieData('Manav', 20),
                    PieData('Market', 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      PeopleComplain(),
      AnnouncementPage(),
      Documents(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200], // Arka plan rengi
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
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 39, 79, 138),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/resim.png'),
                  ),
                  DropdownButton<String>(
                    value: _dropdownValue,
                    hint: Text(
                      'Profil İşlemleri',
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.blue[900],
                    icon: Icon(Icons.arrow_downward, color: Colors.white),
                    items: <String>['Profil', 'Ayarlar', 'Çıkış Yap']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) async {
                      setState(() {
                        _dropdownValue = newValue;
                      });
                      if (newValue == 'Profil') {
                        // Profil sayfasına yönlendirme kodu
                      } else if (newValue == 'Ayarlar') {
                        // Ayarlar sayfasına yönlendirme kodu
                      } else if (newValue == 'Çıkış Yap') {
                        // Çıkış yapma ve giriş sayfasına yönlendirme

                        await AuthService().signOut(context);
                      }
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset('assets/documentamini.png'),
              title: Text('Genel Bilgi Taraması'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Image.asset('assets/foldermini.png'),
              title: Text('Pazarcı İşlemleri'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Image.asset('assets/home.png'),
              title: Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Image.asset('assets/kalem.png'),
              title: Text('Vatandaş Şikayetleri'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Image.asset('assets/announcementmini.png'),
              title: Text('Duyurular'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(4);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Color.fromARGB(225, 39, 79, 138),
        color: Colors.white,
        items: <CurvedNavigationBarItem>[
          CurvedNavigationBarItem(
            child: Image.asset('assets/documenta.png'),
            label: 'Tarama',
          ),
          CurvedNavigationBarItem(
            child: Image.asset('assets/folder.png'),
            label: 'Bilgiler',
          ),
          CurvedNavigationBarItem(
            child: Image.asset('assets/home.png'),
            label: 'Ana Sayfa',
          ),
          CurvedNavigationBarItem(
            child: Image.asset('assets/kalem.png'),
            label: 'Şikayetler',
          ),
          CurvedNavigationBarItem(
            child: Image.asset('assets/announcement.png'),
            label: 'Duyurular',
          ),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _BuildIconItems extends StatelessWidget {
  final void Function(
    BuildContext context,
  ) navigateToPage;
  final String assetPath;
  final String description;
  const _BuildIconItems(
      {super.key,
      required this.navigateToPage,
      required this.assetPath,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToPage(
          context,
        );
      },
      child: Column(
        children: [
          Image.asset(
            assetPath,
            height: 100, // Resim yüksekliği
            width: 100, // Resim genişliği
          ),
          SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }
}
