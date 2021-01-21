import 'package:flutter/material.dart';
import 'package:spa_coding_exercise/presentation/page/page_body_parameters.dart';

abstract class PageBody<P extends PageBodyParameters> extends StatelessWidget {
  final P parameters;

  const PageBody(this.parameters);
}
