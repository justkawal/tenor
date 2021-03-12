part of tenor;

/// specify the content safety filter level
///
/// default: `off`
///
/// values: (off | low | medium | high)
enum ContentFilter {
  off,
  low,
  medium,
  high,
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
enum MediaFilter {
  /// minimal -> tinygif, gif, and mp4
  minimal,

  /// basic -> nanomp4, tinygif, tinymp4, gif, mp4, and nanogif
  basic,
}
