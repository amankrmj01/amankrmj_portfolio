// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExperienceModel {

 String get title; String get company; String get startDate; String get endDate; String get description; String get location; List<String> get technologies; bool get current;
/// Create a copy of ExperienceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExperienceModelCopyWith<ExperienceModel> get copyWith => _$ExperienceModelCopyWithImpl<ExperienceModel>(this as ExperienceModel, _$identity);

  /// Serializes this ExperienceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExperienceModel&&(identical(other.title, title) || other.title == title)&&(identical(other.company, company) || other.company == company)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.technologies, technologies)&&(identical(other.current, current) || other.current == current));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,company,startDate,endDate,description,location,const DeepCollectionEquality().hash(technologies),current);

@override
String toString() {
  return 'ExperienceModel(title: $title, company: $company, startDate: $startDate, endDate: $endDate, description: $description, location: $location, technologies: $technologies, current: $current)';
}


}

/// @nodoc
abstract mixin class $ExperienceModelCopyWith<$Res>  {
  factory $ExperienceModelCopyWith(ExperienceModel value, $Res Function(ExperienceModel) _then) = _$ExperienceModelCopyWithImpl;
@useResult
$Res call({
 String title, String company, String startDate, String endDate, String description, String location, List<String> technologies, bool current
});




}
/// @nodoc
class _$ExperienceModelCopyWithImpl<$Res>
    implements $ExperienceModelCopyWith<$Res> {
  _$ExperienceModelCopyWithImpl(this._self, this._then);

  final ExperienceModel _self;
  final $Res Function(ExperienceModel) _then;

/// Create a copy of ExperienceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? company = null,Object? startDate = null,Object? endDate = null,Object? description = null,Object? location = null,Object? technologies = null,Object? current = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,technologies: null == technologies ? _self.technologies : technologies // ignore: cast_nullable_to_non_nullable
as List<String>,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExperienceModel].
extension ExperienceModelPatterns on ExperienceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExperienceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExperienceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExperienceModel value)  $default,){
final _that = this;
switch (_that) {
case _ExperienceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExperienceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExperienceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String company,  String startDate,  String endDate,  String description,  String location,  List<String> technologies,  bool current)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExperienceModel() when $default != null:
return $default(_that.title,_that.company,_that.startDate,_that.endDate,_that.description,_that.location,_that.technologies,_that.current);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String company,  String startDate,  String endDate,  String description,  String location,  List<String> technologies,  bool current)  $default,) {final _that = this;
switch (_that) {
case _ExperienceModel():
return $default(_that.title,_that.company,_that.startDate,_that.endDate,_that.description,_that.location,_that.technologies,_that.current);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String company,  String startDate,  String endDate,  String description,  String location,  List<String> technologies,  bool current)?  $default,) {final _that = this;
switch (_that) {
case _ExperienceModel() when $default != null:
return $default(_that.title,_that.company,_that.startDate,_that.endDate,_that.description,_that.location,_that.technologies,_that.current);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExperienceModel implements ExperienceModel {
  const _ExperienceModel({required this.title, required this.company, required this.startDate, required this.endDate, required this.description, required this.location, required final  List<String> technologies, required this.current}): _technologies = technologies;
  factory _ExperienceModel.fromJson(Map<String, dynamic> json) => _$ExperienceModelFromJson(json);

@override final  String title;
@override final  String company;
@override final  String startDate;
@override final  String endDate;
@override final  String description;
@override final  String location;
 final  List<String> _technologies;
@override List<String> get technologies {
  if (_technologies is EqualUnmodifiableListView) return _technologies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_technologies);
}

@override final  bool current;

/// Create a copy of ExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExperienceModelCopyWith<_ExperienceModel> get copyWith => __$ExperienceModelCopyWithImpl<_ExperienceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExperienceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExperienceModel&&(identical(other.title, title) || other.title == title)&&(identical(other.company, company) || other.company == company)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._technologies, _technologies)&&(identical(other.current, current) || other.current == current));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,company,startDate,endDate,description,location,const DeepCollectionEquality().hash(_technologies),current);

@override
String toString() {
  return 'ExperienceModel(title: $title, company: $company, startDate: $startDate, endDate: $endDate, description: $description, location: $location, technologies: $technologies, current: $current)';
}


}

/// @nodoc
abstract mixin class _$ExperienceModelCopyWith<$Res> implements $ExperienceModelCopyWith<$Res> {
  factory _$ExperienceModelCopyWith(_ExperienceModel value, $Res Function(_ExperienceModel) _then) = __$ExperienceModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String company, String startDate, String endDate, String description, String location, List<String> technologies, bool current
});




}
/// @nodoc
class __$ExperienceModelCopyWithImpl<$Res>
    implements _$ExperienceModelCopyWith<$Res> {
  __$ExperienceModelCopyWithImpl(this._self, this._then);

  final _ExperienceModel _self;
  final $Res Function(_ExperienceModel) _then;

/// Create a copy of ExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? company = null,Object? startDate = null,Object? endDate = null,Object? description = null,Object? location = null,Object? technologies = null,Object? current = null,}) {
  return _then(_ExperienceModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,technologies: null == technologies ? _self._technologies : technologies // ignore: cast_nullable_to_non_nullable
as List<String>,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
