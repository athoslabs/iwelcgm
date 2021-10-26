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


/** This is an auto generated class representing the DeviceReading type in your schema. */
@immutable
class DeviceReading extends Model {
  static const classType = const _DeviceReadingModelType();
  final String id;
  final String? _userId;
  final int? _glucoseNumber;
  final TemporalTimestamp? _timeTaken;
  final String? _deviceId;

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
  
  int get glucoseNumber {
    try {
      return _glucoseNumber!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  TemporalTimestamp get timeTaken {
    try {
      return _timeTaken!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get deviceId {
    try {
      return _deviceId!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const DeviceReading._internal({required this.id, required userId, required glucoseNumber, required timeTaken, required deviceId}): _userId = userId, _glucoseNumber = glucoseNumber, _timeTaken = timeTaken, _deviceId = deviceId;
  
  factory DeviceReading({String? id, required String userId, required int glucoseNumber, required TemporalTimestamp timeTaken, required String deviceId}) {
    return DeviceReading._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      glucoseNumber: glucoseNumber,
      timeTaken: timeTaken,
      deviceId: deviceId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceReading &&
      id == other.id &&
      _userId == other._userId &&
      _glucoseNumber == other._glucoseNumber &&
      _timeTaken == other._timeTaken &&
      _deviceId == other._deviceId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DeviceReading {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("glucoseNumber=" + (_glucoseNumber != null ? _glucoseNumber!.toString() : "null") + ", ");
    buffer.write("timeTaken=" + (_timeTaken != null ? _timeTaken!.toString() : "null") + ", ");
    buffer.write("deviceId=" + "$_deviceId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DeviceReading copyWith({String? id, String? userId, int? glucoseNumber, TemporalTimestamp? timeTaken, String? deviceId}) {
    return DeviceReading(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      glucoseNumber: glucoseNumber ?? this.glucoseNumber,
      timeTaken: timeTaken ?? this.timeTaken,
      deviceId: deviceId ?? this.deviceId);
  }
  
  DeviceReading.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _glucoseNumber = (json['glucoseNumber'] as num?)?.toInt(),
      _timeTaken = json['timeTaken'] != null ? TemporalTimestamp.fromSeconds(json['timeTaken']) : null,
      _deviceId = json['deviceId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'glucoseNumber': _glucoseNumber, 'timeTaken': _timeTaken?.toSeconds(), 'deviceId': _deviceId
  };

  static final QueryField ID = QueryField(fieldName: "deviceReading.id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField GLUCOSENUMBER = QueryField(fieldName: "glucoseNumber");
  static final QueryField TIMETAKEN = QueryField(fieldName: "timeTaken");
  static final QueryField DEVICEID = QueryField(fieldName: "deviceId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DeviceReading";
    modelSchemaDefinition.pluralName = "DeviceReadings";
    
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
      key: DeviceReading.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DeviceReading.GLUCOSENUMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DeviceReading.TIMETAKEN,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DeviceReading.DEVICEID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _DeviceReadingModelType extends ModelType<DeviceReading> {
  const _DeviceReadingModelType();
  
  @override
  DeviceReading fromJson(Map<String, dynamic> jsonData) {
    return DeviceReading.fromJson(jsonData);
  }
}