import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_chat_listview_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://cdn.imgbin.com/18/7/14/imgbin-university-of-south-asia-student-tutor-course-lecturer-student-B85zQNkhssf8AEqwNtNMAQcvx.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Therapist',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 20.0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.0,
                        thickness: 1.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 16.0),
                          child: FutureBuilder<List<ChatRecord>>(
                            future: queryChatRecordOnce(
                              queryBuilder: (chatRecord) => chatRecord
                                  .where(
                                    'user_id',
                                    isEqualTo: currentUserReference,
                                  )
                                  .orderBy('ts', descending: true),
                              limit: 15,
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
                              List<ChatRecord> listViewChatRecordList =
                                  snapshot.data!;
                              if (listViewChatRecordList.isEmpty) {
                                return EmptyChatListviewWidget();
                              }
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                reverse: true,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewChatRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewChatRecord =
                                      listViewChatRecordList[listViewIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (listViewChatRecord.isBot == true)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24.0),
                                                    bottomRight:
                                                        Radius.circular(24.0),
                                                    topLeft:
                                                        Radius.circular(3.0),
                                                    topRight:
                                                        Radius.circular(24.0),
                                                  ),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      minWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.2,
                                                      maxWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.8,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFDCDBDB),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                24.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                24.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                3.0),
                                                        topRight:
                                                            Radius.circular(
                                                                24.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.00,
                                                                    0.00),
                                                            child: Text(
                                                              listViewChatRecord
                                                                  .message,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Source Sans Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor4,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.00, 0.00),
                                                  child: AutoSizeText(
                                                    dateTimeFormat('relative',
                                                        listViewChatRecord.ts!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      if (listViewChatRecord.isBot == false)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24.0),
                                                    bottomRight:
                                                        Radius.circular(24.0),
                                                    topLeft:
                                                        Radius.circular(24.0),
                                                    topRight:
                                                        Radius.circular(3.0),
                                                  ),
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      minWidth: 20.0,
                                                      maxWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.8,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                24.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                24.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                24.0),
                                                        topRight:
                                                            Radius.circular(
                                                                3.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.00,
                                                                    0.00),
                                                            child: Text(
                                                              listViewChatRecord
                                                                  .message,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Source Sans Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor4,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.00, 0.00),
                                                  child: AutoSizeText(
                                                    dateTimeFormat('relative',
                                                        listViewChatRecord.ts!),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Container(
                                width: 100.0,
                                height: 46.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(25.0),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 200.0,
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      autofocus: true,
                                                      readOnly: !FFAppState()
                                                          .isTextBoxUsable,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .sendHintText,
                                                          'Type a message',
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    4.0),
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 36.0,
                                        fillColor: valueOrDefault<Color>(
                                          FFAppState().sendButtonColor,
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                        icon: Icon(
                                          Icons.send_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          size: 20.0,
                                        ),
                                        showLoadingIndicator: true,
                                        onPressed: !FFAppState()
                                                .sendButtonUsable
                                            ? null
                                            : () async {
                                                if (_model.textController
                                                            .text !=
                                                        null &&
                                                    _model.textController
                                                            .text !=
                                                        '') {
                                                  await ChatRecord.collection
                                                      .doc()
                                                      .set(createChatRecordData(
                                                        ts: getCurrentTimestamp,
                                                        userId:
                                                            currentUserReference,
                                                        message: _model
                                                            .textController
                                                            .text,
                                                        isBot: false,
                                                      ));
                                                  setState(() {});
                                                  _model.apiResultre8 =
                                                      await GetResponseFromAiCall
                                                          .call(
                                                    message: _model
                                                        .textController.text,
                                                  );
                                                  if ((_model.apiResultre8
                                                          ?.succeeded ??
                                                      true)) {
                                                    var chatRecordReference2 =
                                                        ChatRecord.collection
                                                            .doc();
                                                    await chatRecordReference2
                                                        .set(
                                                            createChatRecordData(
                                                      ts: getCurrentTimestamp,
                                                      userId:
                                                          currentUserReference,
                                                      message:
                                                          GetResponseFromAiCall
                                                              .text(
                                                        (_model.apiResultre8
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString(),
                                                      isBot: true,
                                                    ));
                                                    _model.botDocument = ChatRecord
                                                        .getDocumentFromData(
                                                            createChatRecordData(
                                                              ts: getCurrentTimestamp,
                                                              userId:
                                                                  currentUserReference,
                                                              message:
                                                                  GetResponseFromAiCall
                                                                      .text(
                                                                (_model.apiResultre8
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString(),
                                                              isBot: true,
                                                            ),
                                                            chatRecordReference2);

                                                    await _model
                                                        .botDocument!.reference
                                                        .update(
                                                            createChatRecordData(
                                                      message: functions.trim(
                                                          GetResponseFromAiCall
                                                              .text(
                                                        (_model.apiResultre8
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString()),
                                                    ));
                                                    setState(() {
                                                      _model.textController
                                                          ?.clear();
                                                    });
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'error getting response${(_model.apiResultre8?.bodyText ?? '')}',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'text field can\'t be left empty',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 3000),
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                    ),
                                                  );
                                                }

                                                setState(() {});
                                              },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
