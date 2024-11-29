import '../database.dart';

class AnoProximaRetiradaTable extends SupabaseTable<AnoProximaRetiradaRow> {
  @override
  String get tableName => 'ano_proxima_retirada';

  @override
  AnoProximaRetiradaRow createRow(Map<String, dynamic> data) =>
      AnoProximaRetiradaRow(data);
}

class AnoProximaRetiradaRow extends SupabaseDataRow {
  AnoProximaRetiradaRow(super.data);

  @override
  SupabaseTable get table => AnoProximaRetiradaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get ano => getField<String>('ano');
  set ano(String? value) => setField<String>('ano', value);
}
