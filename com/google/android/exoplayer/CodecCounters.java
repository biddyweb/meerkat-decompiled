package com.google.android.exoplayer;

public final class CodecCounters
{
  public int codecInitCount;
  public int codecReleaseCount;
  public int droppedOutputBufferCount;
  public int outputBuffersChangedCount;
  public int outputFormatChangedCount;
  public int renderedOutputBufferCount;
  public int skippedOutputBufferCount;

  public void ensureUpdated()
  {
  }

  public String getDebugString()
  {
    ensureUpdated();
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("cic(").append(this.codecInitCount).append(")");
    localStringBuilder.append("crc(").append(this.codecReleaseCount).append(")");
    localStringBuilder.append("ofc(").append(this.outputFormatChangedCount).append(")");
    localStringBuilder.append("obc(").append(this.outputBuffersChangedCount).append(")");
    localStringBuilder.append("ren(").append(this.renderedOutputBufferCount).append(")");
    localStringBuilder.append("sob(").append(this.skippedOutputBufferCount).append(")");
    localStringBuilder.append("dob(").append(this.droppedOutputBufferCount).append(")");
    return localStringBuilder.toString();
  }
}