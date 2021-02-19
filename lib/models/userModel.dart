import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contribution_app/models/serializers.dart';

part 'userModel.g.dart';

abstract class Usermodel implements Built<Usermodel, UsermodelBuilder> {
  String get name;
  String get uid;
  String get email;
  String get photoUrl;
  Usermodel._();
  factory Usermodel([void Function(UsermodelBuilder) updates]) = _$Usermodel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Usermodel.serializer, this);
  }

  static Usermodel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Usermodel.serializer, json);
  }

  static Serializer<Usermodel> get serializer => _$usermodelSerializer;
}
