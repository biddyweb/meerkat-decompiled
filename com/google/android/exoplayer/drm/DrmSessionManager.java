package com.google.android.exoplayer.drm;

import android.annotation.TargetApi;
import android.media.MediaCrypto;
import java.util.Map;
import java.util.UUID;

@TargetApi(16)
public abstract interface DrmSessionManager
{
  public static final int STATE_CLOSED = 1;
  public static final int STATE_ERROR = 0;
  public static final int STATE_OPENED = 3;
  public static final int STATE_OPENED_WITH_KEYS = 4;
  public static final int STATE_OPENING = 2;

  public abstract void close();

  public abstract Exception getError();

  public abstract MediaCrypto getMediaCrypto();

  public abstract int getState();

  public abstract void open(Map<UUID, byte[]> paramMap, String paramString);

  public abstract boolean requiresSecureDecoderComponent(String paramString);
}