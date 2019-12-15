class Contato{
  final String nome;
  final int numero;
  final int id;

  Contato(this.id, this.nome, this.numero);

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, numero: $numero}';
  }


}