import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_chat_listview_model.dart';
export 'empty_chat_listview_model.dart';

class EmptyChatListviewWidget extends StatefulWidget {
  const EmptyChatListviewWidget({Key? key}) : super(key: key);

  @override
  _EmptyChatListviewWidgetState createState() =>
      _EmptyChatListviewWidgetState();
}

class _EmptyChatListviewWidgetState extends State<EmptyChatListviewWidget> {
  late EmptyChatListviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyChatListviewModel());

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Text(
        'Get started chatting with your personal therapist!',
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyLarge,
      ),
    );
  }
}
