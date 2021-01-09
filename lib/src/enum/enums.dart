part of tenor;
/// specify the content safety filter level
/// 
/// default: high
/// 
/// values: (off | low | medium | high)
enum ContentFilter {
  off,
  low,
  medium,
  high,
}

/// Reduce the Number of GIF formats returned in the GIF_OBJECT list.
/// 
/// default: `minimal`
/// 
/// values: (`basic` | `minimal`)
/// 
/// `minimal` - `tinygif`, `gif`, and `mp4`.
/// 
/// `basic` - `nanomp4`, `tinygif`, `tinymp4`, `gif`, `mp4`, and `nanogif`
/// 
enum MediaFilter {
  basic,
  minimal,
}
