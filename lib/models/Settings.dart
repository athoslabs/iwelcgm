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


/** This is an auto generated class representing the Settings type in your schema. */
@immutable
class Settings extends Model {
  static const classType = const _SettingsModelType();
  final String id;
  final String? _userId;
  final int? _highAlert;
  final int? _highAction;
  final int? _lowAlert;
  final int? _lowAction;
  final bool? _signalLoss;
  final bool? _noReadings;

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
  
  int? get highAlert {
    return _highAlert;
  }
  
  int? get highAction {
    return _highAction;
  }
  
  int? get lowAlert {
    return _lowAlert;
  }
  
  int? get lowAction {
    return _lowAction;
  }
  
  bool? get signalLoss {
    return _signalLoss;
  }
  
  bool? get noReadings {
    return _noReadings;
  }
  
  const Settings._internal({required this.id, required userId, highAlert, highAction, lowAlert, lowAction, signalLoss, noReadings}): _userId = userId, _highAlert = highAlert, _highAction = highAction, _lowAlert = lowAlert, _lowAction = lowAction, _signalLoss = signalLoss, _noReadings = noReadings;
  
  factory Settings({String? id, required String userId, int? highAlert, int? highAction, int? lowAlert, int? lowAction, bool? signalLoss, bool? noReadings}) {
    return Settings._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      highAlert: highAlert,
      highAction: highAction,
      lowAlert: lowAlert,
      lowAction: lowAction,
      signalLoss: signalLoss,
      noReadings: noReadings);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Settings &&
      id == other.id &&
      _userId == other._userId &&
      _highAlert == other._highAlert &&
      _highAction == other._highAction &&
      _lowAlert == other._lowAlert &&
      _lowAction == other._lowAction &&
      _signalLoss == other._signalLoss &&
      _noReadings == other._noReadings;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Settings {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("highAlert=" + (_highAlert != null ? _highAlert!.toString() : "null") + ", ");
    buffer.write("highAction=" + (_highAction != null ? _highAction!.toString() : "null") + ", ");
    buffer.write("lowAlert=" + (_lowAlert != null ? _lowAlert!.toString() : "null") + ", ");
    buffer.write("lowAction=" + (_lowAction != null ? _lowAction!.toString() : "null") + ", ");
    buffer.write("signalLoss=" + (_signalLoss != null ? _signalLoss!.toString() : "null") + ", ");
    buffer.write("noReadings=" + (_noReadings != null ? _noReadings!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Settings copyWith({String? id, String? userId, int? highAlert, int? highAction, int? lowAlert, int? lowAction, bool? signalLoss, bool? noReadings}) {
    return Settings(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      highAlert: highAlert ?? this.highAlert,
      highAction: highAction ?? this.highAction,
      lowAlert: lowAlert ?? this.lowAlert,
      lowAction: lowAction ?? this.lowAction,
      signalLoss: signalLoss ?? this.signalLoss,
      noReadings: noReadings ?? this.noReadings);
  }
  
  Settings.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _highAlert = (json['highAlert'] as num?)?.toInt(),
      _highAction = (json['highAction'] as num?)?.toInt(),
      _lowAlert = (json['lowAlert'] as num?)?.toInt(),
      _lowAction = (json['lowAction'] as num?)?.toInt(),
      _signalLoss = json['signalLoss'],
      _noReadings = json['noReadings'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'highAlert': _highAlert, 'highAction': _highAction, 'lowAlert': _lowAlert, 'lowAction': _lowAction, 'signalLoss': _signalLoss, 'noReadings': _noReadings
  };

  static final QueryField ID = QueryField(fieldName: "settings.id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField HIGHALERT = QueryField(fieldName: "highAlert");
  static final QueryField HIGHACTION = QueryField(fieldName: "highAction");
  static final QueryField LOWALERT = QueryField(fieldName: "lowAlert");
  static final QueryField LOWACTION = QueryField(fieldName: "lowAction");
  static final QueryField SIGNALLOSS = QueryField(fieldName: "signalLoss");
  static final QueryField NOREADINGS = QueryField(fieldName: "noReadings");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Settings";
    modelSchemaDefinition.pluralName = "Settings";
    
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
      key: Settings.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Settings.HIGHALERT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Settings.HIGHACTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Settings.LOWALERT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Settings.LOWACTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Settings.SIGNALLOSS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Settings.NOREADINGS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}

class _SettingsModelType extends ModelType<Settings> {
  const _SettingsModelType();
  
  @override
  Settings fromJson(Map<String, dynamic> jsonData) {
    return Settings.fromJson(jsonData);
  }
}