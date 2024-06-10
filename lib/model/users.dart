class Users{
  int id;
  String nome;
  String email;
  String senha;

  Users({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha
  });

  Map<String, dynamic> toJson(){
    var json ={
      "id":id,
      "nome":nome,
      "email":email,
      "senha":senha
    };
    return json;
  }

  
}