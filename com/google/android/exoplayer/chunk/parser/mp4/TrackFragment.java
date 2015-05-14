package com.google.android.exoplayer.chunk.parser.mp4;

import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import com.google.android.exoplayer.util.ParsableByteArray;

final class TrackFragment
{
  public boolean definesEncryptionData;
  public int length;
  public int[] sampleCompositionTimeOffsetTable;
  public long[] sampleDecodingTimeTable;
  public int sampleDescriptionIndex;
  public ParsableByteArray sampleEncryptionData;
  public int sampleEncryptionDataLength;
  public boolean sampleEncryptionDataNeedsFill;
  public boolean[] sampleHasSubsampleEncryptionTable;
  public boolean[] sampleIsSyncFrameTable;
  public int[] sampleSizeTable;

  public void fillEncryptionData(ParsableByteArray paramParsableByteArray)
  {
    paramParsableByteArray.readBytes(this.sampleEncryptionData.data, 0, this.sampleEncryptionDataLength);
    this.sampleEncryptionData.setPosition(0);
    this.sampleEncryptionDataNeedsFill = false;
  }

  public boolean fillEncryptionData(NonBlockingInputStream paramNonBlockingInputStream)
  {
    if (paramNonBlockingInputStream.getAvailableByteCount() < this.sampleEncryptionDataLength)
      return false;
    paramNonBlockingInputStream.read(this.sampleEncryptionData.data, 0, this.sampleEncryptionDataLength);
    this.sampleEncryptionData.setPosition(0);
    this.sampleEncryptionDataNeedsFill = false;
    return true;
  }

  public long getSamplePresentationTime(int paramInt)
  {
    return this.sampleDecodingTimeTable[paramInt] + this.sampleCompositionTimeOffsetTable[paramInt];
  }

  public void initEncryptionData(int paramInt)
  {
    if ((this.sampleEncryptionData == null) || (this.sampleEncryptionData.limit() < paramInt))
      this.sampleEncryptionData = new ParsableByteArray(paramInt);
    this.sampleEncryptionDataLength = paramInt;
    this.definesEncryptionData = true;
    this.sampleEncryptionDataNeedsFill = true;
  }

  public void initTables(int paramInt)
  {
    this.length = paramInt;
    if ((this.sampleSizeTable == null) || (this.sampleSizeTable.length < this.length))
    {
      int i = paramInt * 125 / 100;
      this.sampleSizeTable = new int[i];
      this.sampleCompositionTimeOffsetTable = new int[i];
      this.sampleDecodingTimeTable = new long[i];
      this.sampleIsSyncFrameTable = new boolean[i];
      this.sampleHasSubsampleEncryptionTable = new boolean[i];
    }
  }

  public void reset()
  {
    this.length = 0;
    this.definesEncryptionData = false;
    this.sampleEncryptionDataNeedsFill = false;
  }
}