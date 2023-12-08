import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'review_model.dart';
export 'review_model.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({
    Key? key,
    this.title,
    String? rating,
    this.description,
    String? author,
    this.date,
  })  : this.rating = rating ?? '0',
        this.author = author ?? 'Anonymus User',
        super(key: key);

  final String? title;
  final String rating;
  final String? description;
  final String author;
  final int? date;

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  late ReviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Text(
                  widget.title!.maybeHandleOverflow(maxChars: 47),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.00, 0.00),
                child: Text(
                  dateTimeFormat(
                    'relative',
                    dateTimeFromSecondsSinceEpoch(widget.date!),
                    locale: FFLocalizations.of(context).languageShortCode ??
                        FFLocalizations.of(context).languageCode,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: Text(
                    widget.description!.maybeHandleOverflow(maxChars: 200),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.rating,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 16.0,
                        ),
                      ]
                          .divide(SizedBox(width: 2.0))
                          .around(SizedBox(width: 2.0)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.author,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
