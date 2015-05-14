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
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.ESDescriptorBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.AudioSpecificConfig;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.DecoderConfigDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.SLConfigDescriptor;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class AACTrackImpl extends AbstractTrack
{
  static Map<Integer, String> audioObjectTypes = new HashMap();
  public static Map<Integer, Integer> samplingFrequencyIndexMap;
  long avgBitRate;
  int bufferSizeDB;
  private DataSource dataSource;
  long[] decTimes;
  AdtsHeader firstHeader;
  private String lang = "eng";
  long maxBitRate;
  SampleDescriptionBox sampleDescriptionBox;
  private List<Sample> samples;
  TrackMetaData trackMetaData = new TrackMetaData();

  static
  {
    audioObjectTypes.put(Integer.valueOf(1), "AAC Main");
    audioObjectTypes.put(Integer.valueOf(2), "AAC LC (Low Complexity)");
    audioObjectTypes.put(Integer.valueOf(3), "AAC SSR (Scalable Sample Rate)");
    audioObjectTypes.put(Integer.valueOf(4), "AAC LTP (Long Term Prediction)");
    audioObjectTypes.put(Integer.valueOf(5), "SBR (Spectral Band Replication)");
    audioObjectTypes.put(Integer.valueOf(6), "AAC Scalable");
    audioObjectTypes.put(Integer.valueOf(7), "TwinVQ");
    audioObjectTypes.put(Integer.valueOf(8), "CELP (Code Excited Linear Prediction)");
    audioObjectTypes.put(Integer.valueOf(9), "HXVC (Harmonic Vector eXcitation Coding)");
    audioObjectTypes.put(Integer.valueOf(10), "Reserved");
    audioObjectTypes.put(Integer.valueOf(11), "Reserved");
    audioObjectTypes.put(Integer.valueOf(12), "TTSI (Text-To-Speech Interface)");
    audioObjectTypes.put(Integer.valueOf(13), "Main Synthesis");
    audioObjectTypes.put(Integer.valueOf(14), "Wavetable Synthesis");
    audioObjectTypes.put(Integer.valueOf(15), "General MIDI");
    audioObjectTypes.put(Integer.valueOf(16), "Algorithmic Synthesis and Audio Effects");
    audioObjectTypes.put(Integer.valueOf(17), "ER (Error Resilient) AAC LC");
    audioObjectTypes.put(Integer.valueOf(18), "Reserved");
    audioObjectTypes.put(Integer.valueOf(19), "ER AAC LTP");
    audioObjectTypes.put(Integer.valueOf(20), "ER AAC Scalable");
    audioObjectTypes.put(Integer.valueOf(21), "ER TwinVQ");
    audioObjectTypes.put(Integer.valueOf(22), "ER BSAC (Bit-Sliced Arithmetic Coding)");
    audioObjectTypes.put(Integer.valueOf(23), "ER AAC LD (Low Delay)");
    audioObjectTypes.put(Integer.valueOf(24), "ER CELP");
    audioObjectTypes.put(Integer.valueOf(25), "ER HVXC");
    audioObjectTypes.put(Integer.valueOf(26), "ER HILN (Harmonic and Individual Lines plus Noise)");
    audioObjectTypes.put(Integer.valueOf(27), "ER Parametric");
    audioObjectTypes.put(Integer.valueOf(28), "SSC (SinuSoidal Coding)");
    audioObjectTypes.put(Integer.valueOf(29), "PS (Parametric Stereo)");
    audioObjectTypes.put(Integer.valueOf(30), "MPEG Surround");
    audioObjectTypes.put(Integer.valueOf(31), "(Escape value)");
    audioObjectTypes.put(Integer.valueOf(32), "Layer-1");
    audioObjectTypes.put(Integer.valueOf(33), "Layer-2");
    audioObjectTypes.put(Integer.valueOf(34), "Layer-3");
    audioObjectTypes.put(Integer.valueOf(35), "DST (Direct Stream Transfer)");
    audioObjectTypes.put(Integer.valueOf(36), "ALS (Audio Lossless)");
    audioObjectTypes.put(Integer.valueOf(37), "SLS (Scalable LosslesS)");
    audioObjectTypes.put(Integer.valueOf(38), "SLS non-core");
    audioObjectTypes.put(Integer.valueOf(39), "ER AAC ELD (Enhanced Low Delay)");
    audioObjectTypes.put(Integer.valueOf(40), "SMR (Symbolic Music Representation) Simple");
    audioObjectTypes.put(Integer.valueOf(41), "SMR Main");
    audioObjectTypes.put(Integer.valueOf(42), "USAC (Unified Speech and Audio Coding) (no SBR)");
    audioObjectTypes.put(Integer.valueOf(43), "SAOC (Spatial Audio Object Coding)");
    audioObjectTypes.put(Integer.valueOf(44), "LD MPEG Surround");
    audioObjectTypes.put(Integer.valueOf(45), "USAC");
    samplingFrequencyIndexMap = new HashMap();
    samplingFrequencyIndexMap.put(Integer.valueOf(96000), Integer.valueOf(0));
    samplingFrequencyIndexMap.put(Integer.valueOf(88200), Integer.valueOf(1));
    samplingFrequencyIndexMap.put(Integer.valueOf(64000), Integer.valueOf(2));
    samplingFrequencyIndexMap.put(Integer.valueOf(48000), Integer.valueOf(3));
    samplingFrequencyIndexMap.put(Integer.valueOf(44100), Integer.valueOf(4));
    samplingFrequencyIndexMap.put(Integer.valueOf(32000), Integer.valueOf(5));
    samplingFrequencyIndexMap.put(Integer.valueOf(24000), Integer.valueOf(6));
    samplingFrequencyIndexMap.put(Integer.valueOf(22050), Integer.valueOf(7));
    samplingFrequencyIndexMap.put(Integer.valueOf(16000), Integer.valueOf(8));
    samplingFrequencyIndexMap.put(Integer.valueOf(12000), Integer.valueOf(9));
    samplingFrequencyIndexMap.put(Integer.valueOf(11025), Integer.valueOf(10));
    samplingFrequencyIndexMap.put(Integer.valueOf(8000), Integer.valueOf(11));
    samplingFrequencyIndexMap.put(Integer.valueOf(0), Integer.valueOf(96000));
    samplingFrequencyIndexMap.put(Integer.valueOf(1), Integer.valueOf(88200));
    samplingFrequencyIndexMap.put(Integer.valueOf(2), Integer.valueOf(64000));
    samplingFrequencyIndexMap.put(Integer.valueOf(3), Integer.valueOf(48000));
    samplingFrequencyIndexMap.put(Integer.valueOf(4), Integer.valueOf(44100));
    samplingFrequencyIndexMap.put(Integer.valueOf(5), Integer.valueOf(32000));
    samplingFrequencyIndexMap.put(Integer.valueOf(6), Integer.valueOf(24000));
    samplingFrequencyIndexMap.put(Integer.valueOf(7), Integer.valueOf(22050));
    samplingFrequencyIndexMap.put(Integer.valueOf(8), Integer.valueOf(16000));
    samplingFrequencyIndexMap.put(Integer.valueOf(9), Integer.valueOf(12000));
    samplingFrequencyIndexMap.put(Integer.valueOf(10), Integer.valueOf(11025));
    samplingFrequencyIndexMap.put(Integer.valueOf(11), Integer.valueOf(8000));
  }

  public AACTrackImpl(DataSource paramDataSource)
    throws IOException
  {
    this(paramDataSource, "eng");
  }

  public AACTrackImpl(DataSource paramDataSource, String paramString)
    throws IOException
  {
    super(paramDataSource.toString());
    this.lang = paramString;
    this.dataSource = paramDataSource;
    this.samples = new ArrayList();
    this.firstHeader = readSamples(paramDataSource);
    double d1 = this.firstHeader.sampleRate / 1024.0D;
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
    this.bufferSizeDB = 1536;
    this.sampleDescriptionBox = new SampleDescriptionBox();
    AudioSampleEntry localAudioSampleEntry = new AudioSampleEntry("mp4a");
    if (this.firstHeader.channelconfig == 7)
      localAudioSampleEntry.setChannelCount(8);
    while (true)
    {
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
      localDecoderConfigDescriptor.setObjectTypeIndication(64);
      localDecoderConfigDescriptor.setStreamType(5);
      localDecoderConfigDescriptor.setBufferSizeDB(this.bufferSizeDB);
      localDecoderConfigDescriptor.setMaxBitRate(this.maxBitRate);
      localDecoderConfigDescriptor.setAvgBitRate(this.avgBitRate);
      AudioSpecificConfig localAudioSpecificConfig = new AudioSpecificConfig();
      localAudioSpecificConfig.setAudioObjectType(2);
      localAudioSpecificConfig.setSamplingFrequencyIndex(this.firstHeader.sampleFrequencyIndex);
      localAudioSpecificConfig.setChannelConfiguration(this.firstHeader.channelconfig);
      localDecoderConfigDescriptor.setAudioSpecificInfo(localAudioSpecificConfig);
      localESDescriptor.setDecoderConfigDescriptor(localDecoderConfigDescriptor);
      ByteBuffer localByteBuffer = localESDescriptor.serialize();
      localESDescriptorBox.setEsDescriptor(localESDescriptor);
      localESDescriptorBox.setData(localByteBuffer);
      localAudioSampleEntry.addBox(localESDescriptorBox);
      this.sampleDescriptionBox.addBox(localAudioSampleEntry);
      this.trackMetaData.setCreationTime(new Date());
      this.trackMetaData.setModificationTime(new Date());
      this.trackMetaData.setLanguage(paramString);
      this.trackMetaData.setVolume(1.0F);
      this.trackMetaData.setTimescale(this.firstHeader.sampleRate);
      this.decTimes = new long[this.samples.size()];
      Arrays.fill(this.decTimes, 1024L);
      return;
      localAudioSampleEntry.setChannelCount(this.firstHeader.channelconfig);
    }
  }

  private AdtsHeader readADTSHeader(DataSource paramDataSource)
    throws IOException
  {
    AdtsHeader localAdtsHeader = new AdtsHeader();
    ByteBuffer localByteBuffer = ByteBuffer.allocate(7);
    while (localByteBuffer.position() < 7)
      if (paramDataSource.read(localByteBuffer) == -1)
        localAdtsHeader = null;
    do
    {
      return localAdtsHeader;
      BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer((ByteBuffer)localByteBuffer.rewind());
      if (localBitReaderBuffer.readBits(12) != 4095)
        throw new IOException("Expected Start Word 0xfff");
      localAdtsHeader.mpegVersion = localBitReaderBuffer.readBits(1);
      localAdtsHeader.layer = localBitReaderBuffer.readBits(2);
      localAdtsHeader.protectionAbsent = localBitReaderBuffer.readBits(1);
      localAdtsHeader.profile = (1 + localBitReaderBuffer.readBits(2));
      localAdtsHeader.sampleFrequencyIndex = localBitReaderBuffer.readBits(4);
      localAdtsHeader.sampleRate = ((Integer)samplingFrequencyIndexMap.get(Integer.valueOf(localAdtsHeader.sampleFrequencyIndex))).intValue();
      localBitReaderBuffer.readBits(1);
      localAdtsHeader.channelconfig = localBitReaderBuffer.readBits(3);
      localAdtsHeader.original = localBitReaderBuffer.readBits(1);
      localAdtsHeader.home = localBitReaderBuffer.readBits(1);
      localAdtsHeader.copyrightedStream = localBitReaderBuffer.readBits(1);
      localAdtsHeader.copyrightStart = localBitReaderBuffer.readBits(1);
      localAdtsHeader.frameLength = localBitReaderBuffer.readBits(13);
      localAdtsHeader.bufferFullness = localBitReaderBuffer.readBits(11);
      localAdtsHeader.numAacFramesPerAdtsFrame = (1 + localBitReaderBuffer.readBits(2));
      if (localAdtsHeader.numAacFramesPerAdtsFrame != 1)
        throw new IOException("This muxer can only work with 1 AAC frame per ADTS frame");
    }
    while (localAdtsHeader.protectionAbsent != 0);
    paramDataSource.read(ByteBuffer.allocate(2));
    return localAdtsHeader;
  }

  private AdtsHeader readSamples(DataSource paramDataSource)
    throws IOException
  {
    Object localObject = null;
    while (true)
    {
      AdtsHeader localAdtsHeader = readADTSHeader(paramDataSource);
      if (localAdtsHeader == null)
        break;
      if (localObject == null)
        localObject = localAdtsHeader;
      final long l1 = paramDataSource.position();
      long l2 = localAdtsHeader.frameLength - localAdtsHeader.getSize();
      this.samples.add(new Sample()
      {
        public ByteBuffer asByteBuffer()
        {
          try
          {
            ByteBuffer localByteBuffer = AACTrackImpl.this.dataSource.map(l1, this.val$frameSize);
            return localByteBuffer;
          }
          catch (IOException localIOException)
          {
            throw new RuntimeException(localIOException);
          }
        }

        public long getSize()
        {
          return this.val$frameSize;
        }

        public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
          throws IOException
        {
          AACTrackImpl.this.dataSource.transferTo(l1, this.val$frameSize, paramAnonymousWritableByteChannel);
        }
      });
      paramDataSource.position(paramDataSource.position() + localAdtsHeader.frameLength - localAdtsHeader.getSize());
    }
    return localObject;
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
    return this.decTimes;
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

  public void setDecodeTimes(long[] paramArrayOfLong)
  {
    this.decTimes = paramArrayOfLong;
  }

  public String toString()
  {
    return "AACTrackImpl{sampleRate=" + this.firstHeader.sampleRate + ", channelconfig=" + this.firstHeader.channelconfig + '}';
  }

  class AdtsHeader
  {
    int bufferFullness;
    int channelconfig;
    int copyrightStart;
    int copyrightedStream;
    int frameLength;
    int home;
    int layer;
    int mpegVersion;
    int numAacFramesPerAdtsFrame;
    int original;
    int profile;
    int protectionAbsent;
    int sampleFrequencyIndex;
    int sampleRate;

    AdtsHeader()
    {
    }

    int getSize()
    {
      if (this.protectionAbsent == 0);
      for (int i = 2; ; i = 0)
        return i + 7;
    }
  }
}