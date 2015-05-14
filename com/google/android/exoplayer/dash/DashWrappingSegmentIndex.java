package com.google.android.exoplayer.dash;

import android.net.Uri;
import com.google.android.exoplayer.chunk.parser.SegmentIndex;
import com.google.android.exoplayer.dash.mpd.RangedUri;
import com.google.android.exoplayer.util.Util;

public class DashWrappingSegmentIndex
  implements DashSegmentIndex
{
  private final long indexAnchor;
  private final SegmentIndex segmentIndex;
  private final Uri uri;

  public DashWrappingSegmentIndex(SegmentIndex paramSegmentIndex, Uri paramUri, long paramLong)
  {
    this.segmentIndex = paramSegmentIndex;
    this.uri = paramUri;
    this.indexAnchor = paramLong;
  }

  public long getDurationUs(int paramInt)
  {
    return this.segmentIndex.durationsUs[paramInt];
  }

  public int getFirstSegmentNum()
  {
    return 0;
  }

  public int getLastSegmentNum()
  {
    return -1 + this.segmentIndex.length;
  }

  public int getSegmentNum(long paramLong)
  {
    return Util.binarySearchFloor(this.segmentIndex.timesUs, paramLong, true, true);
  }

  public RangedUri getSegmentUrl(int paramInt)
  {
    return new RangedUri(this.uri, null, this.indexAnchor + this.segmentIndex.offsets[paramInt], this.segmentIndex.sizes[paramInt]);
  }

  public long getTimeUs(int paramInt)
  {
    return this.segmentIndex.timesUs[paramInt];
  }

  public boolean isExplicit()
  {
    return true;
  }
}