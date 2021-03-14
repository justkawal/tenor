part of tenor;

/// determines the type of categories returned
///
/// values: (featured | emoji | trending)
enum CategoryType {
  /// `featuerd` categories will be returned
  featured,

  /// `emoji` categories will be returned
  emoji,

  /// `trending` categories will be returned
  trending,
}

/// GIFs with `aspect ratios` that fit with in the selected range.
///
/// values: (all | wide | standard)
///
/// `all` - no constraints
///
/// `wide` - 0.42 <= aspect ratio <= 2.36
///
/// `standard` - .56 <= aspect ratio <= 1.78
///
enum GifSize {
  /// `all` - no constraints
  all,

  /// `wide` - 0.42 <= aspect ratio <= 2.36
  wide,

  /// `standard` - .56 <= aspect ratio <= 1.78
  standard,
}

/// specifies the content safety filter level
///
/// values: (off | low | medium | high)
enum ContentFilter {
  /// turns `off` content safety
  off,

  /// sets the content safety filter to `low`
  low,

  /// sets the content safety filter to `medium`
  medium,

  /// sets the content safety filter to `high`
  high,
}

/// Sets the GIF formats to be fetched.
///
/// values: (minimal | basic)
///
/// minimal -> tinygif, gif, and mp4
///
/// basic -> nanomp4, tinygif, tinymp4, gif, mp4, and nanogif
enum MediaFilter {
  /// Sets the GIF formats to `minimal`
  ///
  /// minimal -> tinygif, gif, and mp4
  minimal,

  /// Sets the GIF formats to `basic`
  ///
  /// basic -> nanomp4, tinygif, tinymp4, gif, mp4, and nanogif
  basic,
}
