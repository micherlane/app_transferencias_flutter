import 'package:flutter/material.dart';
import '../model/transferencia.dart';
import '../telas/formulario.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _construirAppBar('Banco'),
      floatingActionButton: _construirBotaoCriarTransferencia(),
      body: _construirCardsTransferencias(),
    );
  }

  AppBar _construirAppBar(titulo) {
    return AppBar(title: Text(titulo));
  }

  Widget _construirCardsTransferencias() {
    return Column(
      children: [
        _construirItemTransferencia(
            Transferencia(numeroConta: '12345-A', valor: 100.0)),
        _construirItemTransferencia(
            Transferencia(numeroConta: '12345-A', valor: 100.0)),
      ],
    );
  }

  Widget _construirBotaoCriarTransferencia() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TransferenciaForm()));
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _construirItemTransferencia(Transferencia transferencia) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta),
      ),
    );
  }
}
