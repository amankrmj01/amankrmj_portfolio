// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tools.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToolsModel {

 String get name; String get image; String get url; String get color; int get width;
/// Create a copy of ToolsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolsModelCopyWith<ToolsModel> get copyWith => _$ToolsModelCopyWithImpl<ToolsModel>(this as ToolsModel, _$identity);

  /// Serializes this ToolsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.url, url) || other.url == url)&&(identical(other.color, color) || other.color == color)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,image,url,color,width);

@override
String toString() {
  return 'ToolsModel(name: $name, image: $image, url: $url, color: $color, width: $width)';
}


}

/// @nodoc
abstract mixin class $ToolsModelCopyWith<$Res>  {
  factory $ToolsModelCopyWith(ToolsModel value, $Res Function(ToolsModel) _then) = _$ToolsModelCopyWithImpl;
@useResult
$Res call({
 String name, String image, String url, String color, int width
});




}
/// @nodoc
class _$ToolsModelCopyWithImpl<$Res>
    implements $ToolsModelCopyWith<$Res> {
  _$ToolsModelCopyWithImpl(this._self, this._then);

  final ToolsModel _self;
  final $Res Function(ToolsModel) _then;

/// Create a copy of ToolsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? image = null,Object? url = null,Object? color = null,Object? width = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolsModel].
extension ToolsModelPatterns on ToolsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolsModel value)  $default,){
final _that = this;
switch (_that) {
case _ToolsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ToolsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String image,  String url,  String color,  int width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolsModel() when $default != null:
return $default(_that.name,_that.image,_that.url,_that.color,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String image,  String url,  String color,  int width)  $default,) {final _that = this;
switch (_that) {
case _ToolsModel():
return $default(_that.name,_that.image,_that.url,_that.color,_that.width);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String image,  String url,  String color,  int width)?  $default,) {final _that = this;
switch (_that) {
case _ToolsModel() when $default != null:
return $default(_that.name,_that.image,_that.url,_that.color,_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToolsModel implements ToolsModel {
  const _ToolsModel({required this.name, required this.image, required this.url, required this.color, required this.width});
  factory _ToolsModel.fromJson(Map<String, dynamic> json) => _$ToolsModelFromJson(json);

@override final  String name;
@override final  String image;
@override final  String url;
@override final  String color;
@override final  int width;

/// Create a copy of ToolsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolsModelCopyWith<_ToolsModel> get copyWith => __$ToolsModelCopyWithImpl<_ToolsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToolsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolsModel&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.url, url) || other.url == url)&&(identical(other.color, color) || other.color == color)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,image,url,color,width);

@override
String toString() {
  return 'ToolsModel(name: $name, image: $image, url: $url, color: $color, width: $width)';
}


}

/// @nodoc
abstract mixin class _$ToolsModelCopyWith<$Res> implements $ToolsModelCopyWith<$Res> {
  factory _$ToolsModelCopyWith(_ToolsModel value, $Res Function(_ToolsModel) _then) = __$ToolsModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String image, String url, String color, int width
});




}
/// @nodoc
class __$ToolsModelCopyWithImpl<$Res>
    implements _$ToolsModelCopyWith<$Res> {
  __$ToolsModelCopyWithImpl(this._self, this._then);

  final _ToolsModel _self;
  final $Res Function(_ToolsModel) _then;

/// Create a copy of ToolsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? image = null,Object? url = null,Object? color = null,Object? width = null,}) {
  return _then(_ToolsModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
