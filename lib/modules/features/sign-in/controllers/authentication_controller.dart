import 'package:foodie/modules/features/sign-in/models/user_model.dart';
import 'package:foodie/modules/features/sign-in/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthenticationController extends GetxController {
  final isLogged = false.obs;
  late UserModel _user;

  Future<bool> login({String? email, String? password}) async {
    try {
      UserModel user = await AuthRepository().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}
