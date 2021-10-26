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
import 'BloodPressureEvent.dart';
import 'CarbEvent.dart';
import 'DeviceReading.dart';
import 'ExerciseEvent.dart';
import 'FastActingInsEvent.dart';
import 'LongActingInsEvent.dart';
import 'UserInfo.dart';

export 'BloodPressureEvent.dart';
export 'CarbEvent.dart';
export 'DeviceReading.dart';
export 'ExerciseEvent.dart';
export 'FastActingInsEvent.dart';
export 'LongActingInsEvent.dart';
export 'UserInfo.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "9e5eb2299888abfd8c1fe7cf0d033d41";
  @override
  List<ModelSchema> modelSchemas = [BloodPressureEvent.schema, CarbEvent.schema, DeviceReading.schema, ExerciseEvent.schema, FastActingInsEvent.schema, LongActingInsEvent.schema, UserInfo.schema];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
    case "BloodPressureEvent": {
    return BloodPressureEvent.classType;
    }
    break;
    case "CarbEvent": {
    return CarbEvent.classType;
    }
    break;
    case "DeviceReading": {
    return DeviceReading.classType;
    }
    break;
    case "ExerciseEvent": {
    return ExerciseEvent.classType;
    }
    break;
    case "FastActingInsEvent": {
    return FastActingInsEvent.classType;
    }
    break;
    case "LongActingInsEvent": {
    return LongActingInsEvent.classType;
    }
    break;
    case "UserInfo": {
    return UserInfo.classType;
    }
    break;
    default: {
    throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
    }
  }
}