package com.google.android.exoplayer.chunk.parser.mp4;

final class DefaultSampleValues
{
  public final int duration;
  public final int flags;
  public final int sampleDescriptionIndex;
  public final int size;

  public DefaultSampleValues(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.sampleDescriptionIndex = paramInt1;
    this.duration = paramInt2;
    this.size = paramInt3;
    this.flags = paramInt4;
  }
}