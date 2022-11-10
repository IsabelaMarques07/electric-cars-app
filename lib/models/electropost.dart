class Eletroposto {
  final String nome;
  final String endereco;
  final String telefone;
  final List<dynamic> conectores;
  final String informacoes;

  Eletroposto(this.nome, this.endereco, this.telefone, this.conectores, this.informacoes);

  Map<String, dynamic> toJson() =>
      {'nome': nome, 'endereco': endereco, 'telefone': telefone, 'conectores':conectores, 'informacoes':informacoes};

  Eletroposto.fromJson(Map json)
      : nome = json['nome'],
        endereco = json['endereco'],
        informacoes = json['informacoes'],
        telefone = json['telefone'],
        conectores = json['conectores'];
}
