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


/** This is an auto generated class representing the LongActingInsEvent type in your schema. */
@immutable
class LongActingInsEvent extends Model {
  static const classType = const _LongActingInsEventModelType();
  final String id;
  final String? _userId;
  final String? _insulinValue;
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
  
  String get insulinValue {
    try {
      return _insulinValue!;
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
  
  const LongActingInsEvent._internal({required this.id, required userId, required insulinValue, required date, required time}): _userId = userId, _insulinValue = insulinValue, _date = date, _time = time;
  
  factory LongActingInsEvent({String? id, required String userId, required String insulinValue, required String date, required String time}) {
    return LongActingInsEvent._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      insulinValue: insulinValue,
      date: date,
      time: time);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LongActingInsEvent &&
      id == other.id &&
      _userId == other._userId &&
      _insulinValue == other._insulinValue &&
      _date == other._date &&
      _time == other._time;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LongActingInsEvent {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("insulinValue=" + "$_insulinValue" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("time=" + "$_time");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LongActingInsEvent copyWith({String? id, String? userId, String? insulinValue, String? date, String? time}) {
    return LongActingInsEvent(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      insulinValue: insulinValue ?? this.insulinValue,
      date: date ?? this.date,
      time: time ?? this.time);
  }
  
  LongActingInsEvent.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _insulinValue = json['insulinValue'],
      _date = json['date'],
      _time = json['time'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'insulinValue': _insulinValue, 'date': _date, 'time': _time
  };

  static final QueryField ID = QueryField(fieldName: "longActingInsEvent.id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField INSULINVALUE = QueryField(fieldName: "insulinValue");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField TIME = QueryField(fieldName: "time");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LongActingInsEvent";
    modelSchemaDefinition.pluralName = "LongActingInsEvents";
    
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
      key: LongActingInsEvent.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LongActingInsEvent.INSULINVALUE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LongActingInsEvent.DATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: LongActingInsEvent.TIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _LongActingInsEventModelType extends ModelType<LongActingInsEvent> {
  const _LongActingInsEventModelType();
  
  @override
  LongActingInsEvent fromJson(Map<String, dynamic> jsonData) {
    return LongActingInsEvent.fromJson(jsonData);
  }
}