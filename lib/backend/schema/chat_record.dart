import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ts" field.
  DateTime? _ts;
  DateTime? get ts => _ts;
  bool hasTs() => _ts != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "is_bot" field.
  bool? _isBot;
  bool get isBot => _isBot ?? false;
  bool hasIsBot() => _isBot != null;

  void _initializeFields() {
    _ts = snapshotData['ts'] as DateTime?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _isBot = snapshotData['is_bot'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  DateTime? ts,
  DocumentReference? userId,
  String? message,
  bool? isBot,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ts': ts,
      'user_id': userId,
      'message': message,
      'is_bot': isBot,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    return e1?.ts == e2?.ts &&
        e1?.userId == e2?.userId &&
        e1?.message == e2?.message &&
        e1?.isBot == e2?.isBot;
  }

  @override
  int hash(ChatRecord? e) =>
      const ListEquality().hash([e?.ts, e?.userId, e?.message, e?.isBot]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
