import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transferencias/database/database.dart';
import 'dart:developer' as imprime;

import 'package:transferencias/model/transferencia.dart';

class TransferenciaForm extends StatefulWidget {
  static int quantConstruido = 0;

  const TransferenciaForm({
    Key? key,
  }) : super(key: key);

  @override
  _TransferenciaFormState createState() => _TransferenciaFormState();
}

class _TransferenciaFormState extends State<TransferenciaForm> {
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRANSFERÊNCIA'),
      ),
      body: SingleChildScrollView(child: _construirFormulario()),
    );
  }

  Widget _construirCampoEntrada(TextEditingController controller, String? label,
      String hint, bool ehNumero) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      keyboardType: ehNumero
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.name,
    );
  }

  int gerarId() {
    var random = Random();
    int id = random.nextInt(400);
    return id;
  }

  Future<void> salvarTransferencia() async {
    try {
      String numeroConta = _controllerNumeroConta.text;
      double valor = double.parse(_controllerValor.text);
      Transferencia tr =
          Transferencia(id: gerarId(), numeroConta: numeroConta, valor: valor);
      salvar(tr);
      var listaTransferencias = await getTodos();
      Navigator.pop(context, listaTransferencias);

      //widget.addTransferencia(tr);
    } catch (e) {
      imprime.log('Não deu certo');
    }
  }

  Widget _construirFormulario() {
    return Column(
      children: <Widget>[
        _construirCampoEntrada(
            _controllerNumeroConta, 'Número da Conta', '0000', true),
        _construirCampoEntrada(_controllerValor, 'Valor', '0.00', true),
        ElevatedButton(
          onPressed: salvarTransferencia,
          child: const Text("Salvar"),
        ),
      ],
    );
  }
}
