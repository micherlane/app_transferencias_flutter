class Transferencia {
  int id;
  String numeroConta;
  double valor;

  Transferencia(
      {required this.id, required this.numeroConta, required this.valor});

  @override
  String toString() {
    return "Transferência{Número da conta: $numeroConta, Valor(R\$): $valor}";
  }
}
