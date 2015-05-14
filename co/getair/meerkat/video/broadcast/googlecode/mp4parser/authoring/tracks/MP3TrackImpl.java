package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.SampleImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.ESDescriptorBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.DecoderConfigDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.SLConfigDescriptor;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class MP3TrackImpl extends AbstractTrack
{
  private static final int[] BIT_RATE = { 0, 32000, 40000, 48000, 56000, 64000, 80000, 96000, 112000, 128000, 160000, 192000, 224000, 256000, 320000, 0 };
  private static final int ES_OBJECT_TYPE_INDICATION = 107;
  private static final int ES_STREAM_TYPE = 5;
  private static final int MPEG_L3 = 1;
  private static final int MPEG_V1 = 3;
  private static final int SAMPLES_PER_FRAME = 1152;
  private static final int[] SAMPLE_RATE = { 44100, 48000, 32000, 0 };
  long avgBitRate;
  private final DataSource dataSource;
  private long[] durations;
  MP3Header firstHeader;
  long maxBitRate;
  SampleDescriptionBox sampleDescriptionBox;
  private List<Sample> samples;
  TrackMetaData trackMetaData = new TrackMetaData();

  public MP3TrackImpl(DataSource paramDataSource)
    throws IOException
  {
    this(paramDataSource, "eng");
  }

  public MP3TrackImpl(DataSource paramDataSource, String paramString)
    throws IOException
  {
    super(paramDataSource.toString());
    this.dataSource = paramDataSource;
    this.samples = new LinkedList();
    this.firstHeader = readSamples(paramDataSource);
    double d1 = this.firstHeader.sampleRate / 1152.0D;
    double d2 = this.samples.size() / d1;
    long l = 0L;
    LinkedList localLinkedList = new LinkedList();
    Iterator localIterator1 = this.samples.iterator();
    while (localIterator1.hasNext())
    {
      int i = (int)((Sample)localIterator1.next()).getSize();
      l += i;
      localLinkedList.add(Integer.valueOf(i));
      while (localLinkedList.size() > d1)
        localLinkedList.pop();
      if (localLinkedList.size() == (int)d1)
      {
        int j = 0;
        Iterator localIterator2 = localLinkedList.iterator();
        while (localIterator2.hasNext())
          j += ((Integer)localIterator2.next()).intValue();
        double d3 = d1 * (8.0D * j / localLinkedList.size());
        if (d3 > this.maxBitRate)
          this.maxBitRate = ((int)d3);
      }
    }
    this.avgBitRate = ((int)(8L * l / d2));
    this.sampleDescriptionBox = new SampleDescriptionBox();
    AudioSampleEntry localAudioSampleEntry = new AudioSampleEntry("mp4a");
    localAudioSampleEntry.setChannelCount(this.firstHeader.channelCount);
    localAudioSampleEntry.setSampleRate(this.firstHeader.sampleRate);
    localAudioSampleEntry.setDataReferenceIndex(1);
    localAudioSampleEntry.setSampleSize(16);
    ESDescriptorBox localESDescriptorBox = new ESDescriptorBox();
    ESDescriptor localESDescriptor = new ESDescriptor();
    localESDescriptor.setEsId(0);
    SLConfigDescriptor localSLConfigDescriptor = new SLConfigDescriptor();
    localSLConfigDescriptor.setPredefined(2);
    localESDescriptor.setSlConfigDescriptor(localSLConfigDescriptor);
    DecoderConfigDescriptor localDecoderConfigDescriptor = new DecoderConfigDescriptor();
    localDecoderConfigDescriptor.setObjectTypeIndication(107);
    localDecoderConfigDescriptor.setStreamType(5);
    localDecoderConfigDescriptor.setMaxBitRate(this.maxBitRate);
    localDecoderConfigDescriptor.setAvgBitRate(this.avgBitRate);
    localESDescriptor.setDecoderConfigDescriptor(localDecoderConfigDescriptor);
    localESDescriptorBox.setData(localESDescriptor.serialize());
    localAudioSampleEntry.addBox(localESDescriptorBox);
    this.sampleDescriptionBox.addBox(localAudioSampleEntry);
    this.trackMetaData.setCreationTime(new Date());
    this.trackMetaData.setModificationTime(new Date());
    this.trackMetaData.setLanguage(paramString);
    this.trackMetaData.setVolume(1.0F);
    this.trackMetaData.setTimescale(this.firstHeader.sampleRate);
    this.durations = new long[this.samples.size()];
    Arrays.fill(this.durations, 1152L);
  }

  private MP3Header readMP3Header(DataSource paramDataSource)
    throws IOException
  {
    MP3Header localMP3Header = new MP3Header();
    ByteBuffer localByteBuffer = ByteBuffer.allocate(4);
    while (localByteBuffer.position() < 4)
      if (paramDataSource.read(localByteBuffer) == -1)
        return null;
    BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer((ByteBuffer)localByteBuffer.rewind());
    if (localBitReaderBuffer.readBits(11) != 2047)
      throw new IOException("Expected Start Word 0x7ff");
    localMP3Header.mpegVersion = localBitReaderBuffer.readBits(2);
    if (localMP3Header.mpegVersion != 3)
      throw new IOException("Expected MPEG Version 1 (ISO/IEC 11172-3)");
    localMP3Header.layer = localBitReaderBuffer.readBits(2);
    if (localMP3Header.layer != 1)
      throw new IOException("Expected Layer III");
    localMP3Header.protectionAbsent = localBitReaderBuffer.readBits(1);
    localMP3Header.bitRateIndex = localBitReaderBuffer.readBits(4);
    localMP3Header.bitRate = BIT_RATE[localMP3Header.bitRateIndex];
    if (localMP3Header.bitRate == 0)
      throw new IOException("Unexpected (free/bad) bit rate");
    localMP3Header.sampleFrequencyIndex = localBitReaderBuffer.readBits(2);
    localMP3Header.sampleRate = SAMPLE_RATE[localMP3Header.sampleFrequencyIndex];
    if (localMP3Header.sampleRate == 0)
      throw new IOException("Unexpected (reserved) sample rate frequency");
    localMP3Header.padding = localBitReaderBuffer.readBits(1);
    localBitReaderBuffer.readBits(1);
    localMP3Header.channelMode = localBitReaderBuffer.readBits(2);
    if (localMP3Header.channelMode == 3);
    for (int i = 1; ; i = 2)
    {
      localMP3Header.channelCount = i;
      return localMP3Header;
    }
  }

  private MP3Header readSamples(DataSource paramDataSource)
    throws IOException
  {
    Object localObject = null;
    while (true)
    {
      long l = paramDataSource.position();
      MP3Header localMP3Header = readMP3Header(paramDataSource);
      if (localMP3Header == null)
        return localObject;
      if (localObject == null)
        localObject = localMP3Header;
      paramDataSource.position(l);
      ByteBuffer localByteBuffer = ByteBuffer.allocate(localMP3Header.getFrameLength());
      paramDataSource.read(localByteBuffer);
      localByteBuffer.rewind();
      this.samples.add(new SampleImpl(localByteBuffer));
    }
  }

  public void close()
    throws IOException
  {
    this.dataSource.close();
  }

  public String getHandler()
  {
    return "soun";
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.sampleDescriptionBox;
  }

  public long[] getSampleDurations()
  {
    return this.durations;
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.trackMetaData;
  }

  public String toString()
  {
    return "MP3TrackImpl";
  }

  class MP3Header
  {
    int bitRate;
    int bitRateIndex;
    int channelCount;
    int channelMode;
    int layer;
    int mpegVersion;
    int padding;
    int protectionAbsent;
    int sampleFrequencyIndex;
    int sampleRate;

    MP3Header()
    {
    }

    int getFrameLength()
    {
      return 144 * this.bitRate / this.sampleRate + this.padding;
    }
  }
}