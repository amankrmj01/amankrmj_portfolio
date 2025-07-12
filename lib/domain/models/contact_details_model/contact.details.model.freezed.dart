// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.details.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactDetailsModel {

 String get name; String get countryCode; String get phoneNumber; String get email; String get message; String get date; String get time;
/// Create a copy of ContactDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactDetailsModelCopyWith<ContactDetailsModel> get copyWith => _$ContactDetailsModelCopyWithImpl<ContactDetailsModel>(this as ContactDetailsModel, _$identity);

  /// Serializes this ContactDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactDetailsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,countryCode,phoneNumber,email,message,date,time);

@override
String toString() {
  return 'ContactDetailsModel(name: $name, countryCode: $countryCode, phoneNumber: $phoneNumber, email: $email, message: $message, date: $date, time: $time)';
}


}

/// @nodoc
abstract mixin class $ContactDetailsModelCopyWith<$Res>  {
  factory $ContactDetailsModelCopyWith(ContactDetailsModel value, $Res Function(ContactDetailsModel) _then) = _$ContactDetailsModelCopyWithImpl;
@useResult
$Res call({
 String name, String countryCode, String phoneNumber, String email, String message, String date, String time
});




}
/// @nodoc
class _$ContactDetailsModelCopyWithImpl<$Res>
    implements $ContactDetailsModelCopyWith<$Res> {
  _$ContactDetailsModelCopyWithImpl(this._self, this._then);

  final ContactDetailsModel _self;
  final $Res Function(ContactDetailsModel) _then;

/// Create a copy of ContactDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? countryCode = null,Object? phoneNumber = null,Object? email = null,Object? message = null,Object? date = null,Object? time = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactDetailsModel].
extension ContactDetailsModelPatterns on ContactDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _ContactDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContactDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String countryCode,  String phoneNumber,  String email,  String message,  String date,  String time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactDetailsModel() when $default != null:
return $default(_that.name,_that.countryCode,_that.phoneNumber,_that.email,_that.message,_that.date,_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String countryCode,  String phoneNumber,  String email,  String message,  String date,  String time)  $default,) {final _that = this;
switch (_that) {
case _ContactDetailsModel():
return $default(_that.name,_that.countryCode,_that.phoneNumber,_that.email,_that.message,_that.date,_that.time);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String countryCode,  String phoneNumber,  String email,  String message,  String date,  String time)?  $default,) {final _that = this;
switch (_that) {
case _ContactDetailsModel() when $default != null:
return $default(_that.name,_that.countryCode,_that.phoneNumber,_that.email,_that.message,_that.date,_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactDetailsModel implements ContactDetailsModel {
  const _ContactDetailsModel({required this.name, required this.countryCode, required this.phoneNumber, required this.email, required this.message, required this.date, required this.time});
  factory _ContactDetailsModel.fromJson(Map<String, dynamic> json) => _$ContactDetailsModelFromJson(json);

@override final  String name;
@override final  String countryCode;
@override final  String phoneNumber;
@override final  String email;
@override final  String message;
@override final  String date;
@override final  String time;

/// Create a copy of ContactDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactDetailsModelCopyWith<_ContactDetailsModel> get copyWith => __$ContactDetailsModelCopyWithImpl<_ContactDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactDetailsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.message, message) || other.message == message)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,countryCode,phoneNumber,email,message,date,time);

@override
String toString() {
  return 'ContactDetailsModel(name: $name, countryCode: $countryCode, phoneNumber: $phoneNumber, email: $email, message: $message, date: $date, time: $time)';
}


}

/// @nodoc
abstract mixin class _$ContactDetailsModelCopyWith<$Res> implements $ContactDetailsModelCopyWith<$Res> {
  factory _$ContactDetailsModelCopyWith(_ContactDetailsModel value, $Res Function(_ContactDetailsModel) _then) = __$ContactDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String countryCode, String phoneNumber, String email, String message, String date, String time
});




}
/// @nodoc
class __$ContactDetailsModelCopyWithImpl<$Res>
    implements _$ContactDetailsModelCopyWith<$Res> {
  __$ContactDetailsModelCopyWithImpl(this._self, this._then);

  final _ContactDetailsModel _self;
  final $Res Function(_ContactDetailsModel) _then;

/// Create a copy of ContactDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? countryCode = null,Object? phoneNumber = null,Object? email = null,Object? message = null,Object? date = null,Object? time = null,}) {
  return _then(_ContactDetailsModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
