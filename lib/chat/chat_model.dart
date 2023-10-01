import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_chat_listview_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_widget.dart' show ChatWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  List<String> userPrompt = [];
  void addToUserPrompt(String item) => userPrompt.add(item);
  void removeFromUserPrompt(String item) => userPrompt.remove(item);
  void removeAtIndexFromUserPrompt(int index) => userPrompt.removeAt(index);
  void insertAtIndexInUserPrompt(int index, String item) =>
      userPrompt.insert(index, item);
  void updateUserPromptAtIndex(int index, Function(String) updateFn) =>
      userPrompt[index] = updateFn(userPrompt[index]);

  List<String> gptResponse = [];
  void addToGptResponse(String item) => gptResponse.add(item);
  void removeFromGptResponse(String item) => gptResponse.remove(item);
  void removeAtIndexFromGptResponse(int index) => gptResponse.removeAt(index);
  void insertAtIndexInGptResponse(int index, String item) =>
      gptResponse.insert(index, item);
  void updateGptResponseAtIndex(int index, Function(String) updateFn) =>
      gptResponse[index] = updateFn(gptResponse[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getResponseFromAi)] action in IconButton widget.
  ApiCallResponse? apiResultre8;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatRecord? botDocument;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
