import 'package:flutkit/m3/cookify/models/user.dart';
import 'package:flutx/flutx.dart';

class ProfileController extends FxController {
  bool showLoading = true, uiLoading = true;
  late User user;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    user = await User.getOne();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "profile_controller";
  }
}
