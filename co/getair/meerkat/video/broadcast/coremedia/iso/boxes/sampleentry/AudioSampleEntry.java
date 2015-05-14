package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public final class AudioSampleEntry extends AbstractSampleEntry
{
  public static final String TYPE1 = "samr";
  public static final String TYPE10 = "mlpa";
  public static final String TYPE11 = "dtsl";
  public static final String TYPE12 = "dtsh";
  public static final String TYPE13 = "dtse";
  public static final String TYPE2 = "sawb";
  public static final String TYPE3 = "mp4a";
  public static final String TYPE4 = "drms";
  public static final String TYPE5 = "alac";
  public static final String TYPE7 = "owma";
  public static final String TYPE8 = "ac-3";
  public static final String TYPE9 = "ec-3";
  public static final String TYPE_ENCRYPTED = "enca";
  private long bytesPerFrame;
  private long bytesPerPacket;
  private long bytesPerSample;
  private int channelCount;
  private int compressionId;
  private int packetSize;
  private int reserved1;
  private long reserved2;
  private long sampleRate;
  private int sampleSize;
  private long samplesPerPacket;
  private int soundVersion;
  private byte[] soundVersion2Data;

  public AudioSampleEntry(String paramString)
  {
    super(paramString);
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    int i;
    ByteBuffer localByteBuffer;
    if (this.soundVersion == 1)
    {
      i = 16;
      int j = i + 28;
      int k = this.soundVersion;
      int m = 0;
      if (k == 2)
        m = 36;
      localByteBuffer = ByteBuffer.allocate(j + m);
      localByteBuffer.position(6);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.dataReferenceIndex);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.soundVersion);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.reserved1);
      IsoTypeWriter.writeUInt32(localByteBuffer, this.reserved2);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.channelCount);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.sampleSize);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.compressionId);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.packetSize);
      if (!this.type.equals("mlpa"))
        break label282;
      IsoTypeWriter.writeUInt32(localByteBuffer, getSampleRate());
    }
    while (true)
    {
      if (this.soundVersion == 1)
      {
        IsoTypeWriter.writeUInt32(localByteBuffer, this.samplesPerPacket);
        IsoTypeWriter.writeUInt32(localByteBuffer, this.bytesPerPacket);
        IsoTypeWriter.writeUInt32(localByteBuffer, this.bytesPerFrame);
        IsoTypeWriter.writeUInt32(localByteBuffer, this.bytesPerSample);
      }
      if (this.soundVersion == 2)
      {
        IsoTypeWriter.writeUInt32(localByteBuffer, this.samplesPerPacket);
        IsoTypeWriter.writeUInt32(localByteBuffer, this.bytesPerPacket);
        IsoTypeWriter.writeUInt32(localByteBuffer, this.bytesPerFrame);
        IsoTypeWriter.writeUInt32(localByteBuffer, this.bytesPerSample);
        localByteBuffer.put(this.soundVersion2Data);
      }
      paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
      writeContainer(paramWritableByteChannel);
      return;
      i = 0;
      break;
      label282: IsoTypeWriter.writeUInt32(localByteBuffer, getSampleRate() << 16);
    }
  }

  public long getBytesPerFrame()
  {
    return this.bytesPerFrame;
  }

  public long getBytesPerPacket()
  {
    return this.bytesPerPacket;
  }

  public long getBytesPerSample()
  {
    return this.bytesPerSample;
  }

  public int getChannelCount()
  {
    return this.channelCount;
  }

  public int getCompressionId()
  {
    return this.compressionId;
  }

  public int getPacketSize()
  {
    return this.packetSize;
  }

  public int getReserved1()
  {
    return this.reserved1;
  }

  public long getReserved2()
  {
    return this.reserved2;
  }

  public long getSampleRate()
  {
    return this.sampleRate;
  }

  public int getSampleSize()
  {
    return this.sampleSize;
  }

  public long getSamplesPerPacket()
  {
    return this.samplesPerPacket;
  }

  public long getSize()
  {
    int i = 16;
    int j;
    long l;
    if (this.soundVersion == 1)
    {
      j = i;
      int k = j + 28;
      int m = this.soundVersion;
      int n = 0;
      if (m == 2)
        n = 36;
      l = k + n + getContainerSize();
      if ((!this.largeBox) && (8L + l < 4294967296L))
        break label80;
    }
    while (true)
    {
      return l + i;
      j = 0;
      break;
      label80: i = 8;
    }
  }

  public int getSoundVersion()
  {
    return this.soundVersion;
  }

  public byte[] getSoundVersion2Data()
  {
    return this.soundVersion2Data;
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    ByteBuffer localByteBuffer1 = ByteBuffer.allocate(28);
    paramDataSource.read(localByteBuffer1);
    localByteBuffer1.position(6);
    this.dataReferenceIndex = IsoTypeReader.readUInt16(localByteBuffer1);
    this.soundVersion = IsoTypeReader.readUInt16(localByteBuffer1);
    this.reserved1 = IsoTypeReader.readUInt16(localByteBuffer1);
    this.reserved2 = IsoTypeReader.readUInt32(localByteBuffer1);
    this.channelCount = IsoTypeReader.readUInt16(localByteBuffer1);
    this.sampleSize = IsoTypeReader.readUInt16(localByteBuffer1);
    this.compressionId = IsoTypeReader.readUInt16(localByteBuffer1);
    this.packetSize = IsoTypeReader.readUInt16(localByteBuffer1);
    this.sampleRate = IsoTypeReader.readUInt32(localByteBuffer1);
    if (!this.type.equals("mlpa"))
      this.sampleRate >>>= 16;
    if (this.soundVersion == 1)
    {
      ByteBuffer localByteBuffer4 = ByteBuffer.allocate(16);
      paramDataSource.read(localByteBuffer4);
      localByteBuffer4.rewind();
      this.samplesPerPacket = IsoTypeReader.readUInt32(localByteBuffer4);
      this.bytesPerPacket = IsoTypeReader.readUInt32(localByteBuffer4);
      this.bytesPerFrame = IsoTypeReader.readUInt32(localByteBuffer4);
      this.bytesPerSample = IsoTypeReader.readUInt32(localByteBuffer4);
    }
    if (this.soundVersion == 2)
    {
      ByteBuffer localByteBuffer3 = ByteBuffer.allocate(36);
      paramDataSource.read(localByteBuffer3);
      localByteBuffer3.rewind();
      this.samplesPerPacket = IsoTypeReader.readUInt32(localByteBuffer3);
      this.bytesPerPacket = IsoTypeReader.readUInt32(localByteBuffer3);
      this.bytesPerFrame = IsoTypeReader.readUInt32(localByteBuffer3);
      this.bytesPerSample = IsoTypeReader.readUInt32(localByteBuffer3);
      this.soundVersion2Data = new byte[20];
      localByteBuffer3.get(this.soundVersion2Data);
    }
    if ("owma".equals(this.type))
    {
      System.err.println("owma");
      long l3 = paramLong - 28L;
      int k;
      long l4;
      if (this.soundVersion == 1)
      {
        k = 16;
        l4 = l3 - k;
        if (this.soundVersion != 2)
          break label387;
      }
      label387: for (int m = 36; ; m = 0)
      {
        final long l5 = l4 - m;
        ByteBuffer localByteBuffer2 = ByteBuffer.allocate(CastUtils.l2i(l5));
        paramDataSource.read(localByteBuffer2);
        addBox(new Box()
        {
          static
          {
            if (!AudioSampleEntry.class.desiredAssertionStatus());
            for (boolean bool = true; ; bool = false)
            {
              $assertionsDisabled = bool;
              return;
            }
          }

          public void getBox(WritableByteChannel paramAnonymousWritableByteChannel)
            throws IOException
          {
            this.val$owmaSpecifics.rewind();
            paramAnonymousWritableByteChannel.write(this.val$owmaSpecifics);
          }

          public long getOffset()
          {
            return 0L;
          }

          public Container getParent()
          {
            return AudioSampleEntry.this;
          }

          public long getSize()
          {
            return l5;
          }

          public String getType()
          {
            return "----";
          }

          public void parse(DataSource paramAnonymousDataSource, ByteBuffer paramAnonymousByteBuffer, long paramAnonymousLong, BoxParser paramAnonymousBoxParser)
            throws IOException
          {
            throw new RuntimeException("NotImplemented");
          }

          public void setParent(Container paramAnonymousContainer)
          {
            assert (paramAnonymousContainer == AudioSampleEntry.this) : "you cannot diswown this special box";
          }
        });
        return;
        k = 0;
        break;
      }
    }
    long l1 = paramLong - 28L;
    int i;
    long l2;
    if (this.soundVersion == 1)
    {
      i = 16;
      l2 = l1 - i;
      if (this.soundVersion != 2)
        break label452;
    }
    label452: for (int j = 36; ; j = 0)
    {
      initContainer(paramDataSource, l2 - j, paramBoxParser);
      return;
      i = 0;
      break;
    }
  }

  public void setBytesPerFrame(long paramLong)
  {
    this.bytesPerFrame = paramLong;
  }

  public void setBytesPerPacket(long paramLong)
  {
    this.bytesPerPacket = paramLong;
  }

  public void setBytesPerSample(long paramLong)
  {
    this.bytesPerSample = paramLong;
  }

  public void setChannelCount(int paramInt)
  {
    this.channelCount = paramInt;
  }

  public void setCompressionId(int paramInt)
  {
    this.compressionId = paramInt;
  }

  public void setPacketSize(int paramInt)
  {
    this.packetSize = paramInt;
  }

  public void setReserved1(int paramInt)
  {
    this.reserved1 = paramInt;
  }

  public void setReserved2(long paramLong)
  {
    this.reserved2 = paramLong;
  }

  public void setSampleRate(long paramLong)
  {
    this.sampleRate = paramLong;
  }

  public void setSampleSize(int paramInt)
  {
    this.sampleSize = paramInt;
  }

  public void setSamplesPerPacket(long paramLong)
  {
    this.samplesPerPacket = paramLong;
  }

  public void setSoundVersion(int paramInt)
  {
    this.soundVersion = paramInt;
  }

  public void setSoundVersion2Data(byte[] paramArrayOfByte)
  {
    this.soundVersion2Data = paramArrayOfByte;
  }

  public void setType(String paramString)
  {
    this.type = paramString;
  }

  public String toString()
  {
    return "AudioSampleEntry{bytesPerSample=" + this.bytesPerSample + ", bytesPerFrame=" + this.bytesPerFrame + ", bytesPerPacket=" + this.bytesPerPacket + ", samplesPerPacket=" + this.samplesPerPacket + ", packetSize=" + this.packetSize + ", compressionId=" + this.compressionId + ", soundVersion=" + this.soundVersion + ", sampleRate=" + this.sampleRate + ", sampleSize=" + this.sampleSize + ", channelCount=" + this.channelCount + ", boxes=" + getBoxes() + '}';
  }
}