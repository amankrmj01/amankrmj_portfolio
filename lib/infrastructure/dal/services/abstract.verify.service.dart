abstract class AbstractValidator<T> {
  Future<T> validate(String value);
}
