import 'package:flutter/material.dart';

class TransferenciaForm extends StatefulWidget {
  const TransferenciaForm({Key? key}) : super(key: key);

  @override
  _TransferenciaFormState createState() => _TransferenciaFormState();
}

class _TransferenciaFormState extends State<TransferenciaForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TRANSFERÊNCIA'),
      ),
      body: _construirFormulario(),
    );
  }

  Widget _construirCampoEntrada(String? label, String hint, bool ehNumero) {
    return TextField(
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

  Widget _construirFormulario() {
    return Column(
      children: <Widget>[
        _construirCampoEntrada('Número da Conta', '0000 - A', false),
        _construirCampoEntrada('Valor', '0.00', true),
        ElevatedButton(onPressed: () {}, child: const Text("Salvar")),
      ],
    );
  }
}
