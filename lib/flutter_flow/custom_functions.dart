import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? convertToReadableTime(String? currentTime) {
  if (currentTime == null) {
    return null;
  }

  DateTime parsedTime = DateTime.parse(currentTime);

  String month = parsedTime.month.toString();
  String day = parsedTime.day.toString();
  String year = parsedTime.year.toString().substring(2);

  String hour = parsedTime.hour.toString();
  String minute = parsedTime.minute.toString().padLeft(2, '0');

  String amPm = parsedTime.hour >= 12 ? 'PM' : 'AM';
  if (parsedTime.hour > 12) {
    hour = (parsedTime.hour - 12).toString();
  }
  if (hour == '0') {
    hour = '12';
  }

  return '$month/$day/$year $hour:$minute $amPm';
}

String? trim(String? text) {
  if (text == null) return null;
  return text.trim();
}
