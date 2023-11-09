class MenuItem {
  final String title;
  final String iconPath;

  MenuItem({
    required this.title,
    required this.iconPath,
  });
}

List<MenuItem> items = [
  MenuItem(
      title: 'Post a Seequl', iconPath: 'assets/icons/menu_icons/post.png'),
  MenuItem(
      title: 'View your likes', iconPath: 'assets/icons/menu_icons/view.png'),
  MenuItem(
      title: 'Your Seequl posts',
      iconPath: 'assets/icons/menu_icons/your_posts.png'),
  MenuItem(
      title: 'Reference contribution',
      iconPath: 'assets/icons/menu_icons/reference.png'),
  MenuItem(
      title: 'Hashtag challenges',
      iconPath: 'assets/icons/menu_icons/hashtag.png'),
  MenuItem(
      title: 'Notifications',
      iconPath: 'assets/icons/menu_icons/notification.png'),
  MenuItem(
      title: 'About SeeQul', iconPath: 'assets/icons/menu_icons/about.png'),
];
