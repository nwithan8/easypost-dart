import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/enums/file_format.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateBatchDocument extends Parameters {
  @JsonParameter(Necessity.required, ['file_format'])
  FileFormat? fileFormat;

  CreateBatchDocument() : super();
}
