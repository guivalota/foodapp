import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:foodapp/contants.dart';
import 'package:http/http.dart' as http;

class LoginRepository extends Disposable {
  var caminhoApi = "${Variaveis().IpAPI}/users/";

  Future<void> ListarClientes() async {
    try {
      var retorno = await http.get(Uri.parse("${caminhoApi}Listar/"));
      return json.decode(retorno.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<int> logar(String email, String senha) async {
    try {
      var url = "${caminhoApi}logar?email=$email&senha=$senha";
      var retorno = await http.get(Uri.parse(url));
      var aux = json.decode(retorno.body);
      return aux;
    } catch (e) {
      print(e.toString());
    }
    return 0;
  }




  @override
  void dispose() {}
}
