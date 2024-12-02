import '../database.dart';

class VencimentosMesTable extends SupabaseTable<VencimentosMesRow> {
  @override
  String get tableName => 'vencimentos_mes';

  @override
  VencimentosMesRow createRow(Map<String, dynamic> data) =>
      VencimentosMesRow(data);
}

class VencimentosMesRow extends SupabaseDataRow {
  VencimentosMesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VencimentosMesTable();

  String? get mesVencimento => getField<String>('mes_vencimento');
  set mesVencimento(String? value) => setField<String>('mes_vencimento', value);

  int? get quantidadeExtintores => getField<int>('quantidade_extintores');
  set quantidadeExtintores(int? value) =>
      setField<int>('quantidade_extintores', value);
}
