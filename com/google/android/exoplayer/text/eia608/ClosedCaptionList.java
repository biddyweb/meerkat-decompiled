package com.google.android.exoplayer.text.eia608;

final class ClosedCaptionList
  implements Comparable<ClosedCaptionList>
{
  public final ClosedCaption[] captions;
  public final boolean decodeOnly;
  public final long timeUs;

  public ClosedCaptionList(long paramLong, boolean paramBoolean, ClosedCaption[] paramArrayOfClosedCaption)
  {
    this.timeUs = paramLong;
    this.decodeOnly = paramBoolean;
    this.captions = paramArrayOfClosedCaption;
  }

  public int compareTo(ClosedCaptionList paramClosedCaptionList)
  {
    long l = this.timeUs - paramClosedCaptionList.timeUs;
    if (l == 0L)
      return 0;
    if (l > 0L)
      return 1;
    return -1;
  }
}