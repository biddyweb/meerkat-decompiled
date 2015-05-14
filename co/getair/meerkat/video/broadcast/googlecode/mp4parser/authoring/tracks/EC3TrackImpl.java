package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.EC3SpecificBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.EC3SpecificBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class EC3TrackImpl extends AbstractTrack
{
  private static final long MAX_FRAMES_PER_MMAP = 20L;
  private List<BitStreamInfo> bitStreamInfos = new LinkedList();
  private int bitrate;
  private final DataSource dataSource;
  private long[] decodingTimes;
  private int frameSize;
  SampleDescriptionBox sampleDescriptionBox;
  private List<Sample> samples;
  TrackMetaData trackMetaData = new TrackMetaData();

  public EC3TrackImpl(DataSource paramDataSource)
    throws IOException
  {
    super(paramDataSource.toString());
    this.dataSource = paramDataSource;
    int i = 0;
    while (i == 0)
    {
      BitStreamInfo localBitStreamInfo3 = readVariables();
      if (localBitStreamInfo3 == null)
        throw new IOException();
      Iterator localIterator3 = this.bitStreamInfos.iterator();
      while (localIterator3.hasNext())
      {
        BitStreamInfo localBitStreamInfo4 = (BitStreamInfo)localIterator3.next();
        if ((localBitStreamInfo3.strmtyp != 1) && (localBitStreamInfo4.substreamid == localBitStreamInfo3.substreamid))
          i = 1;
      }
      if (i == 0)
        this.bitStreamInfos.add(localBitStreamInfo3);
    }
    if (this.bitStreamInfos.size() == 0)
      throw new IOException();
    int j = ((BitStreamInfo)this.bitStreamInfos.get(0)).samplerate;
    this.sampleDescriptionBox = new SampleDescriptionBox();
    AudioSampleEntry localAudioSampleEntry = new AudioSampleEntry("ec-3");
    localAudioSampleEntry.setChannelCount(2);
    localAudioSampleEntry.setSampleRate(j);
    localAudioSampleEntry.setDataReferenceIndex(1);
    localAudioSampleEntry.setSampleSize(16);
    EC3SpecificBox localEC3SpecificBox = new EC3SpecificBox();
    int[] arrayOfInt1 = new int[this.bitStreamInfos.size()];
    int[] arrayOfInt2 = new int[this.bitStreamInfos.size()];
    Iterator localIterator1 = this.bitStreamInfos.iterator();
    while (localIterator1.hasNext())
    {
      BitStreamInfo localBitStreamInfo2 = (BitStreamInfo)localIterator1.next();
      if (localBitStreamInfo2.strmtyp == 1)
      {
        int k = localBitStreamInfo2.substreamid;
        arrayOfInt1[k] = (1 + arrayOfInt1[k]);
        arrayOfInt2[localBitStreamInfo2.substreamid] = (0x100 & localBitStreamInfo2.chanmap >> 6 | 0xFF & localBitStreamInfo2.chanmap >> 5);
      }
    }
    Iterator localIterator2 = this.bitStreamInfos.iterator();
    while (localIterator2.hasNext())
    {
      BitStreamInfo localBitStreamInfo1 = (BitStreamInfo)localIterator2.next();
      if (localBitStreamInfo1.strmtyp != 1)
      {
        EC3SpecificBox.Entry localEntry = new EC3SpecificBox.Entry();
        localEntry.fscod = localBitStreamInfo1.fscod;
        localEntry.bsid = localBitStreamInfo1.bsid;
        localEntry.bsmod = localBitStreamInfo1.bsmod;
        localEntry.acmod = localBitStreamInfo1.acmod;
        localEntry.lfeon = localBitStreamInfo1.lfeon;
        localEntry.reserved = 0;
        localEntry.num_dep_sub = arrayOfInt1[localBitStreamInfo1.substreamid];
        localEntry.chan_loc = arrayOfInt2[localBitStreamInfo1.substreamid];
        localEntry.reserved2 = 0;
        localEC3SpecificBox.addEntry(localEntry);
      }
      this.bitrate += localBitStreamInfo1.bitrate;
      this.frameSize += localBitStreamInfo1.frameSize;
    }
    localEC3SpecificBox.setDataRate(this.bitrate / 1000);
    localAudioSampleEntry.addBox(localEC3SpecificBox);
    this.sampleDescriptionBox.addBox(localAudioSampleEntry);
    this.trackMetaData.setCreationTime(new Date());
    this.trackMetaData.setModificationTime(new Date());
    this.trackMetaData.setTimescale(j);
    this.trackMetaData.setVolume(1.0F);
    paramDataSource.position(0L);
    this.samples = readSamples();
    this.decodingTimes = new long[this.samples.size()];
    Arrays.fill(this.decodingTimes, 1536L);
  }

  private List<Sample> readSamples()
    throws IOException
  {
    int i = CastUtils.l2i((this.dataSource.size() - this.dataSource.position()) / this.frameSize);
    ArrayList localArrayList = new ArrayList(i);
    for (int j = 0; j < i; j++)
      localArrayList.add(new Sample()
      {
        public ByteBuffer asByteBuffer()
        {
          try
          {
            ByteBuffer localByteBuffer = EC3TrackImpl.this.dataSource.map(this.val$start, EC3TrackImpl.this.frameSize);
            return localByteBuffer;
          }
          catch (IOException localIOException)
          {
            throw new RuntimeException(localIOException);
          }
        }

        public long getSize()
        {
          return EC3TrackImpl.this.frameSize;
        }

        public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
          throws IOException
        {
          EC3TrackImpl.this.dataSource.transferTo(this.val$start, EC3TrackImpl.this.frameSize, paramAnonymousWritableByteChannel);
        }
      });
    return localArrayList;
  }

  private BitStreamInfo readVariables()
    throws IOException
  {
    long l = this.dataSource.position();
    ByteBuffer localByteBuffer = ByteBuffer.allocate(200);
    this.dataSource.read(localByteBuffer);
    localByteBuffer.rewind();
    BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer(localByteBuffer);
    if (localBitReaderBuffer.readBits(16) != 2935)
      return null;
    BitStreamInfo localBitStreamInfo = new BitStreamInfo();
    localBitStreamInfo.strmtyp = localBitReaderBuffer.readBits(2);
    localBitStreamInfo.substreamid = localBitReaderBuffer.readBits(3);
    localBitStreamInfo.frameSize = (2 * (1 + localBitReaderBuffer.readBits(11)));
    localBitStreamInfo.fscod = localBitReaderBuffer.readBits(2);
    int i = -1;
    int j;
    int k;
    label176: int m;
    if (localBitStreamInfo.fscod == 3)
    {
      i = localBitReaderBuffer.readBits(2);
      j = 3;
      k = 0;
      switch (j)
      {
      default:
        localBitStreamInfo.frameSize *= 6 / k;
        localBitStreamInfo.acmod = localBitReaderBuffer.readBits(3);
        localBitStreamInfo.lfeon = localBitReaderBuffer.readBits(1);
        localBitStreamInfo.bsid = localBitReaderBuffer.readBits(5);
        localBitReaderBuffer.readBits(5);
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(8);
        if (localBitStreamInfo.acmod == 0)
        {
          localBitReaderBuffer.readBits(5);
          if (1 == localBitReaderBuffer.readBits(1))
            localBitReaderBuffer.readBits(8);
        }
        if ((1 == localBitStreamInfo.strmtyp) && (1 == localBitReaderBuffer.readBits(1)))
          localBitStreamInfo.chanmap = localBitReaderBuffer.readBits(16);
        if (1 == localBitReaderBuffer.readBits(1))
        {
          if (localBitStreamInfo.acmod > 2)
            localBitReaderBuffer.readBits(2);
          if ((1 == (0x1 & localBitStreamInfo.acmod)) && (localBitStreamInfo.acmod > 2))
          {
            localBitReaderBuffer.readBits(3);
            localBitReaderBuffer.readBits(3);
          }
          if ((0x4 & localBitStreamInfo.acmod) > 0)
          {
            localBitReaderBuffer.readBits(3);
            localBitReaderBuffer.readBits(3);
          }
          if ((1 == localBitStreamInfo.lfeon) && (1 == localBitReaderBuffer.readBits(1)))
            localBitReaderBuffer.readBits(5);
          if (localBitStreamInfo.strmtyp == 0)
          {
            if (1 == localBitReaderBuffer.readBits(1))
              localBitReaderBuffer.readBits(6);
            if ((localBitStreamInfo.acmod == 0) && (1 == localBitReaderBuffer.readBits(1)))
              localBitReaderBuffer.readBits(6);
            if (1 == localBitReaderBuffer.readBits(1))
              localBitReaderBuffer.readBits(6);
            m = localBitReaderBuffer.readBits(2);
            if (1 != m)
              break;
            localBitReaderBuffer.readBits(5);
            label515: if (localBitStreamInfo.acmod < 2)
            {
              if (1 == localBitReaderBuffer.readBits(1))
                localBitReaderBuffer.readBits(14);
              if ((localBitStreamInfo.acmod == 0) && (1 == localBitReaderBuffer.readBits(1)))
                localBitReaderBuffer.readBits(14);
              if (1 == localBitReaderBuffer.readBits(1))
              {
                if (j != 0)
                  break label993;
                localBitReaderBuffer.readBits(5);
              }
            }
          }
        }
        if (1 == localBitReaderBuffer.readBits(1))
          localBitStreamInfo.bsmod = localBitReaderBuffer.readBits(3);
        switch (localBitStreamInfo.fscod)
        {
        default:
        case 0:
        case 1:
        case 2:
        case 3:
        }
        break;
      case 0:
      case 1:
      case 2:
      case 3:
      }
    }
    while (true)
    {
      if (localBitStreamInfo.samplerate != 0)
        break label1137;
      return null;
      j = localBitReaderBuffer.readBits(2);
      break;
      k = 1;
      break label176;
      k = 2;
      break label176;
      k = 3;
      break label176;
      k = 6;
      break label176;
      if (2 == m)
      {
        localBitReaderBuffer.readBits(12);
        break label515;
      }
      if (3 != m)
        break label515;
      int n = localBitReaderBuffer.readBits(5);
      if (1 == localBitReaderBuffer.readBits(1))
      {
        localBitReaderBuffer.readBits(5);
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(4);
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(4);
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(4);
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(4);
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(4);
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(4);
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(4);
        if (1 == localBitReaderBuffer.readBits(1))
        {
          if (1 == localBitReaderBuffer.readBits(1))
            localBitReaderBuffer.readBits(4);
          if (1 == localBitReaderBuffer.readBits(1))
            localBitReaderBuffer.readBits(4);
        }
      }
      if (1 == localBitReaderBuffer.readBits(1))
      {
        localBitReaderBuffer.readBits(5);
        if (1 == localBitReaderBuffer.readBits(1))
        {
          localBitReaderBuffer.readBits(7);
          if (1 == localBitReaderBuffer.readBits(1))
            localBitReaderBuffer.readBits(8);
        }
      }
      for (int i1 = 0; i1 < n + 2; i1++)
        localBitReaderBuffer.readBits(8);
      localBitReaderBuffer.byteSync();
      break label515;
      label993: for (int i2 = 0; i2 < k; i2++)
        if (1 == localBitReaderBuffer.readBits(1))
          localBitReaderBuffer.readBits(5);
      localBitStreamInfo.samplerate = 48000;
      continue;
      localBitStreamInfo.samplerate = 44100;
      continue;
      localBitStreamInfo.samplerate = 32000;
      continue;
      switch (i)
      {
      default:
        break;
      case 0:
        localBitStreamInfo.samplerate = 24000;
        break;
      case 1:
        localBitStreamInfo.samplerate = 22050;
        break;
      case 2:
        localBitStreamInfo.samplerate = 16000;
        break;
      case 3:
        localBitStreamInfo.samplerate = 0;
      }
    }
    label1137: localBitStreamInfo.bitrate = ((int)(8.0D * (localBitStreamInfo.samplerate / 1536.0D * localBitStreamInfo.frameSize)));
    this.dataSource.position(l + localBitStreamInfo.frameSize);
    return localBitStreamInfo;
  }

  public void close()
    throws IOException
  {
    this.dataSource.close();
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return null;
  }

  public String getHandler()
  {
    return "soun";
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return null;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.sampleDescriptionBox;
  }

  public long[] getSampleDurations()
  {
    return this.decodingTimes;
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return null;
  }

  public long[] getSyncSamples()
  {
    return null;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.trackMetaData;
  }

  public String toString()
  {
    return "EC3TrackImpl{bitrate=" + this.bitrate + ", bitStreamInfos=" + this.bitStreamInfos + '}';
  }

  public static class BitStreamInfo extends EC3SpecificBox.Entry
  {
    public int bitrate;
    public int chanmap;
    public int frameSize;
    public int samplerate;
    public int strmtyp;
    public int substreamid;

    public String toString()
    {
      return "BitStreamInfo{frameSize=" + this.frameSize + ", substreamid=" + this.substreamid + ", bitrate=" + this.bitrate + ", samplerate=" + this.samplerate + ", strmtyp=" + this.strmtyp + ", chanmap=" + this.chanmap + '}';
    }
  }
}