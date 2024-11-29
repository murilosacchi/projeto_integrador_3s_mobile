import '../database.dart';

class PrediosTable extends SupabaseTable<PrediosRow> {
  @override
  String get tableName => 'predios';

  @override
  PrediosRow createRow(Map<String, dynamic> data) => PrediosRow(data);
}

class PrediosRow extends SupabaseDataRow {
  PrediosRow(super.data);

  @override
  SupabaseTable get table => PrediosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get predio => getField<String>('Predio');
  set predio(String? value) => setField<String>('Predio', value);
}
