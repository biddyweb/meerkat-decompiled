package com.google.android.exoplayer.mp4;

import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;

public final class Mp4TrackSampleTable
{
  public final int[] flags;
  public final long[] offsets;
  public final int[] sizes;
  public final long[] timestampsUs;

  Mp4TrackSampleTable(long[] paramArrayOfLong1, int[] paramArrayOfInt1, long[] paramArrayOfLong2, int[] paramArrayOfInt2)
  {
    boolean bool2;
    boolean bool3;
    if (paramArrayOfInt1.length == paramArrayOfLong2.length)
    {
      bool2 = bool1;
      Assertions.checkArgument(bool2);
      if (paramArrayOfLong1.length != paramArrayOfLong2.length)
        break label80;
      bool3 = bool1;
      label34: Assertions.checkArgument(bool3);
      if (paramArrayOfInt2.length != paramArrayOfLong2.length)
        break label86;
    }
    while (true)
    {
      Assertions.checkArgument(bool1);
      this.offsets = paramArrayOfLong1;
      this.sizes = paramArrayOfInt1;
      this.timestampsUs = paramArrayOfLong2;
      this.flags = paramArrayOfInt2;
      return;
      bool2 = false;
      break;
      label80: bool3 = false;
      break label34;
      label86: bool1 = false;
    }
  }

  public int getIndexOfEarlierOrEqualSynchronizationSample(long paramLong)
  {
    for (int i = Util.binarySearchFloor(this.timestampsUs, paramLong, true, false); i >= 0; i--)
      if ((this.timestampsUs[i] <= paramLong) && ((0x1 & this.flags[i]) != 0))
        return i;
    return -1;
  }

  public int getIndexOfLaterOrEqualSynchronizationSample(long paramLong)
  {
    for (int i = Util.binarySearchCeil(this.timestampsUs, paramLong, true, false); i < this.timestampsUs.length; i++)
      if ((this.timestampsUs[i] >= paramLong) && ((0x1 & this.flags[i]) != 0))
        return i;
    return -1;
  }

  public int getSampleCount()
  {
    return this.sizes.length;
  }
}