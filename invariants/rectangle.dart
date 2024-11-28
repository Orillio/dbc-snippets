// ignore_for_file: unused_field, unused_element

import '../annotation.dart';

@Contract({
  'width >= 0': 'Width must be non-negative.',
  'height >= 0': 'Height must be non-negative.',
})
class Rectangle {
  double _width;
  double _height;

  double get width => _width;
  double get height => _height;

  @Invariant()
  Rectangle._(this._width, this._height);

  @Invariant()
  void _scale(double factor) {
    _width *= factor;
    _height *= factor;
  }

  @Invariant()
  void _setWidth(double newWidth) {
    _width = newWidth;
  }

  @Invariant()
  void _setHeight(double newHeight) {
    _height = newHeight;
  }
}
