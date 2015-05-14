package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.nio.ByteBuffer;

public class SampleFlags
{
  private byte is_leading;
  private byte reserved;
  private int sampleDegradationPriority;
  private byte sampleDependsOn;
  private byte sampleHasRedundancy;
  private byte sampleIsDependedOn;
  private boolean sampleIsDifferenceSample;
  private byte samplePaddingValue;

  public SampleFlags()
  {
  }

  public SampleFlags(ByteBuffer paramByteBuffer)
  {
    long l = IsoTypeReader.readUInt32(paramByteBuffer);
    this.reserved = ((byte)(int)((0xF0000000 & l) >> 28));
    this.is_leading = ((byte)(int)((0xC000000 & l) >> 26));
    this.sampleDependsOn = ((byte)(int)((0x3000000 & l) >> 24));
    this.sampleIsDependedOn = ((byte)(int)((0xC00000 & l) >> 22));
    this.sampleHasRedundancy = ((byte)(int)((0x300000 & l) >> 20));
    this.samplePaddingValue = ((byte)(int)((0xE0000 & l) >> 17));
    if ((0x10000 & l) >> 16 > 0L);
    for (boolean bool = true; ; bool = false)
    {
      this.sampleIsDifferenceSample = bool;
      this.sampleDegradationPriority = ((int)(0xFFFF & l));
      return;
    }
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    SampleFlags localSampleFlags;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localSampleFlags = (SampleFlags)paramObject;
      if (this.is_leading != localSampleFlags.is_leading)
        return false;
      if (this.reserved != localSampleFlags.reserved)
        return false;
      if (this.sampleDegradationPriority != localSampleFlags.sampleDegradationPriority)
        return false;
      if (this.sampleDependsOn != localSampleFlags.sampleDependsOn)
        return false;
      if (this.sampleHasRedundancy != localSampleFlags.sampleHasRedundancy)
        return false;
      if (this.sampleIsDependedOn != localSampleFlags.sampleIsDependedOn)
        return false;
      if (this.sampleIsDifferenceSample != localSampleFlags.sampleIsDifferenceSample)
        return false;
    }
    while (this.samplePaddingValue == localSampleFlags.samplePaddingValue);
    return false;
  }

  public void getContent(ByteBuffer paramByteBuffer)
  {
    long l = 0L | this.reserved << 28 | this.is_leading << 26 | this.sampleDependsOn << 24 | this.sampleIsDependedOn << 22 | this.sampleHasRedundancy << 20 | this.samplePaddingValue << 17;
    if (this.sampleIsDifferenceSample);
    for (int i = 1; ; i = 0)
    {
      IsoTypeWriter.writeUInt32(paramByteBuffer, l | i << 16 | this.sampleDegradationPriority);
      return;
    }
  }

  public int getReserved()
  {
    return this.reserved;
  }

  public int getSampleDegradationPriority()
  {
    return this.sampleDegradationPriority;
  }

  public int getSampleDependsOn()
  {
    return this.sampleDependsOn;
  }

  public int getSampleHasRedundancy()
  {
    return this.sampleHasRedundancy;
  }

  public int getSampleIsDependedOn()
  {
    return this.sampleIsDependedOn;
  }

  public int getSamplePaddingValue()
  {
    return this.samplePaddingValue;
  }

  public int hashCode()
  {
    int i = 31 * (31 * (31 * (31 * (31 * (31 * this.reserved + this.is_leading) + this.sampleDependsOn) + this.sampleIsDependedOn) + this.sampleHasRedundancy) + this.samplePaddingValue);
    if (this.sampleIsDifferenceSample);
    for (int j = 1; ; j = 0)
      return 31 * (i + j) + this.sampleDegradationPriority;
  }

  public boolean isSampleIsDifferenceSample()
  {
    return this.sampleIsDifferenceSample;
  }

  public void setReserved(int paramInt)
  {
    this.reserved = ((byte)paramInt);
  }

  public void setSampleDegradationPriority(int paramInt)
  {
    this.sampleDegradationPriority = paramInt;
  }

  public void setSampleDependsOn(int paramInt)
  {
    this.sampleDependsOn = ((byte)paramInt);
  }

  public void setSampleHasRedundancy(int paramInt)
  {
    this.sampleHasRedundancy = ((byte)paramInt);
  }

  public void setSampleIsDependedOn(int paramInt)
  {
    this.sampleIsDependedOn = ((byte)paramInt);
  }

  public void setSampleIsDifferenceSample(boolean paramBoolean)
  {
    this.sampleIsDifferenceSample = paramBoolean;
  }

  public void setSamplePaddingValue(int paramInt)
  {
    this.samplePaddingValue = ((byte)paramInt);
  }

  public String toString()
  {
    return "SampleFlags{reserved=" + this.reserved + ", isLeading=" + this.is_leading + ", depOn=" + this.sampleDependsOn + ", isDepOn=" + this.sampleIsDependedOn + ", hasRedundancy=" + this.sampleHasRedundancy + ", padValue=" + this.samplePaddingValue + ", isDiffSample=" + this.sampleIsDifferenceSample + ", degradPrio=" + this.sampleDegradationPriority + '}';
  }
}