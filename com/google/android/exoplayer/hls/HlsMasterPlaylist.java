package com.google.android.exoplayer.hls;

import android.net.Uri;
import java.util.List;

public final class HlsMasterPlaylist extends HlsPlaylist
{
  public final List<Variant> variants;

  public HlsMasterPlaylist(Uri paramUri, List<Variant> paramList)
  {
    super(paramUri, 0);
    this.variants = paramList;
  }
}