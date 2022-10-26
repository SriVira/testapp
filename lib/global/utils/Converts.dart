// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, unused_local_variable, non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_null_comparison


class Converts {

  static bool ConvertStringToBool(String value) {
    bool? returnval = false;
    if (value.toLowerCase() == 'true') {
      returnval = true;
    } else if (value.toLowerCase() == 'false' || value == null || value == '') {
      returnval = false;
    } else {
      returnval = false;
    }
    return returnval;
  }

}

