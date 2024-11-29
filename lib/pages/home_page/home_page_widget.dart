import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList1 = [
      const Color(0xFFF9D100),
      const Color(0xFFFF0000),
      const Color(0xFF26C110)
    ];
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
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Painel',
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Opacity(
                            opacity: 0.0,
                            child: Container(
                              width: 69.0,
                              height: 86.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          ),
                          Text(
                            'Vencimento em 6 meses',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: FutureBuilder<List<ContagemValidadeRow>>(
                          future: ContagemValidadeTable().queryRows(
                            queryFn: (q) => q,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<ContagemValidadeRow>
                                containerContagemValidadeRowList =
                                snapshot.data!;

                            return Container(
                              width: 600.0,
                              height: MediaQuery.sizeOf(context).height * 0.45,
                              decoration: BoxDecoration(
                                color: const Color(0xFF001489),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 362.0,
                                      child: Stack(
                                        children: [
                                          FlutterFlowPieChart(
                                            data: FFPieChartData(
                                              values:
                                                  containerContagemValidadeRowList
                                                      .map((e) => e
                                                          .quantidadeExtintores)
                                                      .withoutNulls
                                                      .toList(),
                                              colors: chartPieChartColorsList1,
                                              radius: [100.0],
                                            ),
                                            donutHoleRadius: 40.0,
                                            donutHoleColor: Colors.transparent,
                                            sectionLabelType:
                                                PieChartSectionLabelType.value,
                                            sectionLabelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            labelFormatter: LabelFormatter(
                                              numberFormat: (val) =>
                                                  val.toString(),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 1.0),
                                            child: FlutterFlowChartLegendWidget(
                                              entries:
                                                  containerContagemValidadeRowList
                                                      .map((e) => e.vencimentos)
                                                      .withoutNulls
                                                      .toList()
                                                      .asMap()
                                                      .entries
                                                      .map(
                                                        (label) => LegendEntry(
                                                          chartPieChartColorsList1[
                                                              label.key %
                                                                  chartPieChartColorsList1
                                                                      .length],
                                                          label.value,
                                                        ),
                                                      )
                                                      .toList(),
                                              width: 225.0,
                                              height: 40.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              textPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              borderWidth: 1.0,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                              borderColor: const Color(0xFF0C0B0B),
                                              indicatorSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 81.0,
                            height: 100.0,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Vencimento por mês',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color(0xFF020202),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: FutureBuilder<List<VencimentosMesRow>>(
                          future: VencimentosMesTable().queryRows(
                            queryFn: (q) => q,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<VencimentosMesRow>
                                containerVencimentosMesRowList = snapshot.data!;

                            return Container(
                              width: 600.0,
                              height: MediaQuery.sizeOf(context).height * 0.45,
                              decoration: BoxDecoration(
                                color: const Color(0xFF001489),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 370.0,
                                      child: FlutterFlowBarChart(
                                        barData: [
                                          FFBarChartData(
                                            yData:
                                                containerVencimentosMesRowList
                                                    .map((e) =>
                                                        e.quantidadeExtintores)
                                                    .withoutNulls
                                                    .toList(),
                                            color: const Color(0xFFF9F9F9),
                                          )
                                        ],
                                        xLabels: containerVencimentosMesRowList
                                            .map((e) => e.mesVencimento)
                                            .withoutNulls
                                            .toList(),
                                        barWidth: 25.0,
                                        barBorderRadius:
                                            BorderRadius.circular(0.0),
                                        groupSpace: 8.0,
                                        alignment:
                                            BarChartAlignment.spaceAround,
                                        chartStylingInfo: const ChartStylingInfo(
                                          enableTooltip: true,
                                          backgroundColor: Color(0x00FFFFFF),
                                          showGrid: true,
                                          showBorder: false,
                                        ),
                                        axisBounds: const AxisBounds(
                                          maxY: 200.0,
                                        ),
                                        xAxisLabelInfo: const AxisLabelInfo(
                                          showLabels: true,
                                          labelTextStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          labelInterval: 10.0,
                                          reservedSize: 28.0,
                                        ),
                                        yAxisLabelInfo: AxisLabelInfo(
                                          showLabels: true,
                                          labelTextStyle: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          labelInterval: 20.0,
                                          labelFormatter: LabelFormatter(
                                            numberFormat: (val) =>
                                                val.toString(),
                                          ),
                                          reservedSize: 42.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
