import 'package:flutter/material.dart';
import 'dart:developer' as imprime;

import 'package:transferencias/model/transferencia.dart';

class TransferenciaForm extends StatefulWidget {
  final void Function(Transferencia) addTransferencia;

  const TransferenciaForm({Key? key, required this.addTransferencia})
      : super(key: key);

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
      style: const TextStyle(fontSize: 24.0),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      keyboardType: ehNumero
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.name,
    );
  }

  void salvarTransferencia() {
    try {
      String numeroConta = _controllerNumeroConta.text;
      double valor = double.parse(_controllerValor.text);
      Transferencia tr = Transferencia(numeroConta: numeroConta, valor: valor);

      widget.addTransferencia(tr);
    } catch (e) {
      imprime.log('Não deu certo');
    }

    Navigator.of(context).pop();
  }

  Widget _construirFormulario() {
    return Column(
      children: <Widget>[
        _construirCampoEntrada(
            _controllerNumeroConta, 'Número da Conta', '0000 - A', false),
        _construirCampoEntrada(_controllerValor, 'Valor', '0.00', true),
        ElevatedButton(
          onPressed: salvarTransferencia,
          child: const Text("Salvar"),
        ),
      ],
    );
  }
}
