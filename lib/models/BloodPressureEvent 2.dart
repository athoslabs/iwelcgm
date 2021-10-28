/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the BloodPressureEvent type in your schema. */
@immutable
class BloodPressureEvent extends Model {
  static const classType = const _BloodPressureEventModelType();
  final String id;
  final String? _userId;
  final String? _topNumber;
  final String? _bottomNumber;
  final String? _date;
  final String? _time;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get topNumber {
    try {
      return _topNumber!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get bottomNumber {
    try {
      return _bottomNumber!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get date {
    try {
      return _date!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get time {
    try {
      return _time!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const BloodPressureEvent._internal({required this.id, required userId, required topNumber, required bottomNumber, required date, required time}): _userId = userId, _topNumber = topNumber, _bottomNumber = bottomNumber, _date = date, _time = time;
  
  factory BloodPressureEvent({String? id, required String userId, required String topNumber, required String bottomNumber, required String date, required String time}) {
    return BloodPressureEvent._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      topNumber: topNumber,
      bottomNumber: bottomNumber,
      date: date,
      time: time);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BloodPressureEvent &&
      id == other.id &&
      _userId == other._userId &&
      _topNumber == other._topNumber &&
      _bottomNumber == other._bottomNumber &&
      _date == other._date &&
      _time == other._time;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("BloodPressureEvent {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("topNumber=" + "$_topNumber" + ", ");
    buffer.write("bottomNumber=" + "$_bottomNumber" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("time=" + "$_time");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  BloodPressureEvent copyWith({String? id, String? userId, String? topNumber, String? bottomNumber, String? date, String? time}) {
    return BloodPressureEvent(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      topNumber: topNumber ?? this.topNumber,
      bottomNumber: bottomNumber ?? this.bottomNumber,
      date: date ?? this.date,
      time: time ?? this.time);
  }
  
  BloodPressureEvent.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _topNumber = json['topNumber'],
      _bottomNumber = json['bottomNumber'],
      _date = json['date'],
      _time = json['time'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'topNumber': _topNumber, 'bottomNumber': _bottomNumber, 'date': _date, 'time': _time
  };

  static final QueryField ID = QueryField(fieldName: "bloodPressureEvent.id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField TOPNUMBER = QueryField(fieldName: "topNumber");
  static final QueryField BOTTOMNUMBER = QueryField(fieldName: "bottomNumber");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField TIME = QueryField(fieldName: "time");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BloodPressureEvent";
    modelSchemaDefinition.pluralName = "BloodPressureEvents";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: BloodPressureEvent.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: BloodPressureEvent.TOPNUMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: BloodPressureEvent.BOTTOMNUMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: BloodPressureEvent.DATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: BloodPressureEvent.TIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _BloodPressureEventModelType extends ModelType<BloodPressureEvent> {
  const _BloodPressureEventModelType();
  
  @override
  BloodPressureEvent fromJson(Map<String, dynamic> jsonData) {
    return BloodPressureEvent.fromJson(jsonData);
  }
}