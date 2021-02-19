// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Usermodel> _$usermodelSerializer = new _$UsermodelSerializer();

class _$UsermodelSerializer implements StructuredSerializer<Usermodel> {
  @override
  final Iterable<Type> types = const [Usermodel, _$Usermodel];
  @override
  final String wireName = 'Usermodel';

  @override
  Iterable<Object> serialize(Serializers serializers, Usermodel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'photoUrl',
      serializers.serialize(object.photoUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Usermodel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsermodelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Usermodel extends Usermodel {
  @override
  final String name;
  @override
  final String uid;
  @override
  final String email;
  @override
  final String photoUrl;

  factory _$Usermodel([void Function(UsermodelBuilder) updates]) =>
      (new UsermodelBuilder()..update(updates)).build();

  _$Usermodel._({this.name, this.uid, this.email, this.photoUrl}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Usermodel', 'name');
    }
    if (uid == null) {
      throw new BuiltValueNullFieldError('Usermodel', 'uid');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('Usermodel', 'email');
    }
    if (photoUrl == null) {
      throw new BuiltValueNullFieldError('Usermodel', 'photoUrl');
    }
  }

  @override
  Usermodel rebuild(void Function(UsermodelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsermodelBuilder toBuilder() => new UsermodelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Usermodel &&
        name == other.name &&
        uid == other.uid &&
        email == other.email &&
        photoUrl == other.photoUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), uid.hashCode), email.hashCode),
        photoUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Usermodel')
          ..add('name', name)
          ..add('uid', uid)
          ..add('email', email)
          ..add('photoUrl', photoUrl))
        .toString();
  }
}

class UsermodelBuilder implements Builder<Usermodel, UsermodelBuilder> {
  _$Usermodel _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  UsermodelBuilder();

  UsermodelBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _uid = _$v.uid;
      _email = _$v.email;
      _photoUrl = _$v.photoUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Usermodel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Usermodel;
  }

  @override
  void update(void Function(UsermodelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Usermodel build() {
    final _$result = _$v ??
        new _$Usermodel._(
            name: name, uid: uid, email: email, photoUrl: photoUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
