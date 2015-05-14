package com.google.android.exoplayer.chunk.parser;

public final class SegmentIndex
{
  public final long[] durationsUs;
  public final int length;
  public final long[] offsets;
  public final int sizeBytes;
  public final int[] sizes;
  public final long[] timesUs;

  public SegmentIndex(int paramInt, int[] paramArrayOfInt, long[] paramArrayOfLong1, long[] paramArrayOfLong2, long[] paramArrayOfLong3)
  {
    this.sizeBytes = paramInt;
    this.length = paramArrayOfInt.length;
    this.sizes = paramArrayOfInt;
    this.offsets = paramArrayOfLong1;
    this.durationsUs = paramArrayOfLong2;
    this.timesUs = paramArrayOfLong3;
  }
}