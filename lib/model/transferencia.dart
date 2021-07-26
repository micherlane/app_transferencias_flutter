class Transferencia {
  String numeroConta;
  double valor;

  Transferencia({required this.numeroConta, required this.valor});

  @override
  String toString() {
    return "Transferência{Número da conta: $numeroConta, Valor(R\$): $valor}";
  }
}
