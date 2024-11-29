import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'consulta_page_widget.dart' show ConsultaPageWidget;
import 'package:flutter/material.dart';

class ConsultaPageModel extends FlutterFlowModel<ConsultaPageWidget> {
  ///  Local state fields for this page.

  List<ExtintoresRow> listOfExtintores = [];
  void addToListOfExtintores(ExtintoresRow item) => listOfExtintores.add(item);
  void removeFromListOfExtintores(ExtintoresRow item) =>
      listOfExtintores.remove(item);
  void removeAtIndexFromListOfExtintores(int index) =>
      listOfExtintores.removeAt(index);
  void insertAtIndexInListOfExtintores(int index, ExtintoresRow item) =>
      listOfExtintores.insert(index, item);
  void updateListOfExtintoresAtIndex(
          int index, Function(ExtintoresRow) updateFn) =>
      listOfExtintores[index] = updateFn(listOfExtintores[index]);

  List<ExtintoresRow> searchedExtintores = [];
  void addToSearchedExtintores(ExtintoresRow item) =>
      searchedExtintores.add(item);
  void removeFromSearchedExtintores(ExtintoresRow item) =>
      searchedExtintores.remove(item);
  void removeAtIndexFromSearchedExtintores(int index) =>
      searchedExtintores.removeAt(index);
  void insertAtIndexInSearchedExtintores(int index, ExtintoresRow item) =>
      searchedExtintores.insert(index, item);
  void updateSearchedExtintoresAtIndex(
          int index, Function(ExtintoresRow) updateFn) =>
      searchedExtintores[index] = updateFn(searchedExtintores[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ConsultaPage widget.
  List<ExtintoresRow>? extintores;
  // State field(s) for searchTextField widget.
  final searchTextFieldKey = GlobalKey();
  FocusNode? searchTextFieldFocusNode;
  TextEditingController? searchTextFieldTextController;
  String? searchTextFieldSelectedOption;
  String? Function(BuildContext, String?)?
      searchTextFieldTextControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
  }
}
