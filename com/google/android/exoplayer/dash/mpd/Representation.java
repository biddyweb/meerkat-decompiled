package com.google.android.exoplayer.dash.mpd;

import android.net.Uri;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.dash.DashSegmentIndex;
import com.google.android.exoplayer.dash.DashSingleSegmentIndex;

public abstract class Representation
{
  public final String contentId;
  public final Format format;
  private final RangedUri initializationUri;
  public final long periodDurationMs;
  public final long periodStartMs;
  public final long presentationTimeOffsetUs;
  public final long revisionId;

  private Representation(long paramLong1, long paramLong2, String paramString, long paramLong3, Format paramFormat, SegmentBase paramSegmentBase)
  {
    this.periodStartMs = paramLong1;
    this.periodDurationMs = paramLong2;
    this.contentId = paramString;
    this.revisionId = paramLong3;
    this.format = paramFormat;
    this.initializationUri = paramSegmentBase.getInitialization(this);
    this.presentationTimeOffsetUs = paramSegmentBase.getPresentationTimeOffsetUs();
  }

  public static Representation newInstance(long paramLong1, long paramLong2, String paramString, long paramLong3, Format paramFormat, SegmentBase paramSegmentBase)
  {
    if ((paramSegmentBase instanceof SegmentBase.SingleSegmentBase))
      return new SingleSegmentRepresentation(paramLong1, paramLong2, paramString, paramLong3, paramFormat, (SegmentBase.SingleSegmentBase)paramSegmentBase, -1L);
    if ((paramSegmentBase instanceof SegmentBase.MultiSegmentBase))
      return new MultiSegmentRepresentation(paramLong1, paramLong2, paramString, paramLong3, paramFormat, (SegmentBase.MultiSegmentBase)paramSegmentBase);
    throw new IllegalArgumentException("segmentBase must be of type SingleSegmentBase or MultiSegmentBase");
  }

  public String getCacheKey()
  {
    return this.contentId + "." + this.format.id + "." + this.revisionId;
  }

  public abstract DashSegmentIndex getIndex();

  public abstract RangedUri getIndexUri();

  public RangedUri getInitializationUri()
  {
    return this.initializationUri;
  }

  public static class MultiSegmentRepresentation extends Representation
    implements DashSegmentIndex
  {
    private final SegmentBase.MultiSegmentBase segmentBase;

    public MultiSegmentRepresentation(long paramLong1, long paramLong2, String paramString, long paramLong3, Format paramFormat, SegmentBase.MultiSegmentBase paramMultiSegmentBase)
    {
      super(paramLong2, paramString, paramLong3, paramFormat, paramMultiSegmentBase, null);
      this.segmentBase = paramMultiSegmentBase;
    }

    public long getDurationUs(int paramInt)
    {
      return this.segmentBase.getSegmentDurationUs(paramInt);
    }

    public int getFirstSegmentNum()
    {
      return this.segmentBase.getFirstSegmentNum();
    }

    public DashSegmentIndex getIndex()
    {
      return this;
    }

    public RangedUri getIndexUri()
    {
      return null;
    }

    public int getLastSegmentNum()
    {
      return this.segmentBase.getLastSegmentNum();
    }

    public int getSegmentNum(long paramLong)
    {
      return this.segmentBase.getSegmentNum(paramLong);
    }

    public RangedUri getSegmentUrl(int paramInt)
    {
      return this.segmentBase.getSegmentUrl(this, paramInt);
    }

    public long getTimeUs(int paramInt)
    {
      return this.segmentBase.getSegmentTimeUs(paramInt);
    }

    public boolean isExplicit()
    {
      return this.segmentBase.isExplicit();
    }
  }

  public static class SingleSegmentRepresentation extends Representation
  {
    public final long contentLength;
    private final RangedUri indexUri;
    private final DashSingleSegmentIndex segmentIndex;
    public final Uri uri;

    public SingleSegmentRepresentation(long paramLong1, long paramLong2, String paramString, long paramLong3, Format paramFormat, SegmentBase.SingleSegmentBase paramSingleSegmentBase, long paramLong4)
    {
      super(paramLong2, paramString, paramLong3, paramFormat, paramSingleSegmentBase, null);
      this.uri = paramSingleSegmentBase.uri;
      this.indexUri = paramSingleSegmentBase.getIndex();
      this.contentLength = paramLong4;
      if (this.indexUri != null);
      long l1;
      long l2;
      RangedUri localRangedUri;
      for (DashSingleSegmentIndex localDashSingleSegmentIndex = null; ; localDashSingleSegmentIndex = new DashSingleSegmentIndex(l1, l2, localRangedUri))
      {
        this.segmentIndex = localDashSingleSegmentIndex;
        return;
        l1 = paramLong1 * 1000L;
        l2 = paramLong2 * 1000L;
        localRangedUri = new RangedUri(this.uri, null, 0L, -1L);
      }
    }

    public static SingleSegmentRepresentation newInstance(long paramLong1, long paramLong2, String paramString, long paramLong3, Format paramFormat, Uri paramUri, long paramLong4, long paramLong5, long paramLong6, long paramLong7, long paramLong8)
    {
      return new SingleSegmentRepresentation(paramLong1, paramLong2, paramString, paramLong3, paramFormat, new SegmentBase.SingleSegmentBase(new RangedUri(paramUri, null, paramLong4, 1L + (paramLong5 - paramLong4)), 1L, 0L, paramUri, paramLong6, 1L + (paramLong7 - paramLong6)), paramLong8);
    }

    public DashSegmentIndex getIndex()
    {
      return this.segmentIndex;
    }

    public RangedUri getIndexUri()
    {
      return this.indexUri;
    }
  }
}