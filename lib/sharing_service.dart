import 'package:share_plus/share_plus.dart';

class SharingService {
  void shareList(String list) {
    Share.share('Check out my shopping list: $list');
  }
}
