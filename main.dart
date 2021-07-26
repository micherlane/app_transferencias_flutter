import 'package:flutter/material.dart';
import 'transferencia.dart';

void main() => runApp(BancoApp());

class BancoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget{
  _HomePage({Key? key}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _construirAppBar('Banco C'),
      floatingActionButton: _construirBotaoAdicionarTransacao(),
      body: _construirCardsTransferencias(),
    );
  }
 
  AppBar _construirAppBar(titulo){
   return AppBar(title: titulo);
  }
  
  Widget _construirCardsTransferencias(){
    
    return Column(
      children:[
        _construirItemTransferencia(Transferencia(numeroConta: '12345-A', valor: 100.0)),
        _construirItemTransferencia(Transferencia(numeroConta: '12345-A', valor: 100.0)),                
      ],
    );
  }
  
  Widget _construirBotaoAdicionarTransacao(){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){},
    );
  }
  
  Widget _construirItemTransferencia(Transferencia transferencia){
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta),
      ),
    );
  }
}
