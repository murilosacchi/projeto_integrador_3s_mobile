import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_search/text_search.dart';
import 'consulta_page_model.dart';
export 'consulta_page_model.dart';

class ConsultaPageWidget extends StatefulWidget {
  const ConsultaPageWidget({super.key});

  @override
  State<ConsultaPageWidget> createState() => _ConsultaPageWidgetState();
}

class _ConsultaPageWidgetState extends State<ConsultaPageWidget> {
  late ConsultaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsultaPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.extintores = await ExtintoresTable().queryRows(
        queryFn: (q) => q,
      );
      _model.listOfExtintores =
          _model.extintores!.toList().cast<ExtintoresRow>();
      safeSetState(() {});
    });

    _model.searchTextFieldTextController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ExtintoresRow>>(
      future: ExtintoresTable().queryRows(
        queryFn: (q) => q,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ExtintoresRow> consultaPageExtintoresRowList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: const Color(0xFF001489),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.table_rows,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              title: Text(
                'Consulta',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.86,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.78,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width: 200.0,
                                          child: Autocomplete<String>(
                                            initialValue: const TextEditingValue(),
                                            optionsBuilder: (textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<
                                                    String>.empty();
                                              }
                                              return consultaPageExtintoresRowList
                                                  .map((e) => e.patrimonio)
                                                  .toList()
                                                  .where((option) {
                                                final lowercaseOption =
                                                    option.toLowerCase();
                                                return lowercaseOption.contains(
                                                    textEditingValue.text
                                                        .toLowerCase());
                                              });
                                            },
                                            optionsViewBuilder:
                                                (context, onSelected, options) {
                                              return AutocompleteOptionsList(
                                                textFieldKey:
                                                    _model.searchTextFieldKey,
                                                textController: _model
                                                    .searchTextFieldTextController!,
                                                options: options.toList(),
                                                onSelected: onSelected,
                                                textStyle: const TextStyle(),
                                                textHighlightStyle: const TextStyle(),
                                                elevation: 4.0,
                                                optionBackgroundColor:
                                                    Colors.white,
                                                optionHighlightColor:
                                                    const Color(0xFFC0C0C0),
                                                maxHeight: 200.0,
                                              );
                                            },
                                            onSelected: (String selection) {
                                              safeSetState(() => _model
                                                      .searchTextFieldSelectedOption =
                                                  selection);
                                              FocusScope.of(context).unfocus();
                                            },
                                            fieldViewBuilder: (
                                              context,
                                              textEditingController,
                                              focusNode,
                                              onEditingComplete,
                                            ) {
                                              _model.searchTextFieldFocusNode =
                                                  focusNode;

                                              _model.searchTextFieldTextController =
                                                  textEditingController;
                                              return TextFormField(
                                                key: _model.searchTextFieldKey,
                                                controller:
                                                    textEditingController,
                                                focusNode: focusNode,
                                                onEditingComplete:
                                                    onEditingComplete,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText:
                                                      'Digite o patrimônio aqui...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .searchTextFieldTextControllerValidator
                                                    .asValidator(context),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  fillColor: const Color(0xFF001489),
                                  icon: Icon(
                                    Icons.search,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    safeSetState(() {
                                      _model.simpleSearchResults = TextSearch(
                                              _model
                                                  .listOfExtintores
                                                  .map((e) => e.patrimonio)
                                                  .toList()
                                                  .map((str) =>
                                                      TextSearchItem.fromTerms(
                                                          str, [str]))
                                                  .toList())
                                          .search(_model
                                              .searchTextFieldTextController
                                              .text)
                                          .map((r) => r.object)
                                          .toList();
                                    });
                                    _model.searchedExtintores = _model
                                        .listOfExtintores
                                        .where((e) => _model.simpleSearchResults
                                            .contains(e.patrimonio))
                                        .toList()
                                        .cast<ExtintoresRow>();
                                    safeSetState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: MediaQuery.sizeOf(context).height * 0.76,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: const Color(0xFF001489),
                              width: 3.0,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF001489),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Patrimônio',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Setor',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.25,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Prédio',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final extintoresChildren =
                                        (_model.simpleSearchResults.isNotEmpty
                                                ? _model.searchedExtintores
                                                : _model.listOfExtintores)
                                            .toList()
                                            .take(50)
                                            .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: extintoresChildren.length,
                                      itemBuilder:
                                          (context, extintoresChildrenIndex) {
                                        final extintoresChildrenItem =
                                            extintoresChildren[
                                                extintoresChildrenIndex];
                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: const Color(0xFF001489),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: const BoxDecoration(),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    extintoresChildrenItem
                                                        .patrimonio,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: const BoxDecoration(),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    extintoresChildrenItem
                                                        .setor,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: const BoxDecoration(),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    extintoresChildrenItem
                                                        .predio,
                                                    '-',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderRadius: 8.0,
                                                buttonSize: 50.0,
                                                icon: const FaIcon(
                                                  FontAwesomeIcons.eye,
                                                  color: Colors.black,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  context.goNamed(
                                                    'Detalhes_ExtintorPage',
                                                    queryParameters: {
                                                      'id': serializeParam(
                                                        extintoresChildrenItem
                                                            .id,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
