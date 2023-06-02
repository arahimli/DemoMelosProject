import 'package:core/constants/environments.dart';

import 'injection/injection_container.dart';
import 'main_common.dart';

void main() => mainCommon(
      Environment.development,
      [
        environmentProvider.overrideWithValue(Environment.development),
      ],
    );
