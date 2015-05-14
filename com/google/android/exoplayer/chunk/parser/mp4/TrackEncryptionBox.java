package com.google.android.exoplayer.chunk.parser.mp4;

public final class TrackEncryptionBox
{
  public final int initializationVectorSize;
  public final boolean isEncrypted;
  public final byte[] keyId;

  public TrackEncryptionBox(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    this.isEncrypted = paramBoolean;
    this.initializationVectorSize = paramInt;
    this.keyId = paramArrayOfByte;
  }
}