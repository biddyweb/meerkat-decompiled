package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitWriterBuffer;
import java.nio.ByteBuffer;

public class DTSSpecificBox extends AbstractBox
{
  public static final String TYPE = "ddts";
  long DTSSamplingFrequency;
  int LBRDurationMod;
  long avgBitRate;
  int channelLayout;
  int coreLFEPresent;
  int coreLayout;
  int coreSize;
  int frameDuration;
  long maxBitRate;
  int multiAssetFlag;
  int pcmSampleDepth;
  int representationType;
  int reserved;
  int reservedBoxPresent;
  int stereoDownmix;
  int streamConstruction;

  public DTSSpecificBox()
  {
    super("ddts");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.DTSSamplingFrequency = IsoTypeReader.readUInt32(paramByteBuffer);
    this.maxBitRate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.avgBitRate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.pcmSampleDepth = IsoTypeReader.readUInt8(paramByteBuffer);
    BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer(paramByteBuffer);
    this.frameDuration = localBitReaderBuffer.readBits(2);
    this.streamConstruction = localBitReaderBuffer.readBits(5);
    this.coreLFEPresent = localBitReaderBuffer.readBits(1);
    this.coreLayout = localBitReaderBuffer.readBits(6);
    this.coreSize = localBitReaderBuffer.readBits(14);
    this.stereoDownmix = localBitReaderBuffer.readBits(1);
    this.representationType = localBitReaderBuffer.readBits(3);
    this.channelLayout = localBitReaderBuffer.readBits(16);
    this.multiAssetFlag = localBitReaderBuffer.readBits(1);
    this.LBRDurationMod = localBitReaderBuffer.readBits(1);
    this.reservedBoxPresent = localBitReaderBuffer.readBits(1);
    this.reserved = localBitReaderBuffer.readBits(5);
  }

  public long getAvgBitRate()
  {
    return this.avgBitRate;
  }

  public int getChannelLayout()
  {
    return this.channelLayout;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.DTSSamplingFrequency);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.maxBitRate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.avgBitRate);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.pcmSampleDepth);
    BitWriterBuffer localBitWriterBuffer = new BitWriterBuffer(paramByteBuffer);
    localBitWriterBuffer.writeBits(this.frameDuration, 2);
    localBitWriterBuffer.writeBits(this.streamConstruction, 5);
    localBitWriterBuffer.writeBits(this.coreLFEPresent, 1);
    localBitWriterBuffer.writeBits(this.coreLayout, 6);
    localBitWriterBuffer.writeBits(this.coreSize, 14);
    localBitWriterBuffer.writeBits(this.stereoDownmix, 1);
    localBitWriterBuffer.writeBits(this.representationType, 3);
    localBitWriterBuffer.writeBits(this.channelLayout, 16);
    localBitWriterBuffer.writeBits(this.multiAssetFlag, 1);
    localBitWriterBuffer.writeBits(this.LBRDurationMod, 1);
    localBitWriterBuffer.writeBits(this.reservedBoxPresent, 1);
    localBitWriterBuffer.writeBits(this.reserved, 5);
  }

  protected long getContentSize()
  {
    return 20L;
  }

  public int getCoreLFEPresent()
  {
    return this.coreLFEPresent;
  }

  public int getCoreLayout()
  {
    return this.coreLayout;
  }

  public int getCoreSize()
  {
    return this.coreSize;
  }

  public long getDTSSamplingFrequency()
  {
    return this.DTSSamplingFrequency;
  }

  @DoNotParseDetail
  public int[] getDashAudioChannelConfiguration()
  {
    int i = getChannelLayout();
    int j = i & 0x1;
    int k = 0;
    int m = 0;
    if (j == 1)
    {
      m = 0 + 1;
      k = 0x0 | 0x4;
    }
    if ((i & 0x2) == 2)
    {
      m += 2;
      k = 0x2 | (k | 0x1);
    }
    if ((i & 0x4) == 4)
    {
      m += 2;
      k = 0x20 | (k | 0x10);
    }
    if ((i & 0x8) == 8)
    {
      m++;
      k |= 8;
    }
    if ((i & 0x10) == 16)
    {
      m++;
      k |= 256;
    }
    if ((i & 0x20) == 32)
    {
      m += 2;
      k = 0x4000 | (k | 0x1000);
    }
    if ((i & 0x40) == 64)
    {
      m += 2;
      k = 0x20 | (k | 0x10);
    }
    if ((i & 0x80) == 128)
    {
      m++;
      k |= 8192;
    }
    if ((i & 0x100) == 256)
    {
      m++;
      k |= 2048;
    }
    if ((i & 0x200) == 512)
    {
      m += 2;
      k = 0x80 | (k | 0x40);
    }
    if ((i & 0x400) == 1024)
    {
      m += 2;
      k = 0x400 | (k | 0x200);
    }
    if ((i & 0x800) == 2048)
    {
      m += 2;
      k = 0x20 | (k | 0x10);
    }
    if ((i & 0x1000) == 4096)
    {
      m++;
      k |= 8;
    }
    if ((i & 0x2000) == 8192)
    {
      m += 2;
      k = 0x20 | (k | 0x10);
    }
    if ((i & 0x4000) == 16384)
    {
      m++;
      k |= 65536;
    }
    if ((i & 0x8000) == 32768)
    {
      m += 2;
      k = 0x20000 | (k | 0x8000);
    }
    if ((i & 0x10000) == 65536)
      m++;
    if ((i & 0x20000) == 131072)
      m += 2;
    return new int[] { m, k };
  }

  public int getFrameDuration()
  {
    return this.frameDuration;
  }

  public int getLBRDurationMod()
  {
    return this.LBRDurationMod;
  }

  public long getMaxBitRate()
  {
    return this.maxBitRate;
  }

  public int getMultiAssetFlag()
  {
    return this.multiAssetFlag;
  }

  public int getPcmSampleDepth()
  {
    return this.pcmSampleDepth;
  }

  public int getRepresentationType()
  {
    return this.representationType;
  }

  public int getReserved()
  {
    return this.reserved;
  }

  public int getReservedBoxPresent()
  {
    return this.reservedBoxPresent;
  }

  public int getStereoDownmix()
  {
    return this.stereoDownmix;
  }

  public int getStreamConstruction()
  {
    return this.streamConstruction;
  }

  public void setAvgBitRate(long paramLong)
  {
    this.avgBitRate = paramLong;
  }

  public void setChannelLayout(int paramInt)
  {
    this.channelLayout = paramInt;
  }

  public void setCoreLFEPresent(int paramInt)
  {
    this.coreLFEPresent = paramInt;
  }

  public void setCoreLayout(int paramInt)
  {
    this.coreLayout = paramInt;
  }

  public void setCoreSize(int paramInt)
  {
    this.coreSize = paramInt;
  }

  public void setDTSSamplingFrequency(long paramLong)
  {
    this.DTSSamplingFrequency = paramLong;
  }

  public void setFrameDuration(int paramInt)
  {
    this.frameDuration = paramInt;
  }

  public void setLBRDurationMod(int paramInt)
  {
    this.LBRDurationMod = paramInt;
  }

  public void setMaxBitRate(long paramLong)
  {
    this.maxBitRate = paramLong;
  }

  public void setMultiAssetFlag(int paramInt)
  {
    this.multiAssetFlag = paramInt;
  }

  public void setPcmSampleDepth(int paramInt)
  {
    this.pcmSampleDepth = paramInt;
  }

  public void setRepresentationType(int paramInt)
  {
    this.representationType = paramInt;
  }

  public void setReserved(int paramInt)
  {
    this.reserved = paramInt;
  }

  public void setReservedBoxPresent(int paramInt)
  {
    this.reservedBoxPresent = paramInt;
  }

  public void setStereoDownmix(int paramInt)
  {
    this.stereoDownmix = paramInt;
  }

  public void setStreamConstruction(int paramInt)
  {
    this.streamConstruction = paramInt;
  }
}