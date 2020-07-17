import 'package:login_balta/models/user_model.dart';
import 'package:login_balta/repositories/account_repository.dart';
import 'package:login_balta/viewmodel/singup_viewmodel.dart';

class SignupController {
  AccountRepository repository;

  SignupController(){
    repository = new AccountRepository();
  }
  Future<UserModel> create(SingupViewModel model) async {
    model.busy = true;
    var user = await repository.creatAccount(model);
    model.busy = false;
    return user;
  }
}