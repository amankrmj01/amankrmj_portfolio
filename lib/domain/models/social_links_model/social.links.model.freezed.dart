// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social.links.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialLinksModel {

 String get github; String get linkedIn; String get twitter; String get instagram; String get facebook; String get medium; String get email; String get resume; String get discord; String get phoneNumber; String get hackerrank; String get leetcode;
/// Create a copy of SocialLinksModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialLinksModelCopyWith<SocialLinksModel> get copyWith => _$SocialLinksModelCopyWithImpl<SocialLinksModel>(this as SocialLinksModel, _$identity);

  /// Serializes this SocialLinksModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialLinksModel&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn)&&(identical(other.twitter, twitter) || other.twitter == twitter)&&(identical(other.instagram, instagram) || other.instagram == instagram)&&(identical(other.facebook, facebook) || other.facebook == facebook)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.email, email) || other.email == email)&&(identical(other.resume, resume) || other.resume == resume)&&(identical(other.discord, discord) || other.discord == discord)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.hackerrank, hackerrank) || other.hackerrank == hackerrank)&&(identical(other.leetcode, leetcode) || other.leetcode == leetcode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,github,linkedIn,twitter,instagram,facebook,medium,email,resume,discord,phoneNumber,hackerrank,leetcode);

@override
String toString() {
  return 'SocialLinksModel(github: $github, linkedIn: $linkedIn, twitter: $twitter, instagram: $instagram, facebook: $facebook, medium: $medium, email: $email, resume: $resume, discord: $discord, phoneNumber: $phoneNumber, hackerrank: $hackerrank, leetcode: $leetcode)';
}


}

/// @nodoc
abstract mixin class $SocialLinksModelCopyWith<$Res>  {
  factory $SocialLinksModelCopyWith(SocialLinksModel value, $Res Function(SocialLinksModel) _then) = _$SocialLinksModelCopyWithImpl;
@useResult
$Res call({
 String github, String linkedIn, String twitter, String instagram, String facebook, String medium, String email, String resume, String discord, String phoneNumber, String hackerrank, String leetcode
});




}
/// @nodoc
class _$SocialLinksModelCopyWithImpl<$Res>
    implements $SocialLinksModelCopyWith<$Res> {
  _$SocialLinksModelCopyWithImpl(this._self, this._then);

  final SocialLinksModel _self;
  final $Res Function(SocialLinksModel) _then;

/// Create a copy of SocialLinksModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? github = null,Object? linkedIn = null,Object? twitter = null,Object? instagram = null,Object? facebook = null,Object? medium = null,Object? email = null,Object? resume = null,Object? discord = null,Object? phoneNumber = null,Object? hackerrank = null,Object? leetcode = null,}) {
  return _then(_self.copyWith(
github: null == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String,linkedIn: null == linkedIn ? _self.linkedIn : linkedIn // ignore: cast_nullable_to_non_nullable
as String,twitter: null == twitter ? _self.twitter : twitter // ignore: cast_nullable_to_non_nullable
as String,instagram: null == instagram ? _self.instagram : instagram // ignore: cast_nullable_to_non_nullable
as String,facebook: null == facebook ? _self.facebook : facebook // ignore: cast_nullable_to_non_nullable
as String,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as String,discord: null == discord ? _self.discord : discord // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,hackerrank: null == hackerrank ? _self.hackerrank : hackerrank // ignore: cast_nullable_to_non_nullable
as String,leetcode: null == leetcode ? _self.leetcode : leetcode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialLinksModel].
extension SocialLinksModelPatterns on SocialLinksModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialLinksModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialLinksModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialLinksModel value)  $default,){
final _that = this;
switch (_that) {
case _SocialLinksModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialLinksModel value)?  $default,){
final _that = this;
switch (_that) {
case _SocialLinksModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String github,  String linkedIn,  String twitter,  String instagram,  String facebook,  String medium,  String email,  String resume,  String discord,  String phoneNumber,  String hackerrank,  String leetcode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialLinksModel() when $default != null:
return $default(_that.github,_that.linkedIn,_that.twitter,_that.instagram,_that.facebook,_that.medium,_that.email,_that.resume,_that.discord,_that.phoneNumber,_that.hackerrank,_that.leetcode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String github,  String linkedIn,  String twitter,  String instagram,  String facebook,  String medium,  String email,  String resume,  String discord,  String phoneNumber,  String hackerrank,  String leetcode)  $default,) {final _that = this;
switch (_that) {
case _SocialLinksModel():
return $default(_that.github,_that.linkedIn,_that.twitter,_that.instagram,_that.facebook,_that.medium,_that.email,_that.resume,_that.discord,_that.phoneNumber,_that.hackerrank,_that.leetcode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String github,  String linkedIn,  String twitter,  String instagram,  String facebook,  String medium,  String email,  String resume,  String discord,  String phoneNumber,  String hackerrank,  String leetcode)?  $default,) {final _that = this;
switch (_that) {
case _SocialLinksModel() when $default != null:
return $default(_that.github,_that.linkedIn,_that.twitter,_that.instagram,_that.facebook,_that.medium,_that.email,_that.resume,_that.discord,_that.phoneNumber,_that.hackerrank,_that.leetcode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialLinksModel implements SocialLinksModel {
  const _SocialLinksModel({required this.github, required this.linkedIn, required this.twitter, required this.instagram, required this.facebook, required this.medium, required this.email, required this.resume, required this.discord, required this.phoneNumber, required this.hackerrank, required this.leetcode});
  factory _SocialLinksModel.fromJson(Map<String, dynamic> json) => _$SocialLinksModelFromJson(json);

@override final  String github;
@override final  String linkedIn;
@override final  String twitter;
@override final  String instagram;
@override final  String facebook;
@override final  String medium;
@override final  String email;
@override final  String resume;
@override final  String discord;
@override final  String phoneNumber;
@override final  String hackerrank;
@override final  String leetcode;

/// Create a copy of SocialLinksModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialLinksModelCopyWith<_SocialLinksModel> get copyWith => __$SocialLinksModelCopyWithImpl<_SocialLinksModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialLinksModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialLinksModel&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn)&&(identical(other.twitter, twitter) || other.twitter == twitter)&&(identical(other.instagram, instagram) || other.instagram == instagram)&&(identical(other.facebook, facebook) || other.facebook == facebook)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.email, email) || other.email == email)&&(identical(other.resume, resume) || other.resume == resume)&&(identical(other.discord, discord) || other.discord == discord)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.hackerrank, hackerrank) || other.hackerrank == hackerrank)&&(identical(other.leetcode, leetcode) || other.leetcode == leetcode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,github,linkedIn,twitter,instagram,facebook,medium,email,resume,discord,phoneNumber,hackerrank,leetcode);

@override
String toString() {
  return 'SocialLinksModel(github: $github, linkedIn: $linkedIn, twitter: $twitter, instagram: $instagram, facebook: $facebook, medium: $medium, email: $email, resume: $resume, discord: $discord, phoneNumber: $phoneNumber, hackerrank: $hackerrank, leetcode: $leetcode)';
}


}

/// @nodoc
abstract mixin class _$SocialLinksModelCopyWith<$Res> implements $SocialLinksModelCopyWith<$Res> {
  factory _$SocialLinksModelCopyWith(_SocialLinksModel value, $Res Function(_SocialLinksModel) _then) = __$SocialLinksModelCopyWithImpl;
@override @useResult
$Res call({
 String github, String linkedIn, String twitter, String instagram, String facebook, String medium, String email, String resume, String discord, String phoneNumber, String hackerrank, String leetcode
});




}
/// @nodoc
class __$SocialLinksModelCopyWithImpl<$Res>
    implements _$SocialLinksModelCopyWith<$Res> {
  __$SocialLinksModelCopyWithImpl(this._self, this._then);

  final _SocialLinksModel _self;
  final $Res Function(_SocialLinksModel) _then;

/// Create a copy of SocialLinksModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? github = null,Object? linkedIn = null,Object? twitter = null,Object? instagram = null,Object? facebook = null,Object? medium = null,Object? email = null,Object? resume = null,Object? discord = null,Object? phoneNumber = null,Object? hackerrank = null,Object? leetcode = null,}) {
  return _then(_SocialLinksModel(
github: null == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String,linkedIn: null == linkedIn ? _self.linkedIn : linkedIn // ignore: cast_nullable_to_non_nullable
as String,twitter: null == twitter ? _self.twitter : twitter // ignore: cast_nullable_to_non_nullable
as String,instagram: null == instagram ? _self.instagram : instagram // ignore: cast_nullable_to_non_nullable
as String,facebook: null == facebook ? _self.facebook : facebook // ignore: cast_nullable_to_non_nullable
as String,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,resume: null == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as String,discord: null == discord ? _self.discord : discord // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,hackerrank: null == hackerrank ? _self.hackerrank : hackerrank // ignore: cast_nullable_to_non_nullable
as String,leetcode: null == leetcode ? _self.leetcode : leetcode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
