// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CertificateModel {

 String get name; String get description; String get url; List<String> get images; String get largeDescription; String get issuingOrganization; String get issueDate; List<String> get skills; String get type;
/// Create a copy of CertificateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateModelCopyWith<CertificateModel> get copyWith => _$CertificateModelCopyWithImpl<CertificateModel>(this as CertificateModel, _$identity);

  /// Serializes this CertificateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.largeDescription, largeDescription) || other.largeDescription == largeDescription)&&(identical(other.issuingOrganization, issuingOrganization) || other.issuingOrganization == issuingOrganization)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&const DeepCollectionEquality().equals(other.skills, skills)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,url,const DeepCollectionEquality().hash(images),largeDescription,issuingOrganization,issueDate,const DeepCollectionEquality().hash(skills),type);

@override
String toString() {
  return 'CertificateModel(name: $name, description: $description, url: $url, images: $images, largeDescription: $largeDescription, issuingOrganization: $issuingOrganization, issueDate: $issueDate, skills: $skills, type: $type)';
}


}

/// @nodoc
abstract mixin class $CertificateModelCopyWith<$Res>  {
  factory $CertificateModelCopyWith(CertificateModel value, $Res Function(CertificateModel) _then) = _$CertificateModelCopyWithImpl;
@useResult
$Res call({
 String name, String description, String url, List<String> images, String largeDescription, String issuingOrganization, String issueDate, List<String> skills, String type
});




}
/// @nodoc
class _$CertificateModelCopyWithImpl<$Res>
    implements $CertificateModelCopyWith<$Res> {
  _$CertificateModelCopyWithImpl(this._self, this._then);

  final CertificateModel _self;
  final $Res Function(CertificateModel) _then;

/// Create a copy of CertificateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? url = null,Object? images = null,Object? largeDescription = null,Object? issuingOrganization = null,Object? issueDate = null,Object? skills = null,Object? type = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,largeDescription: null == largeDescription ? _self.largeDescription : largeDescription // ignore: cast_nullable_to_non_nullable
as String,issuingOrganization: null == issuingOrganization ? _self.issuingOrganization : issuingOrganization // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as String,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CertificateModel].
extension CertificateModelPatterns on CertificateModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CertificateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CertificateModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CertificateModel value)  $default,){
final _that = this;
switch (_that) {
case _CertificateModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CertificateModel value)?  $default,){
final _that = this;
switch (_that) {
case _CertificateModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  String url,  List<String> images,  String largeDescription,  String issuingOrganization,  String issueDate,  List<String> skills,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CertificateModel() when $default != null:
return $default(_that.name,_that.description,_that.url,_that.images,_that.largeDescription,_that.issuingOrganization,_that.issueDate,_that.skills,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  String url,  List<String> images,  String largeDescription,  String issuingOrganization,  String issueDate,  List<String> skills,  String type)  $default,) {final _that = this;
switch (_that) {
case _CertificateModel():
return $default(_that.name,_that.description,_that.url,_that.images,_that.largeDescription,_that.issuingOrganization,_that.issueDate,_that.skills,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  String url,  List<String> images,  String largeDescription,  String issuingOrganization,  String issueDate,  List<String> skills,  String type)?  $default,) {final _that = this;
switch (_that) {
case _CertificateModel() when $default != null:
return $default(_that.name,_that.description,_that.url,_that.images,_that.largeDescription,_that.issuingOrganization,_that.issueDate,_that.skills,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CertificateModel implements CertificateModel {
  const _CertificateModel({required this.name, required this.description, required this.url, required final  List<String> images, required this.largeDescription, required this.issuingOrganization, required this.issueDate, required final  List<String> skills, required this.type}): _images = images,_skills = skills;
  factory _CertificateModel.fromJson(Map<String, dynamic> json) => _$CertificateModelFromJson(json);

@override final  String name;
@override final  String description;
@override final  String url;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  String largeDescription;
@override final  String issuingOrganization;
@override final  String issueDate;
 final  List<String> _skills;
@override List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

@override final  String type;

/// Create a copy of CertificateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificateModelCopyWith<_CertificateModel> get copyWith => __$CertificateModelCopyWithImpl<_CertificateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CertificateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificateModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.largeDescription, largeDescription) || other.largeDescription == largeDescription)&&(identical(other.issuingOrganization, issuingOrganization) || other.issuingOrganization == issuingOrganization)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,url,const DeepCollectionEquality().hash(_images),largeDescription,issuingOrganization,issueDate,const DeepCollectionEquality().hash(_skills),type);

@override
String toString() {
  return 'CertificateModel(name: $name, description: $description, url: $url, images: $images, largeDescription: $largeDescription, issuingOrganization: $issuingOrganization, issueDate: $issueDate, skills: $skills, type: $type)';
}


}

/// @nodoc
abstract mixin class _$CertificateModelCopyWith<$Res> implements $CertificateModelCopyWith<$Res> {
  factory _$CertificateModelCopyWith(_CertificateModel value, $Res Function(_CertificateModel) _then) = __$CertificateModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, String url, List<String> images, String largeDescription, String issuingOrganization, String issueDate, List<String> skills, String type
});




}
/// @nodoc
class __$CertificateModelCopyWithImpl<$Res>
    implements _$CertificateModelCopyWith<$Res> {
  __$CertificateModelCopyWithImpl(this._self, this._then);

  final _CertificateModel _self;
  final $Res Function(_CertificateModel) _then;

/// Create a copy of CertificateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? url = null,Object? images = null,Object? largeDescription = null,Object? issuingOrganization = null,Object? issueDate = null,Object? skills = null,Object? type = null,}) {
  return _then(_CertificateModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,largeDescription: null == largeDescription ? _self.largeDescription : largeDescription // ignore: cast_nullable_to_non_nullable
as String,issuingOrganization: null == issuingOrganization ? _self.issuingOrganization : issuingOrganization // ignore: cast_nullable_to_non_nullable
as String,issueDate: null == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as String,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
