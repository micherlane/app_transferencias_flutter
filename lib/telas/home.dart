import 'package:flutter/material.dart';
import '../model/transferencia.dart';
import '../telas/formulario.dart';
import 'dart:developer' as imprime;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _construirAppBar('Banco'),
      floatingActionButton: _construirBotaoCriarTransferencia(),
      body: _construirCardsTransferencias(),
    );
  }

  void adicionarTransferencia(Transferencia transferencia) {
    setState(() {
      _transferencias.add(transferencia);
    });
    imprime.log(_transferencias.toString());
  }

  AppBar _construirAppBar(titulo) {
    return AppBar(title: Text(titulo));
  }

  Widget _construirCardsTransferencias() {
    return ListView.builder(
      itemCount: _transferencias.length,
      itemBuilder: (ctx, index) {
        var tr = _transferencias[index];
        return _construirItemTransferencia(tr);
      },
    );
  }

  Widget _construirBotaoCriarTransferencia() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TransferenciaForm(
                      addTransferencia: adicionarTransferencia,
                    )));
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _construirItemTransferencia(Transferencia transferencia) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transferencia.numeroConta),
        subtitle: Text(transferencia.valor.toString()),
      ),
    );
  }
}
