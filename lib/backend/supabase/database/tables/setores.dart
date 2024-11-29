import '../database.dart';

class SetoresTable extends SupabaseTable<SetoresRow> {
  @override
  String get tableName => 'setores';

  @override
  SetoresRow createRow(Map<String, dynamic> data) => SetoresRow(data);
}

class SetoresRow extends SupabaseDataRow {
  SetoresRow(super.data);

  @override
  SupabaseTable get table => SetoresTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get setor => getField<String>('setor');
  set setor(String? value) => setField<String>('setor', value);
}
