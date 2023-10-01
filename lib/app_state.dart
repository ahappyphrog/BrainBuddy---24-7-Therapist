import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _activeChat;
  DocumentReference? get activeChat => _activeChat;
  set activeChat(DocumentReference? _value) {
    _activeChat = _value;
  }

  Color _sendButtonColor = Color(4278228735);
  Color get sendButtonColor => _sendButtonColor;
  set sendButtonColor(Color _value) {
    _sendButtonColor = _value;
  }

  String _sendHintText = 'Type a message';
  String get sendHintText => _sendHintText;
  set sendHintText(String _value) {
    _sendHintText = _value;
  }

  bool _isTextBoxUsable = true;
  bool get isTextBoxUsable => _isTextBoxUsable;
  set isTextBoxUsable(bool _value) {
    _isTextBoxUsable = _value;
  }

  bool _sendButtonUsable = true;
  bool get sendButtonUsable => _sendButtonUsable;
  set sendButtonUsable(bool _value) {
    _sendButtonUsable = _value;
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool _value) {
    _darkMode = _value;
    prefs.setBool('ff_darkMode', _value);
  }

  List<String> _chatMessages = [];
  List<String> get chatMessages => _chatMessages;
  set chatMessages(List<String> _value) {
    _chatMessages = _value;
  }

  void addToChatMessages(String _value) {
    _chatMessages.add(_value);
  }

  void removeFromChatMessages(String _value) {
    _chatMessages.remove(_value);
  }

  void removeAtIndexFromChatMessages(int _index) {
    _chatMessages.removeAt(_index);
  }

  void updateChatMessagesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _chatMessages[_index] = updateFn(_chatMessages[_index]);
  }

  void insertAtIndexInChatMessages(int _index, String _value) {
    _chatMessages.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
