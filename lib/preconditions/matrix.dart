// ignore_for_file: unused_element

import 'package:design_by_contract/annotation.dart';

part 'matrix.g.dart';

@Contract()
class Matrix {
  final List<List<double>> data;

  Matrix(this.data);

  @Precondition({
    'other.data.length == data.length && other.data.first.length == data.first.length':
        'Matrices must have the same dimensions for addition.',
  })
  Matrix _add(Matrix other) {
    List<List<double>> result = [];
    for (int i = 0; i < data.length; i++) {
      List<double> row = [];
      for (int j = 0; j < data[i].length; j++) {
        row.add(data[i][j] + other.data[i][j]);
      }
      result.add(row);
    }
    return Matrix(result);
  }

  @Precondition({
    'data.first.length == other.data.length':
        'Number of columns of the first matrix must equal the number of rows of the second matrix for multiplication.',
  })
  Matrix _multiply(Matrix other) {
    List<List<double>> result = [];
    for (int i = 0; i < data.length; i++) {
      List<double> row = [];
      for (int j = 0; j < other.data[0].length; j++) {
        double sum = 0;
        for (int k = 0; k < data[i].length; k++) {
          sum += data[i][k] * other.data[k][j];
        }
        row.add(sum);
      }
      result.add(row);
    }
    return Matrix(result);
  }
}
