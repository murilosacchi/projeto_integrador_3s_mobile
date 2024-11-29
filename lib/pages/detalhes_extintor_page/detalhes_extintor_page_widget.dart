import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'detalhes_extintor_page_model.dart';
export 'detalhes_extintor_page_model.dart';

class DetalhesExtintorPageWidget extends StatefulWidget {
  const DetalhesExtintorPageWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<DetalhesExtintorPageWidget> createState() =>
      _DetalhesExtintorPageWidgetState();
}

class _DetalhesExtintorPageWidgetState
    extends State<DetalhesExtintorPageWidget> {
  late DetalhesExtintorPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesExtintorPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ExtintoresRow>>(
      future: ExtintoresTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'Id',
          widget.id,
        ),
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
        List<ExtintoresRow> detalhesExtintorPageExtintoresRowList =
            snapshot.data!;

        final detalhesExtintorPageExtintoresRow =
            detalhesExtintorPageExtintoresRowList.isNotEmpty
                ? detalhesExtintorPageExtintoresRowList.first
                : null;

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
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('ConsultaPage');
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  detalhesExtintorPageExtintoresRow?.patrimonio,
                  '-',
                ),
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
                    height: MediaQuery.sizeOf(context).height * 0.87,
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
