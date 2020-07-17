import 'package:login_balta/models/user_model.dart';
import 'package:login_balta/viewmodel/singup_viewmodel.dart';

class AccountRepository{
  Future<UserModel> creatAccount(SingupViewModel model) async{
    await Future.delayed(new Duration(milliseconds: 1500));
    return new UserModel(id: "1",
      name: "Emerson",
      email: "lima.emerson2009@gmail.com",
      picture:"https://picsum.photos/200/200",//site gera imagem dinamicamente
      role: "student",
      token: "xpto",
    );
  }
}