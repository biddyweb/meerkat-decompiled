package com.google.android.exoplayer;

import java.nio.ByteBuffer;

public final class SampleHolder
{
  public static final int BUFFER_REPLACEMENT_MODE_DIRECT = 2;
  public static final int BUFFER_REPLACEMENT_MODE_DISABLED = 0;
  public static final int BUFFER_REPLACEMENT_MODE_NORMAL = 1;
  private final int bufferReplacementMode;
  public final CryptoInfo cryptoInfo = new CryptoInfo();
  public ByteBuffer data;
  public boolean decodeOnly;
  public int flags;
  public int size;
  public long timeUs;

  public SampleHolder(int paramInt)
  {
    this.bufferReplacementMode = paramInt;
  }

  public void clearData()
  {
    if (this.data != null)
      this.data.clear();
  }

  public boolean replaceBuffer(int paramInt)
  {
    switch (this.bufferReplacementMode)
    {
    default:
      return false;
    case 1:
      this.data = ByteBuffer.allocate(paramInt);
      return true;
    case 2:
    }
    this.data = ByteBuffer.allocateDirect(paramInt);
    return true;
  }
}