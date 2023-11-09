import '../models/comment.dart';

String dummy =
    'Lorem ipsum dolor sit amet consectetur. Eget aenean integer amet sapien arcu urna '
    'turpis amet elementum. A nec euismod in quam venenatis. Consectetur et nunc amet '
    'mattis dui imperdiet tempus. Et aliquet gravida posuere pretium donec diam nibh sed. '
    'Pharetra non vitae urna aliquet egestas. Phasellus at id adipiscing eget. Lorem '
    'volutpat dolor lorem pharetra nunc duis lorem integer. Magna in pellentesque '
    'pretium elementum suspendisse tincidunt fermentum praesent.';

List<Comment> comments = [
  const Comment(
    text:
        'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper     '
        ' amet justo quisque          '
        'ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
    name: 'Kerry Johns',
    username: '@Kerryjo',
    userAvatar: 'Kerry',
    time: '3 hours ago',
    replies: '15',
    likes: '7k',
  ),
  const Comment(
      text:
          'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      '
          'amet justo duis. ',
      name: 'Perry Johns',
      username: '@Perryjo',
      userAvatar: 'Perry',
      time: '8 hours ago',
      likes: '7k'),
  const Comment(
    text:
        'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      '
        'amet justo quisque          '
        'ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
    name: 'Terry Johns',
    username: '@Terryjo',
    userAvatar: 'Terry',
    time: '3 hours ago',
    replies: '15',
    likes: '7k',
  ),
  const Comment(
    text:
        'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper      '
        'amet justo duis. ',
    name: 'Ferry Johns',
    username: '@Ferryjo',
    userAvatar: 'Ferry',
    time: '3 hours ago',
  ),
];
