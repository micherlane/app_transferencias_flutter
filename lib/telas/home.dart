import 'package:flutter/material.dart';
import 'package:transferencias/database/database.dart';
import '../model/transferencia.dart';
import '../telas/formulario.dart';
import 'dart:developer' as imprime;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _construirAppBar('Banco'),
      floatingActionButton: _construirBotaoCriarTransferencia(),
      body: FutureBuilder<List<Transferencia>>(
        initialData: _transferencias,
        future: getTodos(),
        builder: (context, snapshot) {
          _transferencias = snapshot.data!.toList();
          return _construirCardsTransferencias();
        },
      ),
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
      padding: const EdgeInsets.all(10.0),
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
        Future future = Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TransferenciaForm()));
        future.then((transferencias) {
          if (transferencias != null) {
            setState(() {
              _transferencias = transferencias;
            });
          }
        });
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _construirTexto(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _construirItemTransferencia(Transferencia transferencia) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: _construirTexto('Número da Conta: ${transferencia.numeroConta}'),
        subtitle: _construirTexto('Valor: ${transferencia.valor.toString()}'),
      ),
    );
  }
}
