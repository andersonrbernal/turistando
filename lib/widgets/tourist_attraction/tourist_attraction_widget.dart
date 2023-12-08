import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tourist_attraction_model.dart';
export 'tourist_attraction_model.dart';

class TouristAttractionWidget extends StatefulWidget {
  const TouristAttractionWidget({
    Key? key,
    required this.imageUrl,
    required this.location,
    required this.name,
    required this.locationString,
    required this.timezone,
  }) : super(key: key);

  final String? imageUrl;
  final String? location;
  final String? name;
  final String? locationString;
  final String? timezone;

  @override
  _TouristAttractionWidgetState createState() =>
      _TouristAttractionWidgetState();
}

class _TouristAttractionWidgetState extends State<TouristAttractionWidget> {
  late TouristAttractionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouristAttractionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              valueOrDefault<String>(
                widget.imageUrl,
                'https://blog.iprocess.com.br/wp-content/uploads/2021/11/placeholder.png',
              ),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name!.maybeHandleOverflow(
                          maxChars: 30,
                          replacement: '…',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.locationString!.maybeHandleOverflow(
                            maxChars: 30,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 4.0, 0.0),
                        child: Text(
                          widget.timezone!.maybeHandleOverflow(
                            maxChars: 30,
                            replacement: '…',
                          ),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
