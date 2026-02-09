// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'safety_checklist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SafetyChecklist {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get jsonUrl => throw _privateConstructorUsedError;
  String get htmlUrl => throw _privateConstructorUsedError;
  bool get isPreset => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SafetyChecklistCopyWith<SafetyChecklist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetyChecklistCopyWith<$Res> {
  factory $SafetyChecklistCopyWith(
          SafetyChecklist value, $Res Function(SafetyChecklist) then) =
      _$SafetyChecklistCopyWithImpl<$Res, SafetyChecklist>;
  @useResult
  $Res call(
      {int id,
      String name,
      String imageUrl,
      String jsonUrl,
      String htmlUrl,
      bool isPreset,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$SafetyChecklistCopyWithImpl<$Res, $Val extends SafetyChecklist>
    implements $SafetyChecklistCopyWith<$Res> {
  _$SafetyChecklistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? jsonUrl = null,
    Object? htmlUrl = null,
    Object? isPreset = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      jsonUrl: null == jsonUrl
          ? _value.jsonUrl
          : jsonUrl // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isPreset: null == isPreset
          ? _value.isPreset
          : isPreset // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SafetyChecklistImplCopyWith<$Res>
    implements $SafetyChecklistCopyWith<$Res> {
  factory _$$SafetyChecklistImplCopyWith(_$SafetyChecklistImpl value,
          $Res Function(_$SafetyChecklistImpl) then) =
      __$$SafetyChecklistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String imageUrl,
      String jsonUrl,
      String htmlUrl,
      bool isPreset,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$SafetyChecklistImplCopyWithImpl<$Res>
    extends _$SafetyChecklistCopyWithImpl<$Res, _$SafetyChecklistImpl>
    implements _$$SafetyChecklistImplCopyWith<$Res> {
  __$$SafetyChecklistImplCopyWithImpl(
      _$SafetyChecklistImpl _value, $Res Function(_$SafetyChecklistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? jsonUrl = null,
    Object? htmlUrl = null,
    Object? isPreset = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SafetyChecklistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      jsonUrl: null == jsonUrl
          ? _value.jsonUrl
          : jsonUrl // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isPreset: null == isPreset
          ? _value.isPreset
          : isPreset // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$SafetyChecklistImpl implements _SafetyChecklist {
  const _$SafetyChecklistImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.jsonUrl,
      required this.htmlUrl,
      required this.isPreset,
      this.createdAt,
      this.updatedAt});

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String jsonUrl;
  @override
  final String htmlUrl;
  @override
  final bool isPreset;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SafetyChecklist(id: $id, name: $name, imageUrl: $imageUrl, jsonUrl: $jsonUrl, htmlUrl: $htmlUrl, isPreset: $isPreset, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SafetyChecklistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.jsonUrl, jsonUrl) || other.jsonUrl == jsonUrl) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.isPreset, isPreset) ||
                other.isPreset == isPreset) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, jsonUrl,
      htmlUrl, isPreset, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SafetyChecklistImplCopyWith<_$SafetyChecklistImpl> get copyWith =>
      __$$SafetyChecklistImplCopyWithImpl<_$SafetyChecklistImpl>(
          this, _$identity);
}

abstract class _SafetyChecklist implements SafetyChecklist {
  const factory _SafetyChecklist(
      {required final int id,
      required final String name,
      required final String imageUrl,
      required final String jsonUrl,
      required final String htmlUrl,
      required final bool isPreset,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$SafetyChecklistImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get jsonUrl;
  @override
  String get htmlUrl;
  @override
  bool get isPreset;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SafetyChecklistImplCopyWith<_$SafetyChecklistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
