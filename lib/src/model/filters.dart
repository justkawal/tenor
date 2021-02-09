part of tenor;

/// specify the content safety filter level
///
/// default: `off`
///
/// values: (off | low | medium | high)
class ContentFilter {
  static const off = 'off';
  static const low = 'low';
  static const medium = 'medium';
  static const high = 'high';

  static const List<String> values = [off, low, medium, high];

  static String _findVal(String val) {
    if (val != null) {
      var index = values.indexOf(val);
      if (index != -1) {
        return values[index];
      }
    }
    return values[0];
  }
}

/// Sets the GIF formats to be fetched.
///
/// default: `minimal`
///
/// values: (minimal | basic)
///
/// minimal -> tinygif, gif, and mp4
///
/// basic -> nanomp4, tinygif, tinymp4, gif, mp4, and nanogif
class MediaFilter {
  /// minimal -> tinygif, gif, and mp4
  static const minimal = 'minimal';

  /// basic -> nanomp4, tinygif, tinymp4, gif, mp4, and nanogif
  static const basic = 'basic';

  static const values = [minimal, basic];

  static String _findVal(String val) {
    if (val != null) {
      var index = values.indexOf(val);
      if (index != -1) {
        return values[index];
      }
    }
    return values[0];
  }
}
