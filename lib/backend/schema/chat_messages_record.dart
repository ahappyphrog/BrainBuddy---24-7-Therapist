import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_user" field.
  bool? _isUser;
  bool get isUser => _isUser ?? false;
  bool hasIsUser() => _isUser != null;

  void _initializeFields() {
    _chat = snapshotData['chat'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isUser = snapshotData['is_user'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_messages');

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  DocumentReference? chat,
  String? text,
  DateTime? timestamp,
  bool? isUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat': chat,
      'text': text,
      'timestamp': timestamp,
      'is_user': isUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    return e1?.chat == e2?.chat &&
        e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isUser == e2?.isUser;
  }

  @override
  int hash(ChatMessagesRecord? e) =>
      const ListEquality().hash([e?.chat, e?.text, e?.timestamp, e?.isUser]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
