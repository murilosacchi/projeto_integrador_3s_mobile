import '../database.dart';

class ExtintoresTable extends SupabaseTable<ExtintoresRow> {
  @override
  String get tableName => 'extintores';

  @override
  ExtintoresRow createRow(Map<String, dynamic> data) => ExtintoresRow(data);
}

class ExtintoresRow extends SupabaseDataRow {
  ExtintoresRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ExtintoresTable();

  String get patrimonio => getField<String>('Patrimonio')!;
  set patrimonio(String value) => setField<String>('Patrimonio', value);

  String? get tipo => getField<String>('Tipo');
  set tipo(String? value) => setField<String>('Tipo', value);

  String? get capac => getField<String>('Capac');
  set capac(String? value) => setField<String>('Capac', value);

  DateTime? get proxRecManut => getField<DateTime>('Prox_Rec_Manut');
  set proxRecManut(DateTime? value) =>
      setField<DateTime>('Prox_Rec_Manut', value);

  String? get proxRetEXT => getField<String>('Prox_Ret_EXT');
  set proxRetEXT(String? value) => setField<String>('Prox_Ret_EXT', value);

  String? get fabricante => getField<String>('Fabricante');
  set fabricante(String? value) => setField<String>('Fabricante', value);

  String? get area => getField<String>('Area');
  set area(String? value) => setField<String>('Area', value);

  String? get gerencia => getField<String>('Gerencia');
  set gerencia(String? value) => setField<String>('Gerencia', value);

  String? get setor => getField<String>('Setor');
  set setor(String? value) => setField<String>('Setor', value);

  String? get predio => getField<String>('Predio');
  set predio(String? value) => setField<String>('Predio', value);

  String? get local => getField<String>('Local');
  set local(String? value) => setField<String>('Local', value);

  int? get seloInmetro => getField<int>('Selo_Inmetro');
  set seloInmetro(int? value) => setField<int>('Selo_Inmetro', value);

  String? get naoConformidades => getField<String>('Nao_Conformidades');
  set naoConformidades(String? value) =>
      setField<String>('Nao_Conformidades', value);

  String? get observacao => getField<String>('Observacao');
  set observacao(String? value) => setField<String>('Observacao', value);

  DateTime? get dataDaInspecao => getField<DateTime>('Data_da_Inspecao');
  set dataDaInspecao(DateTime? value) =>
      setField<DateTime>('Data_da_Inspecao', value);

  String? get numEquip => getField<String>('Num_Equip');
  set numEquip(String? value) => setField<String>('Num_Equip', value);

  String get id => getField<String>('Id')!;
  set id(String value) => setField<String>('Id', value);
}
