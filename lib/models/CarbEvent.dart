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


/** This is an auto generated class representing the CarbEvent type in your schema. */
@immutable
class CarbEvent extends Model {
  static const classType = const _CarbEventModelType();
  final String id;
  final String? _userId;
  final String? _carbAmount;
  final String? _carbDescription;
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
  
  String get carbAmount {
    try {
      return _carbAmount!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get carbDescription {
    try {
      return _carbDescription!;
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
  
  const CarbEvent._internal({required this.id, required userId, required carbAmount, required carbDescription, required date, required time}): _userId = userId, _carbAmount = carbAmount, _carbDescription = carbDescription, _date = date, _time = time;
  
  factory CarbEvent({String? id, required String userId, required String carbAmount, required String carbDescription, required String date, required String time}) {
    return CarbEvent._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      carbAmount: carbAmount,
      carbDescription: carbDescription,
      date: date,
      time: time);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CarbEvent &&
      id == other.id &&
      _userId == other._userId &&
      _carbAmount == other._carbAmount &&
      _carbDescription == other._carbDescription &&
      _date == other._date &&
      _time == other._time;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CarbEvent {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("carbAmount=" + "$_carbAmount" + ", ");
    buffer.write("carbDescription=" + "$_carbDescription" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("time=" + "$_time");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CarbEvent copyWith({String? id, String? userId, String? carbAmount, String? carbDescription, String? date, String? time}) {
    return CarbEvent(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      carbAmount: carbAmount ?? this.carbAmount,
      carbDescription: carbDescription ?? this.carbDescription,
      date: date ?? this.date,
      time: time ?? this.time);
  }
  
  CarbEvent.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _carbAmount = json['carbAmount'],
      _carbDescription = json['carbDescription'],
      _date = json['date'],
      _time = json['time'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'carbAmount': _carbAmount, 'carbDescription': _carbDescription, 'date': _date, 'time': _time
  };

  static final QueryField ID = QueryField(fieldName: "carbEvent.id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField CARBAMOUNT = QueryField(fieldName: "carbAmount");
  static final QueryField CARBDESCRIPTION = QueryField(fieldName: "carbDescription");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField TIME = QueryField(fieldName: "time");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CarbEvent";
    modelSchemaDefinition.pluralName = "CarbEvents";
    
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
      key: CarbEvent.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CarbEvent.CARBAMOUNT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CarbEvent.CARBDESCRIPTION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CarbEvent.DATE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CarbEvent.TIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _CarbEventModelType extends ModelType<CarbEvent> {
  const _CarbEventModelType();
  
  @override
  CarbEvent fromJson(Map<String, dynamic> jsonData) {
    return CarbEvent.fromJson(jsonData);
  }
}