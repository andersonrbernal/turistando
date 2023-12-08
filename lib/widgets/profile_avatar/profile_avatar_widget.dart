import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_avatar_model.dart';
export 'profile_avatar_model.dart';

class ProfileAvatarWidget extends StatefulWidget {
  const ProfileAvatarWidget({
    Key? key,
    this.name,
    this.email,
    required this.image,
  }) : super(key: key);

  final String? name;
  final String? email;
  final String? image;

  @override
  _ProfileAvatarWidgetState createState() => _ProfileAvatarWidgetState();
}

class _ProfileAvatarWidgetState extends State<ProfileAvatarWidget> {
  late ProfileAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileAvatarModel());

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
        Container(
          width: 120.0,
          height: 120.0,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            valueOrDefault<String>(
              widget.image,
              'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
            ),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/error_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          widget.email!,
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xCCFFFFFF),
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 12.0),
          child: Text(
            widget.name!,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
