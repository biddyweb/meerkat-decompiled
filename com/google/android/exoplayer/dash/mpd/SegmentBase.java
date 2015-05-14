package com.google.android.exoplayer.dash.mpd;

import android.net.Uri;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.util.Util;
import java.util.List;

public abstract class SegmentBase
{
  final RangedUri initialization;
  final long presentationTimeOffset;
  final long timescale;

  public SegmentBase(RangedUri paramRangedUri, long paramLong1, long paramLong2)
  {
    this.initialization = paramRangedUri;
    this.timescale = paramLong1;
    this.presentationTimeOffset = paramLong2;
  }

  public RangedUri getInitialization(Representation paramRepresentation)
  {
    return this.initialization;
  }

  public long getPresentationTimeOffsetUs()
  {
    return Util.scaleLargeTimestamp(this.presentationTimeOffset, 1000000L, this.timescale);
  }

  public static abstract class MultiSegmentBase extends SegmentBase
  {
    final long duration;
    final long periodDurationMs;
    final List<SegmentBase.SegmentTimelineElement> segmentTimeline;
    final int startNumber;

    public MultiSegmentBase(RangedUri paramRangedUri, long paramLong1, long paramLong2, long paramLong3, int paramInt, long paramLong4, List<SegmentBase.SegmentTimelineElement> paramList)
    {
      super(paramLong1, paramLong2);
      this.periodDurationMs = paramLong3;
      this.startNumber = paramInt;
      this.duration = paramLong4;
      this.segmentTimeline = paramList;
    }

    public int getFirstSegmentNum()
    {
      return this.startNumber;
    }

    public abstract int getLastSegmentNum();

    public final long getSegmentDurationUs(int paramInt)
    {
      if (this.segmentTimeline != null)
        return 1000000L * ((SegmentBase.SegmentTimelineElement)this.segmentTimeline.get(paramInt - this.startNumber)).duration / this.timescale;
      if (paramInt == getLastSegmentNum())
        return 1000L * this.periodDurationMs - getSegmentTimeUs(paramInt);
      return 1000000L * this.duration / this.timescale;
    }

    public int getSegmentNum(long paramLong)
    {
      int i = getFirstSegmentNum();
      int j = getLastSegmentNum();
      if (this.segmentTimeline == null)
      {
        long l2 = 1000000L * this.duration / this.timescale;
        int m = this.startNumber + (int)(paramLong / l2);
        if (m < i)
          m = i;
        while ((j == -1) || (m <= j))
          return m;
        return j;
      }
      while (i <= j)
      {
        int k = (i + j) / 2;
        long l1 = getSegmentTimeUs(k);
        if (l1 < paramLong)
          i = k + 1;
        else if (l1 > paramLong)
          j = k - 1;
        else
          return k;
      }
      return i - 1;
    }

    public final long getSegmentTimeUs(int paramInt)
    {
      if (this.segmentTimeline != null);
      for (long l = ((SegmentBase.SegmentTimelineElement)this.segmentTimeline.get(paramInt - this.startNumber)).startTime - this.presentationTimeOffset; ; l = (paramInt - this.startNumber) * this.duration)
        return Util.scaleLargeTimestamp(l, 1000000L, this.timescale);
    }

    public abstract RangedUri getSegmentUrl(Representation paramRepresentation, int paramInt);

    public boolean isExplicit()
    {
      return this.segmentTimeline != null;
    }
  }

  public static class SegmentList extends SegmentBase.MultiSegmentBase
  {
    final List<RangedUri> mediaSegments;

    public SegmentList(RangedUri paramRangedUri, long paramLong1, long paramLong2, long paramLong3, int paramInt, long paramLong4, List<SegmentBase.SegmentTimelineElement> paramList, List<RangedUri> paramList1)
    {
      super(paramLong1, paramLong2, paramLong3, paramInt, paramLong4, paramList);
      this.mediaSegments = paramList1;
    }

    public int getLastSegmentNum()
    {
      return -1 + (this.startNumber + this.mediaSegments.size());
    }

    public RangedUri getSegmentUrl(Representation paramRepresentation, int paramInt)
    {
      return (RangedUri)this.mediaSegments.get(paramInt - this.startNumber);
    }

    public boolean isExplicit()
    {
      return true;
    }
  }

  public static class SegmentTemplate extends SegmentBase.MultiSegmentBase
  {
    private final Uri baseUrl;
    final UrlTemplate initializationTemplate;
    final UrlTemplate mediaTemplate;

    public SegmentTemplate(RangedUri paramRangedUri, long paramLong1, long paramLong2, long paramLong3, int paramInt, long paramLong4, List<SegmentBase.SegmentTimelineElement> paramList, UrlTemplate paramUrlTemplate1, UrlTemplate paramUrlTemplate2, Uri paramUri)
    {
      super(paramLong1, paramLong2, paramLong3, paramInt, paramLong4, paramList);
      this.initializationTemplate = paramUrlTemplate1;
      this.mediaTemplate = paramUrlTemplate2;
      this.baseUrl = paramUri;
    }

    public RangedUri getInitialization(Representation paramRepresentation)
    {
      if (this.initializationTemplate != null)
      {
        String str = this.initializationTemplate.buildUri(paramRepresentation.format.id, 0, paramRepresentation.format.bitrate, 0L);
        return new RangedUri(this.baseUrl, str, 0L, -1L);
      }
      return super.getInitialization(paramRepresentation);
    }

    public int getLastSegmentNum()
    {
      if (this.segmentTimeline != null)
        return -1 + (this.segmentTimeline.size() + this.startNumber);
      if (this.periodDurationMs == -1L)
        return -1;
      long l = 1000L * this.duration / this.timescale;
      return -1 + (this.startNumber + (int)((l + this.periodDurationMs - 1L) / l));
    }

    public RangedUri getSegmentUrl(Representation paramRepresentation, int paramInt)
    {
      if (this.segmentTimeline != null);
      for (long l = ((SegmentBase.SegmentTimelineElement)this.segmentTimeline.get(paramInt - this.startNumber)).startTime; ; l = (paramInt - this.startNumber) * this.duration)
      {
        String str = this.mediaTemplate.buildUri(paramRepresentation.format.id, paramInt, paramRepresentation.format.bitrate, l);
        return new RangedUri(this.baseUrl, str, 0L, -1L);
      }
    }
  }

  public static class SegmentTimelineElement
  {
    long duration;
    long startTime;

    public SegmentTimelineElement(long paramLong1, long paramLong2)
    {
      this.startTime = paramLong1;
      this.duration = paramLong2;
    }
  }

  public static class SingleSegmentBase extends SegmentBase
  {
    final long indexLength;
    final long indexStart;
    public final Uri uri;

    public SingleSegmentBase(Uri paramUri)
    {
      this(null, 1L, 0L, paramUri, 0L, -1L);
    }

    public SingleSegmentBase(RangedUri paramRangedUri, long paramLong1, long paramLong2, Uri paramUri, long paramLong3, long paramLong4)
    {
      super(paramLong1, paramLong2);
      this.uri = paramUri;
      this.indexStart = paramLong3;
      this.indexLength = paramLong4;
    }

    public RangedUri getIndex()
    {
      if (this.indexLength <= 0L)
        return null;
      return new RangedUri(this.uri, null, this.indexStart, this.indexLength);
    }
  }
}