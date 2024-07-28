class CardItem {
  final String title;

  final String route;

  CardItem({
    required this.title,
    required this.route,
  });
}

  List<CardItem> cardItems = [
    CardItem(
      title: 'Organizasyon Şeması',
      route: '/reset_password',
    ),
    CardItem(
      title: 'Zabıta Daire Başkanlığı(Alt Üst Sıralaması)',
      route: '',
    ),
    CardItem(
      title: 'Zabıta Müdürlüğü(Alt Üst Sıralaması)',
      route: '',
    ),
  ];