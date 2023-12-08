import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/not_found/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tourist_attraction_reviews_page_model.dart';
export 'tourist_attraction_reviews_page_model.dart';

class TouristAttractionReviewsPageWidget extends StatefulWidget {
  const TouristAttractionReviewsPageWidget({
    Key? key,
    required this.locationId,
  }) : super(key: key);

  final String? locationId;

  @override
  _TouristAttractionReviewsPageWidgetState createState() =>
      _TouristAttractionReviewsPageWidgetState();
}

class _TouristAttractionReviewsPageWidgetState
    extends State<TouristAttractionReviewsPageWidget> {
  late TouristAttractionReviewsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouristAttractionReviewsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TouristAttractionReviewsPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: _model.locationQuery(
        uniqueQueryKey: widget.locationId,
        requestFn: () => TouristAttractionAPIGroup.reviewsCall.call(
          locationId: widget.locationId,
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
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final touristAttractionReviewsPageReviewsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 30.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('TOURIST_ATTRACTION_REVIEWS_arrow_back_ro');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'vlgd9ozo' /* Reviews */,
                ),
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(14.0, 8.0, 14.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final reviewList = (TouristAttractionAPIGroup.reviewsCall
                                .reviews(
                                  touristAttractionReviewsPageReviewsResponse
                                      .jsonBody,
                                )
                                ?.toList() ??
                            [])
                        .take(20)
                        .toList();
                    if (reviewList.isEmpty) {
                      return Center(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: NotFoundWidget(
                            title: FFLocalizations.of(context).getText(
                              'q50vceb7' /* Not found */,
                            ),
                            subtitle: FFLocalizations.of(context).getText(
                              'rzm1xfgk' /* We couldn't find any reviews f... */,
                            ),
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: reviewList.length,
                      itemBuilder: (context, reviewListIndex) {
                        final reviewListItem = reviewList[reviewListIndex];
                        return Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Text(
                                      valueOrDefault<String>(
                                        getJsonField(
                                          reviewListItem,
                                          r'''$.title''',
                                        ).toString(),
                                        'Title',
                                      ).maybeHandleOverflow(maxChars: 47),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.00, 0.00),
                                    child: Text(
                                      getJsonField(
                                        reviewListItem,
                                        r'''$.published_date''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: Text(
                                        getJsonField(
                                          reviewListItem,
                                          r'''$.text''',
                                        )
                                            .toString()
                                            .maybeHandleOverflow(maxChars: 200),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              getJsonField(
                                                reviewListItem,
                                                r'''$.rating''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.solidStar,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 16.0,
                                            ),
                                          ]
                                              .divide(SizedBox(width: 2.0))
                                              .around(SizedBox(width: 2.0)),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                reviewListItem,
                                                r'''$.user.name''',
                                              ).toString(),
                                              'Annonymus user',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
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
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
