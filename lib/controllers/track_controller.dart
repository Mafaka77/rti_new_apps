import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TrackController extends GetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  var isRtiSelected = true.obs;
  var isComplainSelected = false.obs;
}
