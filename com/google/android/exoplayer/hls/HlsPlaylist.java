package com.google.android.exoplayer.hls;

import android.net.Uri;

public abstract class HlsPlaylist
{
  public static final int TYPE_MASTER = 0;
  public static final int TYPE_MEDIA = 1;
  public final Uri baseUri;
  public final int type;

  protected HlsPlaylist(Uri paramUri, int paramInt)
  {
    this.baseUri = paramUri;
    this.type = paramInt;
  }
}