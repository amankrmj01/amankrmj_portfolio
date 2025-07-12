// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about.me.info.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AboutMeInfoModel {

 String get name; String get profession; String get location; List<String> get interests; String get experience; String get education; String get email; String get summary; List<String> get technicalInterests;
/// Create a copy of AboutMeInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AboutMeInfoModelCopyWith<AboutMeInfoModel> get copyWith => _$AboutMeInfoModelCopyWithImpl<AboutMeInfoModel>(this as AboutMeInfoModel, _$identity);

  /// Serializes this AboutMeInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AboutMeInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.education, education) || other.education == education)&&(identical(other.email, email) || other.email == email)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.technicalInterests, technicalInterests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,profession,location,const DeepCollectionEquality().hash(interests),experience,education,email,summary,const DeepCollectionEquality().hash(technicalInterests));

@override
String toString() {
  return 'AboutMeInfoModel(name: $name, profession: $profession, location: $location, interests: $interests, experience: $experience, education: $education, email: $email, summary: $summary, technicalInterests: $technicalInterests)';
}


}

/// @nodoc
abstract mixin class $AboutMeInfoModelCopyWith<$Res>  {
  factory $AboutMeInfoModelCopyWith(AboutMeInfoModel value, $Res Function(AboutMeInfoModel) _then) = _$AboutMeInfoModelCopyWithImpl;
@useResult
$Res call({
 String name, String profession, String location, List<String> interests, String experience, String education, String email, String summary, List<String> technicalInterests
});




}
/// @nodoc
class _$AboutMeInfoModelCopyWithImpl<$Res>
    implements $AboutMeInfoModelCopyWith<$Res> {
  _$AboutMeInfoModelCopyWithImpl(this._self, this._then);

  final AboutMeInfoModel _self;
  final $Res Function(AboutMeInfoModel) _then;

/// Create a copy of AboutMeInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? profession = null,Object? location = null,Object? interests = null,Object? experience = null,Object? education = null,Object? email = null,Object? summary = null,Object? technicalInterests = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profession: null == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as String,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,technicalInterests: null == technicalInterests ? _self.technicalInterests : technicalInterests // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AboutMeInfoModel].
extension AboutMeInfoModelPatterns on AboutMeInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AboutMeInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AboutMeInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AboutMeInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _AboutMeInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AboutMeInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _AboutMeInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String profession,  String location,  List<String> interests,  String experience,  String education,  String email,  String summary,  List<String> technicalInterests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AboutMeInfoModel() when $default != null:
return $default(_that.name,_that.profession,_that.location,_that.interests,_that.experience,_that.education,_that.email,_that.summary,_that.technicalInterests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String profession,  String location,  List<String> interests,  String experience,  String education,  String email,  String summary,  List<String> technicalInterests)  $default,) {final _that = this;
switch (_that) {
case _AboutMeInfoModel():
return $default(_that.name,_that.profession,_that.location,_that.interests,_that.experience,_that.education,_that.email,_that.summary,_that.technicalInterests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String profession,  String location,  List<String> interests,  String experience,  String education,  String email,  String summary,  List<String> technicalInterests)?  $default,) {final _that = this;
switch (_that) {
case _AboutMeInfoModel() when $default != null:
return $default(_that.name,_that.profession,_that.location,_that.interests,_that.experience,_that.education,_that.email,_that.summary,_that.technicalInterests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AboutMeInfoModel implements AboutMeInfoModel {
  const _AboutMeInfoModel({required this.name, required this.profession, required this.location, required final  List<String> interests, required this.experience, required this.education, required this.email, required this.summary, required final  List<String> technicalInterests}): _interests = interests,_technicalInterests = technicalInterests;
  factory _AboutMeInfoModel.fromJson(Map<String, dynamic> json) => _$AboutMeInfoModelFromJson(json);

@override final  String name;
@override final  String profession;
@override final  String location;
 final  List<String> _interests;
@override List<String> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

@override final  String experience;
@override final  String education;
@override final  String email;
@override final  String summary;
 final  List<String> _technicalInterests;
@override List<String> get technicalInterests {
  if (_technicalInterests is EqualUnmodifiableListView) return _technicalInterests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_technicalInterests);
}


/// Create a copy of AboutMeInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AboutMeInfoModelCopyWith<_AboutMeInfoModel> get copyWith => __$AboutMeInfoModelCopyWithImpl<_AboutMeInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AboutMeInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AboutMeInfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.education, education) || other.education == education)&&(identical(other.email, email) || other.email == email)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._technicalInterests, _technicalInterests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,profession,location,const DeepCollectionEquality().hash(_interests),experience,education,email,summary,const DeepCollectionEquality().hash(_technicalInterests));

@override
String toString() {
  return 'AboutMeInfoModel(name: $name, profession: $profession, location: $location, interests: $interests, experience: $experience, education: $education, email: $email, summary: $summary, technicalInterests: $technicalInterests)';
}


}

/// @nodoc
abstract mixin class _$AboutMeInfoModelCopyWith<$Res> implements $AboutMeInfoModelCopyWith<$Res> {
  factory _$AboutMeInfoModelCopyWith(_AboutMeInfoModel value, $Res Function(_AboutMeInfoModel) _then) = __$AboutMeInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String profession, String location, List<String> interests, String experience, String education, String email, String summary, List<String> technicalInterests
});




}
/// @nodoc
class __$AboutMeInfoModelCopyWithImpl<$Res>
    implements _$AboutMeInfoModelCopyWith<$Res> {
  __$AboutMeInfoModelCopyWithImpl(this._self, this._then);

  final _AboutMeInfoModel _self;
  final $Res Function(_AboutMeInfoModel) _then;

/// Create a copy of AboutMeInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? profession = null,Object? location = null,Object? interests = null,Object? experience = null,Object? education = null,Object? email = null,Object? summary = null,Object? technicalInterests = null,}) {
  return _then(_AboutMeInfoModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profession: null == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as String,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,technicalInterests: null == technicalInterests ? _self._technicalInterests : technicalInterests // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
