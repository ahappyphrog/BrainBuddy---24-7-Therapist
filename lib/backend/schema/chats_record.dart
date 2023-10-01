import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "last_message_sent_by_user" field.
  bool? _lastMessageSentByUser;
  bool get lastMessageSentByUser => _lastMessageSentByUser ?? false;
  bool hasLastMessageSentByUser() => _lastMessageSentByUser != null;

  // "personality" field.
  String? _personality;
  String get personality => _personality ?? '';
  bool hasPersonality() => _personality != null;

  // "last_messag_seen" field.
  bool? _lastMessagSeen;
  bool get lastMessagSeen => _lastMessagSeen ?? false;
  bool hasLastMessagSeen() => _lastMessagSeen != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "generating_response" field.
  bool? _generatingResponse;
  bool get generatingResponse => _generatingResponse ?? false;
  bool hasGeneratingResponse() => _generatingResponse != null;

  void _initializeFields() {
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _lastMessageSentByUser = snapshotData['last_message_sent_by_user'] as bool?;
    _personality = snapshotData['personality'] as String?;
    _lastMessagSeen = snapshotData['last_messag_seen'] as bool?;
    _uid = snapshotData['uid'] as String?;
    _generatingResponse = snapshotData['generating_response'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  bool? lastMessageSentByUser,
  String? personality,
  bool? lastMessagSeen,
  String? uid,
  bool? generatingResponse,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'last_message_sent_by_user': lastMessageSentByUser,
      'personality': personality,
      'last_messag_seen': lastMessagSeen,
      'uid': uid,
      'generating_response': generatingResponse,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    return e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.lastMessageSentByUser == e2?.lastMessageSentByUser &&
        e1?.personality == e2?.personality &&
        e1?.lastMessagSeen == e2?.lastMessagSeen &&
        e1?.uid == e2?.uid &&
        e1?.generatingResponse == e2?.generatingResponse;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.lastMessage,
        e?.lastMessageTime,
        e?.lastMessageSentByUser,
        e?.personality,
        e?.lastMessagSeen,
        e?.uid,
        e?.generatingResponse
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
