import '../database.dart';

class ContagemValidadeTable extends SupabaseTable<ContagemValidadeRow> {
  @override
  String get tableName => 'contagem_validade';

  @override
  ContagemValidadeRow createRow(Map<String, dynamic> data) =>
      ContagemValidadeRow(data);
}

class ContagemValidadeRow extends SupabaseDataRow {
  ContagemValidadeRow(super.data);

  @override
  SupabaseTable get table => ContagemValidadeTable();

  String? get vencimentos => getField<String>('vencimentos');
  set vencimentos(String? value) => setField<String>('vencimentos', value);

  int? get quantidadeExtintores => getField<int>('quantidade_extintores');
  set quantidadeExtintores(int? value) =>
      setField<int>('quantidade_extintores', value);
}
