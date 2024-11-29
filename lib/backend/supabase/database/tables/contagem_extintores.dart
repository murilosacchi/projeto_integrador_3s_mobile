import '../database.dart';

class ContagemExtintoresTable extends SupabaseTable<ContagemExtintoresRow> {
  @override
  String get tableName => 'contagem_extintores';

  @override
  ContagemExtintoresRow createRow(Map<String, dynamic> data) =>
      ContagemExtintoresRow(data);
}

class ContagemExtintoresRow extends SupabaseDataRow {
  ContagemExtintoresRow(super.data);

  @override
  SupabaseTable get table => ContagemExtintoresTable();

  String? get predio => getField<String>('Predio');
  set predio(String? value) => setField<String>('Predio', value);

  int? get quantidadeExtintores => getField<int>('quantidade_extintores');
  set quantidadeExtintores(int? value) =>
      setField<int>('quantidade_extintores', value);
}
