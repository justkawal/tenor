library tenor;

/// imports
import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:universal_io/io.dart';

/// service
part 'src/service/category_fetcher.dart';
part 'src/service/server_request.dart';
part 'src/service/gif_fetcher.dart';
part 'src/service/search_suggestions.dart';

/// utility
part 'src/utility/enums.dart';

/// model
part 'src/model/tenor_gif_type.dart';
part 'src/model/tenor_gif.dart';
part 'src/model/category.dart';
part 'src/model/tenor_response.dart';
part 'src/model/tenor_result.dart';

/// main class
part 'src/tenor.dart';
