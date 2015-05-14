package com.google.android.exoplayer.hls;

import android.net.Uri;
import java.util.List;

public final class HlsMediaPlaylist extends HlsPlaylist
{
  public static final String ENCRYPTION_METHOD_AES_128 = "AES-128";
  public static final String ENCRYPTION_METHOD_NONE = "NONE";
  public final long durationUs;
  public final boolean live;
  public final int mediaSequence;
  public final List<Segment> segments;
  public final int targetDurationSecs;
  public final int version;

  public HlsMediaPlaylist(Uri paramUri, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, List<Segment> paramList)
  {
    super(paramUri, 1);
    this.mediaSequence = paramInt1;
    this.targetDurationSecs = paramInt2;
    this.version = paramInt3;
    this.live = paramBoolean;
    this.segments = paramList;
    if (!paramList.isEmpty())
    {
      Segment localSegment = (Segment)paramList.get(-1 + paramList.size());
      this.durationUs = (localSegment.startTimeUs + ()(1000000.0D * localSegment.durationSecs));
      return;
    }
    this.durationUs = 0L;
  }

  public static final class Segment
    implements Comparable<Long>
  {
    public final int byterangeLength;
    public final int byterangeOffset;
    public final boolean discontinuity;
    public final double durationSecs;
    public final String encryptionIV;
    public final String encryptionKeyUri;
    public final String encryptionMethod;
    public final long startTimeUs;
    public final String url;

    public Segment(String paramString1, double paramDouble, boolean paramBoolean, long paramLong, String paramString2, String paramString3, String paramString4, int paramInt1, int paramInt2)
    {
      this.url = paramString1;
      this.durationSecs = paramDouble;
      this.discontinuity = paramBoolean;
      this.startTimeUs = paramLong;
      this.encryptionMethod = paramString2;
      this.encryptionKeyUri = paramString3;
      this.encryptionIV = paramString4;
      this.byterangeOffset = paramInt1;
      this.byterangeLength = paramInt2;
    }

    public int compareTo(Long paramLong)
    {
      if (this.startTimeUs > paramLong.longValue())
        return 1;
      if (this.startTimeUs < paramLong.longValue())
        return -1;
      return 0;
    }
  }
}