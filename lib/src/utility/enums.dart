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
  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: High quality single frame GIF format; smaller in size than the GIF format
  /// - Dimensions: Original upload dimensions (no limits)
  /// - Usage notes: Make this the first frame of the content. It's intended for use as a thumbnail preview.
  preview,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: High-quality GIF format; largest file size available
  /// - Dimensions: Original upload dimensions (no limits)
  /// - Usage notes: Use this size for GIF shares on desktop.
  gif,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Small reduction in size of the GIF format
  /// - Dimensions: Original upload dimensions (no limits) but much higher compression rate
  /// - Usage notes: Use this size for GIF previews on desktop.
  mediumgif,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Reduced size of the GIF format
  /// - Dimensions: Up to 220 pixels wide. Height scaled to preserve the aspect ratio.
  /// - Usage notes: Use this size for GIF previews and shares on mobile.
  tinygif,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Smallest size of the GIF format
  /// - Dimensions: Up to 90 pixels tall. Width scaled to preserve the aspect ratio.
  /// - Usage notes: Use this size for GIF previews on mobile.
  nanogif,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Highest quality video format; largest of the video formats, but smaller than GIF
  /// - Dimensions: Similar to GIF but padded to fit video container specifications, which are usually 8-pixel increments.
  /// - Usage notes: Use this size for MP4 previews and shares on desktop.
  mp4,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Highest quality video format; larger in size than MP4
  /// - Dimensions: Similar to GIF but padded to fit video container specifications, which are usually 8-pixel increments.
  /// - Usage notes: Use this size for MP4 shares when you want the video clip to run a few times rather than only once.
  loopedmp4,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Reduced size of the MP4 format
  /// - Dimensions: Variable width and height, with a maximum bounding box of 320x320 pixels
  /// - Usage notes: Use this size for MP4 previews and shares on mobile.
  tinymp4,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Smallest size of the MP4 format
  /// - Dimensions: Variable width and height, with a maximum bounding box of 150x150 pixels
  /// - Usage notes: Use this size for MP4 previews on mobile.
  nanomp4,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Lower quality video format; smaller in size than MP4
  /// - Dimensions: Similar to GIF but padded to fit video container specifications, which are usually 8-pixel increments.
  /// - Usage notes: Use this size for WebM previews and shares on desktop.
  webm,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Reduced size of the WebM format
  /// - Dimensions: Variable width and height, with a maximum bounding box of 320x320 pixels
  /// - Usage notes: Use this size for GIF shares on mobile.
  tinywebm,

  /// This format is supported for GIFs and stickers.
  /// - Resolution and size: Smallest size of the WebM format
  /// - Dimensions: Variable width and height, with a maximum bounding box of 150x150 pixels
  /// - Usage notes: Use this size for GIF previews on mobile.
  nanowebm,

  /// This format is supported for stickers.
  /// - Resolution and size: High-quality WebP sticker format; largest file size available
  /// - Dimensions: Original upload dimensions (no limits)
  /// - Usage notes: Use this size for sticker shares for high-bandwidth users.
  webp_transparent,

  /// This format is supported for stickers.
  /// - Resolution and size: Reduced size of the WebP sticker format; maximum size of 500 KB
  /// - Dimensions: Up to 220x220 pixels, height scaled to preserve the aspect ratio.
  /// - Usage notes: Use this size for sticker previews for high-bandwidth users and shares for low-bandwidth users.
  tinywebp_transparent,

  /// This format is supported for stickers.
  /// - Resolution and size: Smallest size of the WebP sticker format; maximum size of 100 KB
  /// - Dimensions: Up to 90x90 pixels, with the width scaled to preserve the aspect ratio.
  /// - Usage notes: Use this size for sticker previews for low-bandwidth users.
  nanowebp_transparent,

  /// This format is supported for stickers.
  /// - Resolution and size: High-quality GIF sticker format; largest file size available
  /// - Dimensions: Original upload dimensions (no limits)
  /// - Usage notes: Use this size for sticker shares for high-bandwidth users.
  gif_transparent,

  /// This format is supported for stickers.
  /// - Resolution and size: Reduced size of the GIF sticker format; maximum size of 500 KB
  /// - Dimensions: Up to 220x220 pixels, with the height scaled to preserve the aspect ratio.
  /// - Usage notes: Use this size for sticker previews for high-bandwidth users and shares for low-bandwidth users.
  tinygif_transparent,

  /// This format is supported for stickers.
  /// - Resolution and size: Smallest size of the GIF sticker format; maximum size of 100 KB
  /// - Dimensions: Up to 90x90 pixels, with the width scaled to preserve the aspect ratio.
  /// - Usage notes: Use this size for sticker previews for low-bandwidth users.
  nanogif_transparent,
}
