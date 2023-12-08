import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/not_found/not_found_widget.dart';
import '/widgets/tourist_attraction/tourist_attraction_widget.dart';
import '/widgets/user_header/user_header_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tourist_attractions_page_model.dart';
export 'tourist_attractions_page_model.dart';

class TouristAttractionsPageWidget extends StatefulWidget {
  const TouristAttractionsPageWidget({Key? key}) : super(key: key);

  @override
  _TouristAttractionsPageWidgetState createState() =>
      _TouristAttractionsPageWidgetState();
}

class _TouristAttractionsPageWidgetState
    extends State<TouristAttractionsPageWidget> {
  late TouristAttractionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouristAttractionsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TouristAttractionsPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TOURIST_ATTRACTIONS_TouristAttractionsPa');
      logFirebaseEvent('TouristAttractionsPage_backend_call');
      _model.typeaheadPageLoadResponse =
          await TouristAttractionAPIGroup.typeaheadCall.call(
        query: 'las',
      );
      if ((_model.typeaheadPageLoadResponse?.succeeded ?? true)) {
        logFirebaseEvent('TouristAttractionsPage_update_page_state');
        setState(() {
          _model.touristPoints = TouristAttractionAPIGroup.typeaheadCall
              .resultObject(
                (_model.typeaheadPageLoadResponse?.jsonBody ?? ''),
              )!
              .toList()
              .cast<dynamic>();
        });
      } else {
        logFirebaseEvent('TouristAttractionsPage_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Something went wrong'),
              content:
                  Text('We couldn\'t find any tourist attractions for you.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    _model.searchFieldController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => wrapWithModel(
                      model: _model.userHeaderModel,
                      updateCallback: () => setState(() {}),
                      child: UserHeaderWidget(
                        name: currentUserDisplayName,
                        imageUrl: currentUserPhoto,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 6.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.search,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 22.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.searchFieldController,
                                        focusNode: _model.searchFieldFocusNode,
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'TOURIST_ATTRACTIONS_SearchField_ON_TEXTF');
                                          var _shouldSetState = false;
                                          logFirebaseEvent(
                                              'SearchField_backend_call');
                                          _model.searchTouristAttractionsResponse =
                                              await TouristAttractionAPIGroup
                                                  .typeaheadCall
                                                  .call(
                                            query: _model
                                                .searchFieldController.text,
                                          );
                                          _shouldSetState = true;
                                          if ((_model
                                                  .searchTouristAttractionsResponse
                                                  ?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'SearchField_update_page_state');
                                            setState(() {
                                              _model.touristPoints =
                                                  TouristAttractionAPIGroup
                                                      .typeaheadCall
                                                      .resultObject(
                                                        (_model.searchTouristAttractionsResponse
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                      .toList()
                                                      .cast<dynamic>();
                                            });
                                          } else {
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'xo0q40bn' /* Search tourist points... */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        validator: _model
                                            .searchFieldControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z]'))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.search_sharp,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'TOURIST_ATTRACTIONS_SearchButton_ON_TAP');
                            var _shouldSetState = false;
                            logFirebaseEvent('SearchButton_backend_call');
                            _model.searchButtonTouristAttractionsResponse =
                                await TouristAttractionAPIGroup.typeaheadCall
                                    .call(
                              query: _model.searchFieldController.text,
                            );
                            _shouldSetState = true;
                            if ((_model.searchButtonTouristAttractionsResponse
                                    ?.succeeded ??
                                true)) {
                              logFirebaseEvent(
                                  'SearchButton_update_page_state');
                              setState(() {
                                _model.touristPoints =
                                    TouristAttractionAPIGroup.typeaheadCall
                                        .resultObject(
                                          (_model.searchButtonTouristAttractionsResponse
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                        .toList()
                                        .cast<dynamic>();
                              });
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 4.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'gicrqril' /* Tourist Points */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final touristPointsList = _model.touristPoints.toList();
                        if (touristPointsList.isEmpty) {
                          return Center(
                            child: NotFoundWidget(
                              title: FFLocalizations.of(context).getText(
                                'n1canlv2' /* No tourist attractions found. */,
                              ),
                              subtitle: FFLocalizations.of(context).getText(
                                '7b1e17ez' /* No tourist attractions match y... */,
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: touristPointsList.length,
                          itemBuilder: (context, touristPointsListIndex) {
                            final touristPointsListItem =
                                touristPointsList[touristPointsListIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'TOURIST_ATTRACTIONS_Container_15lmop5i_O');
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(
                                  'TouristAttractionDetailsPage',
                                  queryParameters: {
                                    'title': serializeParam(
                                      getJsonField(
                                        touristPointsListItem,
                                        r'''$.name''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'timezone': serializeParam(
                                      getJsonField(
                                        touristPointsListItem,
                                        r'''$.timezone''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'imageUrl': serializeParam(
                                      getJsonField(
                                        touristPointsListItem,
                                        r'''$.photo.images.medium.url''',
                                      ),
                                      ParamType.String,
                                    ),
                                    'location': serializeParam(
                                      functions.formatLocation(
                                          getJsonField(
                                            touristPointsListItem,
                                            r'''$.latitude''',
                                          ).toString(),
                                          getJsonField(
                                            touristPointsListItem,
                                            r'''$.longitude''',
                                          ).toString()),
                                      ParamType.LatLng,
                                    ),
                                    'locationId': serializeParam(
                                      getJsonField(
                                        touristPointsListItem,
                                        r'''$.location_id''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                    'description': serializeParam(
                                      getJsonField(
                                        touristPointsListItem,
                                        r'''$.description''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                height: 200.0,
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model:
                                      _model.touristAttractionModels.getModel(
                                    getJsonField(
                                      touristPointsListItem,
                                      r'''$.location_id''',
                                    ).toString(),
                                    touristPointsListIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: Hero(
                                    tag: getJsonField(
                                      touristPointsListItem,
                                      r'''$.location_id''',
                                    ).toString(),
                                    transitionOnUserGestures: true,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: TouristAttractionWidget(
                                        key: Key(
                                          'Keyn0v_${getJsonField(
                                            touristPointsListItem,
                                            r'''$.location_id''',
                                          ).toString()}',
                                        ),
                                        imageUrl: getJsonField(
                                          touristPointsListItem,
                                          r'''$.photo.images.small.url''',
                                        ),
                                        location: getJsonField(
                                          touristPointsListItem,
                                          r'''$.location''',
                                        ).toString(),
                                        name: getJsonField(
                                          touristPointsListItem,
                                          r'''$.name''',
                                        ).toString(),
                                        timezone: getJsonField(
                                          touristPointsListItem,
                                          r'''$.timezone''',
                                        ).toString(),
                                        locationString: getJsonField(
                                          touristPointsListItem,
                                          r'''$.location_string''',
                                        ).toString(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
