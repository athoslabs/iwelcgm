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


/** This is an auto generated class representing the UserInfo type in your schema. */
@immutable
class UserInfo extends Model {
  static const classType = const _UserInfoModelType();
  final String id;
  final String? _userId;
  final String? _phoneNumber;
  final String? _dateOfBirth;
  final String? _gender;
  final String? _height;
  final String? _weight;
  final String? _diabetesType;
  final String? _yearDiagnosed;
  final String? _diabetesHistory;
  final String? _paceOfLife;
  final String? _habits;

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
  
  String? get phoneNumber {
    return _phoneNumber;
  }
  
  String? get dateOfBirth {
    return _dateOfBirth;
  }
  
  String? get gender {
    return _gender;
  }
  
  String? get height {
    return _height;
  }
  
  String? get weight {
    return _weight;
  }
  
  String? get diabetesType {
    return _diabetesType;
  }
  
  String? get yearDiagnosed {
    return _yearDiagnosed;
  }
  
  String? get diabetesHistory {
    return _diabetesHistory;
  }
  
  String? get paceOfLife {
    return _paceOfLife;
  }
  
  String? get habits {
    return _habits;
  }
  
  const UserInfo._internal({required this.id, required userId, phoneNumber, dateOfBirth, gender, height, weight, diabetesType, yearDiagnosed, diabetesHistory, paceOfLife, habits}): _userId = userId, _phoneNumber = phoneNumber, _dateOfBirth = dateOfBirth, _gender = gender, _height = height, _weight = weight, _diabetesType = diabetesType, _yearDiagnosed = yearDiagnosed, _diabetesHistory = diabetesHistory, _paceOfLife = paceOfLife, _habits = habits;
  
  factory UserInfo({String? id, required String userId, String? phoneNumber, String? dateOfBirth, String? gender, String? height, String? weight, String? diabetesType, String? yearDiagnosed, String? diabetesHistory, String? paceOfLife, String? habits}) {
    return UserInfo._internal(
      id: id == null ? UUID.getUUID() : id,
      userId: userId,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      gender: gender,
      height: height,
      weight: weight,
      diabetesType: diabetesType,
      yearDiagnosed: yearDiagnosed,
      diabetesHistory: diabetesHistory,
      paceOfLife: paceOfLife,
      habits: habits);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserInfo &&
      id == other.id &&
      _userId == other._userId &&
      _phoneNumber == other._phoneNumber &&
      _dateOfBirth == other._dateOfBirth &&
      _gender == other._gender &&
      _height == other._height &&
      _weight == other._weight &&
      _diabetesType == other._diabetesType &&
      _yearDiagnosed == other._yearDiagnosed &&
      _diabetesHistory == other._diabetesHistory &&
      _paceOfLife == other._paceOfLife &&
      _habits == other._habits;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserInfo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("dateOfBirth=" + "$_dateOfBirth" + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("height=" + "$_height" + ", ");
    buffer.write("weight=" + "$_weight" + ", ");
    buffer.write("diabetesType=" + "$_diabetesType" + ", ");
    buffer.write("yearDiagnosed=" + "$_yearDiagnosed" + ", ");
    buffer.write("diabetesHistory=" + "$_diabetesHistory" + ", ");
    buffer.write("paceOfLife=" + "$_paceOfLife" + ", ");
    buffer.write("habits=" + "$_habits");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserInfo copyWith({String? id, String? userId, String? phoneNumber, String? dateOfBirth, String? gender, String? height, String? weight, String? diabetesType, String? yearDiagnosed, String? diabetesHistory, String? paceOfLife, String? habits}) {
    return UserInfo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      diabetesType: diabetesType ?? this.diabetesType,
      yearDiagnosed: yearDiagnosed ?? this.yearDiagnosed,
      diabetesHistory: diabetesHistory ?? this.diabetesHistory,
      paceOfLife: paceOfLife ?? this.paceOfLife,
      habits: habits ?? this.habits);
  }
  
  UserInfo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _phoneNumber = json['phoneNumber'],
      _dateOfBirth = json['dateOfBirth'],
      _gender = json['gender'],
      _height = json['height'],
      _weight = json['weight'],
      _diabetesType = json['diabetesType'],
      _yearDiagnosed = json['yearDiagnosed'],
      _diabetesHistory = json['diabetesHistory'],
      _paceOfLife = json['paceOfLife'],
      _habits = json['habits'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'phoneNumber': _phoneNumber, 'dateOfBirth': _dateOfBirth, 'gender': _gender, 'height': _height, 'weight': _weight, 'diabetesType': _diabetesType, 'yearDiagnosed': _yearDiagnosed, 'diabetesHistory': _diabetesHistory, 'paceOfLife': _paceOfLife, 'habits': _habits
  };

  static final QueryField ID = QueryField(fieldName: "userInfo.id");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
  static final QueryField DATEOFBIRTH = QueryField(fieldName: "dateOfBirth");
  static final QueryField GENDER = QueryField(fieldName: "gender");
  static final QueryField HEIGHT = QueryField(fieldName: "height");
  static final QueryField WEIGHT = QueryField(fieldName: "weight");
  static final QueryField DIABETESTYPE = QueryField(fieldName: "diabetesType");
  static final QueryField YEARDIAGNOSED = QueryField(fieldName: "yearDiagnosed");
  static final QueryField DIABETESHISTORY = QueryField(fieldName: "diabetesHistory");
  static final QueryField PACEOFLIFE = QueryField(fieldName: "paceOfLife");
  static final QueryField HABITS = QueryField(fieldName: "habits");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserInfo";
    modelSchemaDefinition.pluralName = "UserInfos";
    
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
      key: UserInfo.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.PHONENUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.DATEOFBIRTH,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.GENDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.HEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.WEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.DIABETESTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.YEARDIAGNOSED,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.DIABETESHISTORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.PACEOFLIFE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserInfo.HABITS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _UserInfoModelType extends ModelType<UserInfo> {
  const _UserInfoModelType();
  
  @override
  UserInfo fromJson(Map<String, dynamic> jsonData) {
    return UserInfo.fromJson(jsonData);
  }
}