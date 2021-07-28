import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:transferencias/model/transferencia.dart';

class TransferenciaTabela {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_numeroConta TEXT, '
      '$_valor REAL)';
  static const String _tableName = 'transferencias';
  static const String _id = 'id';
  static const String _numeroConta = 'numero_conta';
  static const String _valor = 'valor';
}

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'transferencias.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TransferenciaTabela.tableSql);
    },
    version: 1,
  );
}

void salvar(Transferencia tr) async {
  Database db = await getDatabase();
  db.transaction((txn) async {
    await txn.rawInsert(
        "INSERT INTO ${TransferenciaTabela._tableName}(id, numero_conta, valor) VALUES(${tr.id}, ${tr.numeroConta}, ${tr.valor})");
  });
}

Future<List<Transferencia>> getTodos() async {
  Database db = await getDatabase();
  List<Map<String, dynamic>> lista =
      await db.rawQuery("SELECT * FROM ${TransferenciaTabela._tableName}");
  return toList(lista);
}

List<Transferencia> toList(List<Map<String, dynamic>> result) {
  final List<Transferencia> transferencias = [];
  for (Map<String, dynamic> row in result) {
    final Transferencia transferencia = Transferencia(
        id: row['id'], numeroConta: row['numero_conta'], valor: row['valor']);
    transferencias.add(transferencia);
  }
  return transferencias;
}

/*Map<String, dynamic> _toMap(Transferencia transferencia) {
  final Map<String, dynamic> transferenciaMap = {};
  transferenciaMap['id'] = transferencia.id;
  transferenciaMap['numero_conta'] = transferencia.numeroConta;
  transferenciaMap['valor'] = transferencia.valor;
  return transferenciaMap;
}

Future<int> save(Transferencia transferencia) async {
  final Database db = await getDatabase();
  Map<String, dynamic> contactMap = _toMap(transferencia);
  return db.insert(TransferenciaTabela._tableName, contactMap);
}



Future<List<Transferencia>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result =
      await db.query(TransferenciaTabela._tableName);
  print(result);
  List<Transferencia> transferencias = _toList(result);
  return transferencias;
}
*/