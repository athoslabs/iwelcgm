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


/** This is an auto generated class representing the ExerciseEvent type in your schema. */
@immutable
class ExerciseEvent extends Model {
  static const classType = const _ExerciseEventModelType();
  final String id;
  final String? _userId;
  final String? _intensity;
  final String? _duration;
  final String? _description;

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
  
  String get intensity {
    try {
      return _intensity!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get duration {
    try {
      return _duration!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const ExerciseEvent._internal({required this.id, required userId, required intensity, required duration, required description}): _userId = userId, _intensity = intensity, _duration = duration, _description = description;
  
  factory ExerciseEvent({String? id, required String userId, required String intensity, required String duration, required String description}) {
    return ExerciseEvent._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      intensity: intensity,
      duration: duration,
      description: description);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExerciseEvent &&
      id == other.id &&
      _userId == other._userId &&
      _intensity == other._intensity &&
      _duration == other._duration &&
      _description == other._description;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ExerciseEvent {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("intensity=" + "$_intensity" + ", ");
    buffer.write("duration=" + "$_duration" + ", ");
    buffer.write("description=" + "$_description");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ExerciseEvent copyWith({String? id, String? userId, String? intensity, String? duration, String? description}) {
    return ExerciseEvent(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      intensity: intensity ?? this.intensity,
      duration: duration ?? this.duration,
      description: description ?? this.description);
  }
  
  ExerciseEvent.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _intensity = json['intensity'],
      _duration = json['duration'],
      _description = json['description'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'intensity': _intensity, 'duration': _duration, 'description': _description
  };

  static final QueryField ID = QueryField(fieldName: "exerciseEvent.id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField INTENSITY = QueryField(fieldName: "intensity");
  static final QueryField DURATION = QueryField(fieldName: "duration");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ExerciseEvent";
    modelSchemaDefinition.pluralName = "ExerciseEvents";
    
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
      key: ExerciseEvent.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExerciseEvent.INTENSITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExerciseEvent.DURATION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExerciseEvent.DESCRIPTION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ExerciseEventModelType extends ModelType<ExerciseEvent> {
  const _ExerciseEventModelType();
  
  @override
  ExerciseEvent fromJson(Map<String, dynamic> jsonData) {
    return ExerciseEvent.fromJson(jsonData);
  }
}