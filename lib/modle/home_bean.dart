class HomeBean {
  final String title;
  final String icon;
  final String describe;

  HomeBean(this.title, this.icon, this.describe);

  @override
  String toString() {
    return 'HomeBean{title: $title, icon: $icon, describe: $describe}';
  }
}
