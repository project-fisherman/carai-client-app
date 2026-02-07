// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspection_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InspectionForm _$InspectionFormFromJson(Map<String, dynamic> json) {
  return _InspectionForm.fromJson(json);
}

/// @nodoc
mixin _$InspectionForm {
  InspectionMeta get meta => throw _privateConstructorUsedError;
  List<InspectionHeaderField> get header => throw _privateConstructorUsedError;
  List<InspectionGroup> get groups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InspectionFormCopyWith<InspectionForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspectionFormCopyWith<$Res> {
  factory $InspectionFormCopyWith(
          InspectionForm value, $Res Function(InspectionForm) then) =
      _$InspectionFormCopyWithImpl<$Res, InspectionForm>;
  @useResult
  $Res call(
      {InspectionMeta meta,
      List<InspectionHeaderField> header,
      List<InspectionGroup> groups});

  $InspectionMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$InspectionFormCopyWithImpl<$Res, $Val extends InspectionForm>
    implements $InspectionFormCopyWith<$Res> {
  _$InspectionFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? header = null,
    Object? groups = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as InspectionMeta,
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as List<InspectionHeaderField>,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<InspectionGroup>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InspectionMetaCopyWith<$Res> get meta {
    return $InspectionMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InspectionFormImplCopyWith<$Res>
    implements $InspectionFormCopyWith<$Res> {
  factory _$$InspectionFormImplCopyWith(_$InspectionFormImpl value,
          $Res Function(_$InspectionFormImpl) then) =
      __$$InspectionFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InspectionMeta meta,
      List<InspectionHeaderField> header,
      List<InspectionGroup> groups});

  @override
  $InspectionMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$InspectionFormImplCopyWithImpl<$Res>
    extends _$InspectionFormCopyWithImpl<$Res, _$InspectionFormImpl>
    implements _$$InspectionFormImplCopyWith<$Res> {
  __$$InspectionFormImplCopyWithImpl(
      _$InspectionFormImpl _value, $Res Function(_$InspectionFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? header = null,
    Object? groups = null,
  }) {
    return _then(_$InspectionFormImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as InspectionMeta,
      header: null == header
          ? _value._header
          : header // ignore: cast_nullable_to_non_nullable
              as List<InspectionHeaderField>,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<InspectionGroup>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InspectionFormImpl implements _InspectionForm {
  const _$InspectionFormImpl(
      {required this.meta,
      required final List<InspectionHeaderField> header,
      required final List<InspectionGroup> groups})
      : _header = header,
        _groups = groups;

  factory _$InspectionFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$InspectionFormImplFromJson(json);

  @override
  final InspectionMeta meta;
  final List<InspectionHeaderField> _header;
  @override
  List<InspectionHeaderField> get header {
    if (_header is EqualUnmodifiableListView) return _header;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_header);
  }

  final List<InspectionGroup> _groups;
  @override
  List<InspectionGroup> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  String toString() {
    return 'InspectionForm(meta: $meta, header: $header, groups: $groups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspectionFormImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._header, _header) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      meta,
      const DeepCollectionEquality().hash(_header),
      const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InspectionFormImplCopyWith<_$InspectionFormImpl> get copyWith =>
      __$$InspectionFormImplCopyWithImpl<_$InspectionFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InspectionFormImplToJson(
      this,
    );
  }
}

abstract class _InspectionForm implements InspectionForm {
  const factory _InspectionForm(
      {required final InspectionMeta meta,
      required final List<InspectionHeaderField> header,
      required final List<InspectionGroup> groups}) = _$InspectionFormImpl;

  factory _InspectionForm.fromJson(Map<String, dynamic> json) =
      _$InspectionFormImpl.fromJson;

  @override
  InspectionMeta get meta;
  @override
  List<InspectionHeaderField> get header;
  @override
  List<InspectionGroup> get groups;
  @override
  @JsonKey(ignore: true)
  _$$InspectionFormImplCopyWith<_$InspectionFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InspectionMeta _$InspectionMetaFromJson(Map<String, dynamic> json) {
  return _InspectionMeta.fromJson(json);
}

/// @nodoc
mixin _$InspectionMeta {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InspectionMetaCopyWith<InspectionMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspectionMetaCopyWith<$Res> {
  factory $InspectionMetaCopyWith(
          InspectionMeta value, $Res Function(InspectionMeta) then) =
      _$InspectionMetaCopyWithImpl<$Res, InspectionMeta>;
  @useResult
  $Res call({String id, String status});
}

/// @nodoc
class _$InspectionMetaCopyWithImpl<$Res, $Val extends InspectionMeta>
    implements $InspectionMetaCopyWith<$Res> {
  _$InspectionMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InspectionMetaImplCopyWith<$Res>
    implements $InspectionMetaCopyWith<$Res> {
  factory _$$InspectionMetaImplCopyWith(_$InspectionMetaImpl value,
          $Res Function(_$InspectionMetaImpl) then) =
      __$$InspectionMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String status});
}

/// @nodoc
class __$$InspectionMetaImplCopyWithImpl<$Res>
    extends _$InspectionMetaCopyWithImpl<$Res, _$InspectionMetaImpl>
    implements _$$InspectionMetaImplCopyWith<$Res> {
  __$$InspectionMetaImplCopyWithImpl(
      _$InspectionMetaImpl _value, $Res Function(_$InspectionMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_$InspectionMetaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InspectionMetaImpl implements _InspectionMeta {
  const _$InspectionMetaImpl({required this.id, required this.status});

  factory _$InspectionMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$InspectionMetaImplFromJson(json);

  @override
  final String id;
  @override
  final String status;

  @override
  String toString() {
    return 'InspectionMeta(id: $id, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspectionMetaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InspectionMetaImplCopyWith<_$InspectionMetaImpl> get copyWith =>
      __$$InspectionMetaImplCopyWithImpl<_$InspectionMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InspectionMetaImplToJson(
      this,
    );
  }
}

abstract class _InspectionMeta implements InspectionMeta {
  const factory _InspectionMeta(
      {required final String id,
      required final String status}) = _$InspectionMetaImpl;

  factory _InspectionMeta.fromJson(Map<String, dynamic> json) =
      _$InspectionMetaImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$InspectionMetaImplCopyWith<_$InspectionMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InspectionHeaderField _$InspectionHeaderFieldFromJson(
    Map<String, dynamic> json) {
  return _InspectionHeaderField.fromJson(json);
}

/// @nodoc
mixin _$InspectionHeaderField {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InspectionHeaderFieldCopyWith<InspectionHeaderField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspectionHeaderFieldCopyWith<$Res> {
  factory $InspectionHeaderFieldCopyWith(InspectionHeaderField value,
          $Res Function(InspectionHeaderField) then) =
      _$InspectionHeaderFieldCopyWithImpl<$Res, InspectionHeaderField>;
  @useResult
  $Res call({String id, String label, String type});
}

/// @nodoc
class _$InspectionHeaderFieldCopyWithImpl<$Res,
        $Val extends InspectionHeaderField>
    implements $InspectionHeaderFieldCopyWith<$Res> {
  _$InspectionHeaderFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InspectionHeaderFieldImplCopyWith<$Res>
    implements $InspectionHeaderFieldCopyWith<$Res> {
  factory _$$InspectionHeaderFieldImplCopyWith(
          _$InspectionHeaderFieldImpl value,
          $Res Function(_$InspectionHeaderFieldImpl) then) =
      __$$InspectionHeaderFieldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, String type});
}

/// @nodoc
class __$$InspectionHeaderFieldImplCopyWithImpl<$Res>
    extends _$InspectionHeaderFieldCopyWithImpl<$Res,
        _$InspectionHeaderFieldImpl>
    implements _$$InspectionHeaderFieldImplCopyWith<$Res> {
  __$$InspectionHeaderFieldImplCopyWithImpl(_$InspectionHeaderFieldImpl _value,
      $Res Function(_$InspectionHeaderFieldImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
  }) {
    return _then(_$InspectionHeaderFieldImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InspectionHeaderFieldImpl implements _InspectionHeaderField {
  const _$InspectionHeaderFieldImpl(
      {required this.id, required this.label, required this.type});

  factory _$InspectionHeaderFieldImpl.fromJson(Map<String, dynamic> json) =>
      _$$InspectionHeaderFieldImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String type;

  @override
  String toString() {
    return 'InspectionHeaderField(id: $id, label: $label, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspectionHeaderFieldImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InspectionHeaderFieldImplCopyWith<_$InspectionHeaderFieldImpl>
      get copyWith => __$$InspectionHeaderFieldImplCopyWithImpl<
          _$InspectionHeaderFieldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InspectionHeaderFieldImplToJson(
      this,
    );
  }
}

abstract class _InspectionHeaderField implements InspectionHeaderField {
  const factory _InspectionHeaderField(
      {required final String id,
      required final String label,
      required final String type}) = _$InspectionHeaderFieldImpl;

  factory _InspectionHeaderField.fromJson(Map<String, dynamic> json) =
      _$InspectionHeaderFieldImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$InspectionHeaderFieldImplCopyWith<_$InspectionHeaderFieldImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InspectionGroup _$InspectionGroupFromJson(Map<String, dynamic> json) {
  return _InspectionGroup.fromJson(json);
}

/// @nodoc
mixin _$InspectionGroup {
  @JsonKey(name: 'group_seq')
  int get groupSeq => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_label')
  String get groupLabel => throw _privateConstructorUsedError;
  List<InspectionItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InspectionGroupCopyWith<InspectionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspectionGroupCopyWith<$Res> {
  factory $InspectionGroupCopyWith(
          InspectionGroup value, $Res Function(InspectionGroup) then) =
      _$InspectionGroupCopyWithImpl<$Res, InspectionGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'group_seq') int groupSeq,
      @JsonKey(name: 'group_label') String groupLabel,
      List<InspectionItem> items});
}

/// @nodoc
class _$InspectionGroupCopyWithImpl<$Res, $Val extends InspectionGroup>
    implements $InspectionGroupCopyWith<$Res> {
  _$InspectionGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupSeq = null,
    Object? groupLabel = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      groupSeq: null == groupSeq
          ? _value.groupSeq
          : groupSeq // ignore: cast_nullable_to_non_nullable
              as int,
      groupLabel: null == groupLabel
          ? _value.groupLabel
          : groupLabel // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InspectionItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InspectionGroupImplCopyWith<$Res>
    implements $InspectionGroupCopyWith<$Res> {
  factory _$$InspectionGroupImplCopyWith(_$InspectionGroupImpl value,
          $Res Function(_$InspectionGroupImpl) then) =
      __$$InspectionGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'group_seq') int groupSeq,
      @JsonKey(name: 'group_label') String groupLabel,
      List<InspectionItem> items});
}

/// @nodoc
class __$$InspectionGroupImplCopyWithImpl<$Res>
    extends _$InspectionGroupCopyWithImpl<$Res, _$InspectionGroupImpl>
    implements _$$InspectionGroupImplCopyWith<$Res> {
  __$$InspectionGroupImplCopyWithImpl(
      _$InspectionGroupImpl _value, $Res Function(_$InspectionGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupSeq = null,
    Object? groupLabel = null,
    Object? items = null,
  }) {
    return _then(_$InspectionGroupImpl(
      groupSeq: null == groupSeq
          ? _value.groupSeq
          : groupSeq // ignore: cast_nullable_to_non_nullable
              as int,
      groupLabel: null == groupLabel
          ? _value.groupLabel
          : groupLabel // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<InspectionItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InspectionGroupImpl implements _InspectionGroup {
  const _$InspectionGroupImpl(
      {@JsonKey(name: 'group_seq') required this.groupSeq,
      @JsonKey(name: 'group_label') required this.groupLabel,
      required final List<InspectionItem> items})
      : _items = items;

  factory _$InspectionGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$InspectionGroupImplFromJson(json);

  @override
  @JsonKey(name: 'group_seq')
  final int groupSeq;
  @override
  @JsonKey(name: 'group_label')
  final String groupLabel;
  final List<InspectionItem> _items;
  @override
  List<InspectionItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'InspectionGroup(groupSeq: $groupSeq, groupLabel: $groupLabel, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspectionGroupImpl &&
            (identical(other.groupSeq, groupSeq) ||
                other.groupSeq == groupSeq) &&
            (identical(other.groupLabel, groupLabel) ||
                other.groupLabel == groupLabel) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, groupSeq, groupLabel,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InspectionGroupImplCopyWith<_$InspectionGroupImpl> get copyWith =>
      __$$InspectionGroupImplCopyWithImpl<_$InspectionGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InspectionGroupImplToJson(
      this,
    );
  }
}

abstract class _InspectionGroup implements InspectionGroup {
  const factory _InspectionGroup(
      {@JsonKey(name: 'group_seq') required final int groupSeq,
      @JsonKey(name: 'group_label') required final String groupLabel,
      required final List<InspectionItem> items}) = _$InspectionGroupImpl;

  factory _InspectionGroup.fromJson(Map<String, dynamic> json) =
      _$InspectionGroupImpl.fromJson;

  @override
  @JsonKey(name: 'group_seq')
  int get groupSeq;
  @override
  @JsonKey(name: 'group_label')
  String get groupLabel;
  @override
  List<InspectionItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$InspectionGroupImplCopyWith<_$InspectionGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
