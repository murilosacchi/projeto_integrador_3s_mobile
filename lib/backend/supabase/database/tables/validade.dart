import '../database.dart';

class ValidadeTable extends SupabaseTable<ValidadeRow> {
  @override
  String get tableName => 'validade';

  @override
  ValidadeRow createRow(Map<String, dynamic> data) => ValidadeRow(data);
}

class ValidadeRow extends SupabaseDataRow {
  ValidadeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ValidadeTable();

  String? get patrimonio => getField<String>('Patrimonio');
  set patrimonio(String? value) => setField<String>('Patrimonio', value);

  DateTime? get proxRecManut => getField<DateTime>('Prox_Rec_Manut');
  set proxRecManut(DateTime? value) =>
      setField<DateTime>('Prox_Rec_Manut', value);

  String? get vencimentos => getField<String>('vencimentos');
  set vencimentos(String? value) => setField<String>('vencimentos', value);
}
