import 'package:foodapp/repository/login_repository.dart';

class LoginController{
  final LoginRepository _repository = LoginRepository();

  Future<int> logar(String email, String senha) async{
    var retorno = await _repository.logar(email, senha);
    return 0;
  }

}