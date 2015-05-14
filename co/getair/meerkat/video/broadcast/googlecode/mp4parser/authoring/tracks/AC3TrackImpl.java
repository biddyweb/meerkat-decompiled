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
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.AC3SpecificBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class AC3TrackImpl extends AbstractTrack
{
  static int[][][][] bitRateAndFrameSizeTable;
  private final DataSource dataSource;
  private long[] duration;
  private SampleDescriptionBox sampleDescriptionBox;
  private List<Sample> samples;
  private TrackMetaData trackMetaData = new TrackMetaData();

  static
  {
    int[] arrayOfInt = { 19, 2, 3, 2 };
    bitRateAndFrameSizeTable = (int[][][][])Array.newInstance(Integer.TYPE, arrayOfInt);
    bitRateAndFrameSizeTable[0][0][0][0] = 32;
    bitRateAndFrameSizeTable[0][1][0][0] = 32;
    bitRateAndFrameSizeTable[0][0][0][1] = 64;
    bitRateAndFrameSizeTable[0][1][0][1] = 64;
    bitRateAndFrameSizeTable[1][0][0][0] = 40;
    bitRateAndFrameSizeTable[1][1][0][0] = 40;
    bitRateAndFrameSizeTable[1][0][0][1] = 80;
    bitRateAndFrameSizeTable[1][1][0][1] = 80;
    bitRateAndFrameSizeTable[2][0][0][0] = 48;
    bitRateAndFrameSizeTable[2][1][0][0] = 48;
    bitRateAndFrameSizeTable[2][0][0][1] = 96;
    bitRateAndFrameSizeTable[2][1][0][1] = 96;
    bitRateAndFrameSizeTable[3][0][0][0] = 56;
    bitRateAndFrameSizeTable[3][1][0][0] = 56;
    bitRateAndFrameSizeTable[3][0][0][1] = 112;
    bitRateAndFrameSizeTable[3][1][0][1] = 112;
    bitRateAndFrameSizeTable[4][0][0][0] = 64;
    bitRateAndFrameSizeTable[4][1][0][0] = 64;
    bitRateAndFrameSizeTable[4][0][0][1] = '\u0080';
    bitRateAndFrameSizeTable[4][1][0][1] = '\u0080';
    bitRateAndFrameSizeTable[5][0][0][0] = 80;
    bitRateAndFrameSizeTable[5][1][0][0] = 80;
    bitRateAndFrameSizeTable[5][0][0][1] = '\u00A0';
    bitRateAndFrameSizeTable[5][1][0][1] = '\u00A0';
    bitRateAndFrameSizeTable[6][0][0][0] = 96;
    bitRateAndFrameSizeTable[6][1][0][0] = 96;
    bitRateAndFrameSizeTable[6][0][0][1] = '\u00C0';
    bitRateAndFrameSizeTable[6][1][0][1] = '\u00C0';
    bitRateAndFrameSizeTable[7][0][0][0] = 112;
    bitRateAndFrameSizeTable[7][1][0][0] = 112;
    bitRateAndFrameSizeTable[7][0][0][1] = '\u00E0';
    bitRateAndFrameSizeTable[7][1][0][1] = '\u00E0';
    bitRateAndFrameSizeTable[8][0][0][0] = '\u0080';
    bitRateAndFrameSizeTable[8][1][0][0] = '\u0080';
    bitRateAndFrameSizeTable[8][0][0][1] = 256;
    bitRateAndFrameSizeTable[8][1][0][1] = 256;
    bitRateAndFrameSizeTable[9][0][0][0] = '\u00A0';
    bitRateAndFrameSizeTable[9][1][0][0] = '\u00A0';
    bitRateAndFrameSizeTable[9][0][0][1] = 320;
    bitRateAndFrameSizeTable[9][1][0][1] = 320;
    bitRateAndFrameSizeTable[10][0][0][0] = '\u00C0';
    bitRateAndFrameSizeTable[10][1][0][0] = '\u00C0';
    bitRateAndFrameSizeTable[10][0][0][1] = 384;
    bitRateAndFrameSizeTable[10][1][0][1] = 384;
    bitRateAndFrameSizeTable[11][0][0][0] = '\u00E0';
    bitRateAndFrameSizeTable[11][1][0][0] = '\u00E0';
    bitRateAndFrameSizeTable[11][0][0][1] = 448;
    bitRateAndFrameSizeTable[11][1][0][1] = 448;
    bitRateAndFrameSizeTable[12][0][0][0] = 256;
    bitRateAndFrameSizeTable[12][1][0][0] = 256;
    bitRateAndFrameSizeTable[12][0][0][1] = 512;
    bitRateAndFrameSizeTable[12][1][0][1] = 512;
    bitRateAndFrameSizeTable[13][0][0][0] = 320;
    bitRateAndFrameSizeTable[13][1][0][0] = 320;
    bitRateAndFrameSizeTable[13][0][0][1] = 640;
    bitRateAndFrameSizeTable[13][1][0][1] = 640;
    bitRateAndFrameSizeTable[14][0][0][0] = 384;
    bitRateAndFrameSizeTable[14][1][0][0] = 384;
    bitRateAndFrameSizeTable[14][0][0][1] = 768;
    bitRateAndFrameSizeTable[14][1][0][1] = 768;
    bitRateAndFrameSizeTable[15][0][0][0] = 448;
    bitRateAndFrameSizeTable[15][1][0][0] = 448;
    bitRateAndFrameSizeTable[15][0][0][1] = 896;
    bitRateAndFrameSizeTable[15][1][0][1] = 896;
    bitRateAndFrameSizeTable[16][0][0][0] = 512;
    bitRateAndFrameSizeTable[16][1][0][0] = 512;
    bitRateAndFrameSizeTable[16][0][0][1] = 1024;
    bitRateAndFrameSizeTable[16][1][0][1] = 1024;
    bitRateAndFrameSizeTable[17][0][0][0] = 576;
    bitRateAndFrameSizeTable[17][1][0][0] = 576;
    bitRateAndFrameSizeTable[17][0][0][1] = 1152;
    bitRateAndFrameSizeTable[17][1][0][1] = 1152;
    bitRateAndFrameSizeTable[18][0][0][0] = 640;
    bitRateAndFrameSizeTable[18][1][0][0] = 640;
    bitRateAndFrameSizeTable[18][0][0][1] = 1280;
    bitRateAndFrameSizeTable[18][1][0][1] = 1280;
    bitRateAndFrameSizeTable[0][0][1][0] = 32;
    bitRateAndFrameSizeTable[0][1][1][0] = 32;
    bitRateAndFrameSizeTable[0][0][1][1] = 69;
    bitRateAndFrameSizeTable[0][1][1][1] = 70;
    bitRateAndFrameSizeTable[1][0][1][0] = 40;
    bitRateAndFrameSizeTable[1][1][1][0] = 40;
    bitRateAndFrameSizeTable[1][0][1][1] = 87;
    bitRateAndFrameSizeTable[1][1][1][1] = 88;
    bitRateAndFrameSizeTable[2][0][1][0] = 48;
    bitRateAndFrameSizeTable[2][1][1][0] = 48;
    bitRateAndFrameSizeTable[2][0][1][1] = 104;
    bitRateAndFrameSizeTable[2][1][1][1] = 105;
    bitRateAndFrameSizeTable[3][0][1][0] = 56;
    bitRateAndFrameSizeTable[3][1][1][0] = 56;
    bitRateAndFrameSizeTable[3][0][1][1] = 121;
    bitRateAndFrameSizeTable[3][1][1][1] = 122;
    bitRateAndFrameSizeTable[4][0][1][0] = 64;
    bitRateAndFrameSizeTable[4][1][1][0] = 64;
    bitRateAndFrameSizeTable[4][0][1][1] = '\u008B';
    bitRateAndFrameSizeTable[4][1][1][1] = '\u008C';
    bitRateAndFrameSizeTable[5][0][1][0] = 80;
    bitRateAndFrameSizeTable[5][1][1][0] = 80;
    bitRateAndFrameSizeTable[5][0][1][1] = '\u00AE';
    bitRateAndFrameSizeTable[5][1][1][1] = '\u00AF';
    bitRateAndFrameSizeTable[6][0][1][0] = 96;
    bitRateAndFrameSizeTable[6][1][1][0] = 96;
    bitRateAndFrameSizeTable[6][0][1][1] = '\u00D0';
    bitRateAndFrameSizeTable[6][1][1][1] = '\u00D1';
    bitRateAndFrameSizeTable[7][0][1][0] = 112;
    bitRateAndFrameSizeTable[7][1][1][0] = 112;
    bitRateAndFrameSizeTable[7][0][1][1] = '\u00F3';
    bitRateAndFrameSizeTable[7][1][1][1] = '\u00F4';
    bitRateAndFrameSizeTable[8][0][1][0] = '\u0080';
    bitRateAndFrameSizeTable[8][1][1][0] = '\u0080';
    bitRateAndFrameSizeTable[8][0][1][1] = 278;
    bitRateAndFrameSizeTable[8][1][1][1] = 279;
    bitRateAndFrameSizeTable[9][0][1][0] = '\u00A0';
    bitRateAndFrameSizeTable[9][1][1][0] = '\u00A0';
    bitRateAndFrameSizeTable[9][0][1][1] = 348;
    bitRateAndFrameSizeTable[9][1][1][1] = 349;
    bitRateAndFrameSizeTable[10][0][1][0] = '\u00C0';
    bitRateAndFrameSizeTable[10][1][1][0] = '\u00C0';
    bitRateAndFrameSizeTable[10][0][1][1] = 417;
    bitRateAndFrameSizeTable[10][1][1][1] = 418;
    bitRateAndFrameSizeTable[11][0][1][0] = '\u00E0';
    bitRateAndFrameSizeTable[11][1][1][0] = '\u00E0';
    bitRateAndFrameSizeTable[11][0][1][1] = 487;
    bitRateAndFrameSizeTable[11][1][1][1] = 488;
    bitRateAndFrameSizeTable[12][0][1][0] = 256;
    bitRateAndFrameSizeTable[12][1][1][0] = 256;
    bitRateAndFrameSizeTable[12][0][1][1] = 557;
    bitRateAndFrameSizeTable[12][1][1][1] = 558;
    bitRateAndFrameSizeTable[13][0][1][0] = 320;
    bitRateAndFrameSizeTable[13][1][1][0] = 320;
    bitRateAndFrameSizeTable[13][0][1][1] = 696;
    bitRateAndFrameSizeTable[13][1][1][1] = 697;
    bitRateAndFrameSizeTable[14][0][1][0] = 384;
    bitRateAndFrameSizeTable[14][1][1][0] = 384;
    bitRateAndFrameSizeTable[14][0][1][1] = 835;
    bitRateAndFrameSizeTable[14][1][1][1] = 836;
    bitRateAndFrameSizeTable[15][0][1][0] = 448;
    bitRateAndFrameSizeTable[15][1][1][0] = 448;
    bitRateAndFrameSizeTable[15][0][1][1] = 975;
    bitRateAndFrameSizeTable[15][1][1][1] = 975;
    bitRateAndFrameSizeTable[16][0][1][0] = 512;
    bitRateAndFrameSizeTable[16][1][1][0] = 512;
    bitRateAndFrameSizeTable[16][0][1][1] = 1114;
    bitRateAndFrameSizeTable[16][1][1][1] = 1115;
    bitRateAndFrameSizeTable[17][0][1][0] = 576;
    bitRateAndFrameSizeTable[17][1][1][0] = 576;
    bitRateAndFrameSizeTable[17][0][1][1] = 1253;
    bitRateAndFrameSizeTable[17][1][1][1] = 1254;
    bitRateAndFrameSizeTable[18][0][1][0] = 640;
    bitRateAndFrameSizeTable[18][1][1][0] = 640;
    bitRateAndFrameSizeTable[18][0][1][1] = 1393;
    bitRateAndFrameSizeTable[18][1][1][1] = 1394;
    bitRateAndFrameSizeTable[0][0][2][0] = 32;
    bitRateAndFrameSizeTable[0][1][2][0] = 32;
    bitRateAndFrameSizeTable[0][0][2][1] = 96;
    bitRateAndFrameSizeTable[0][1][2][1] = 96;
    bitRateAndFrameSizeTable[1][0][2][0] = 40;
    bitRateAndFrameSizeTable[1][1][2][0] = 40;
    bitRateAndFrameSizeTable[1][0][2][1] = 120;
    bitRateAndFrameSizeTable[1][1][2][1] = 120;
    bitRateAndFrameSizeTable[2][0][2][0] = 48;
    bitRateAndFrameSizeTable[2][1][2][0] = 48;
    bitRateAndFrameSizeTable[2][0][2][1] = '\u0090';
    bitRateAndFrameSizeTable[2][1][2][1] = '\u0090';
    bitRateAndFrameSizeTable[3][0][2][0] = 56;
    bitRateAndFrameSizeTable[3][1][2][0] = 56;
    bitRateAndFrameSizeTable[3][0][2][1] = '\u00A8';
    bitRateAndFrameSizeTable[3][1][2][1] = '\u00A8';
    bitRateAndFrameSizeTable[4][0][2][0] = 64;
    bitRateAndFrameSizeTable[4][1][2][0] = 64;
    bitRateAndFrameSizeTable[4][0][2][1] = '\u00C0';
    bitRateAndFrameSizeTable[4][1][2][1] = '\u00C0';
    bitRateAndFrameSizeTable[5][0][2][0] = 80;
    bitRateAndFrameSizeTable[5][1][2][0] = 80;
    bitRateAndFrameSizeTable[5][0][2][1] = '\u00F0';
    bitRateAndFrameSizeTable[5][1][2][1] = '\u00F0';
    bitRateAndFrameSizeTable[6][0][2][0] = 96;
    bitRateAndFrameSizeTable[6][1][2][0] = 96;
    bitRateAndFrameSizeTable[6][0][2][1] = 288;
    bitRateAndFrameSizeTable[6][1][2][1] = 288;
    bitRateAndFrameSizeTable[7][0][2][0] = 112;
    bitRateAndFrameSizeTable[7][1][2][0] = 112;
    bitRateAndFrameSizeTable[7][0][2][1] = 336;
    bitRateAndFrameSizeTable[7][1][2][1] = 336;
    bitRateAndFrameSizeTable[8][0][2][0] = '\u0080';
    bitRateAndFrameSizeTable[8][1][2][0] = '\u0080';
    bitRateAndFrameSizeTable[8][0][2][1] = 384;
    bitRateAndFrameSizeTable[8][1][2][1] = 384;
    bitRateAndFrameSizeTable[9][0][2][0] = '\u00A0';
    bitRateAndFrameSizeTable[9][1][2][0] = '\u00A0';
    bitRateAndFrameSizeTable[9][0][2][1] = 480;
    bitRateAndFrameSizeTable[9][1][2][1] = 480;
    bitRateAndFrameSizeTable[10][0][2][0] = '\u00C0';
    bitRateAndFrameSizeTable[10][1][2][0] = '\u00C0';
    bitRateAndFrameSizeTable[10][0][2][1] = 576;
    bitRateAndFrameSizeTable[10][1][2][1] = 576;
    bitRateAndFrameSizeTable[11][0][2][0] = '\u00E0';
    bitRateAndFrameSizeTable[11][1][2][0] = '\u00E0';
    bitRateAndFrameSizeTable[11][0][2][1] = 672;
    bitRateAndFrameSizeTable[11][1][2][1] = 672;
    bitRateAndFrameSizeTable[12][0][2][0] = 256;
    bitRateAndFrameSizeTable[12][1][2][0] = 256;
    bitRateAndFrameSizeTable[12][0][2][1] = 768;
    bitRateAndFrameSizeTable[12][1][2][1] = 768;
    bitRateAndFrameSizeTable[13][0][2][0] = 320;
    bitRateAndFrameSizeTable[13][1][2][0] = 320;
    bitRateAndFrameSizeTable[13][0][2][1] = 960;
    bitRateAndFrameSizeTable[13][1][2][1] = 960;
    bitRateAndFrameSizeTable[14][0][2][0] = 384;
    bitRateAndFrameSizeTable[14][1][2][0] = 384;
    bitRateAndFrameSizeTable[14][0][2][1] = 1152;
    bitRateAndFrameSizeTable[14][1][2][1] = 1152;
    bitRateAndFrameSizeTable[15][0][2][0] = 448;
    bitRateAndFrameSizeTable[15][1][2][0] = 448;
    bitRateAndFrameSizeTable[15][0][2][1] = 1344;
    bitRateAndFrameSizeTable[15][1][2][1] = 1344;
    bitRateAndFrameSizeTable[16][0][2][0] = 512;
    bitRateAndFrameSizeTable[16][1][2][0] = 512;
    bitRateAndFrameSizeTable[16][0][2][1] = 1536;
    bitRateAndFrameSizeTable[16][1][2][1] = 1536;
    bitRateAndFrameSizeTable[17][0][2][0] = 576;
    bitRateAndFrameSizeTable[17][1][2][0] = 576;
    bitRateAndFrameSizeTable[17][0][2][1] = 1728;
    bitRateAndFrameSizeTable[17][1][2][1] = 1728;
    bitRateAndFrameSizeTable[18][0][2][0] = 640;
    bitRateAndFrameSizeTable[18][1][2][0] = 640;
    bitRateAndFrameSizeTable[18][0][2][1] = 1920;
    bitRateAndFrameSizeTable[18][1][2][1] = 1920;
  }

  public AC3TrackImpl(DataSource paramDataSource)
    throws IOException
  {
    this(paramDataSource, "eng");
  }

  public AC3TrackImpl(DataSource paramDataSource, String paramString)
    throws IOException
  {
    super(paramDataSource.toString());
    this.dataSource = paramDataSource;
    this.trackMetaData.setLanguage(paramString);
    this.samples = readSamples();
    this.sampleDescriptionBox = new SampleDescriptionBox();
    AudioSampleEntry localAudioSampleEntry = createAudioSampleEntry();
    this.sampleDescriptionBox.addBox(localAudioSampleEntry);
    this.trackMetaData.setCreationTime(new Date());
    this.trackMetaData.setModificationTime(new Date());
    this.trackMetaData.setLanguage(paramString);
    this.trackMetaData.setTimescale(localAudioSampleEntry.getSampleRate());
    this.trackMetaData.setVolume(1.0F);
  }

  private AudioSampleEntry createAudioSampleEntry()
    throws IOException
  {
    BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer(((Sample)this.samples.get(0)).asByteBuffer());
    if (localBitReaderBuffer.readBits(16) != 2935)
      throw new RuntimeException("Stream doesn't seem to be AC3");
    localBitReaderBuffer.readBits(16);
    int i = localBitReaderBuffer.readBits(2);
    int j;
    switch (i)
    {
    default:
      throw new RuntimeException("Unsupported Sample Rate");
    case 0:
      j = 48000;
    case 1:
    case 2:
    }
    int k;
    int m;
    int n;
    int i1;
    while (true)
    {
      k = localBitReaderBuffer.readBits(6);
      m = localBitReaderBuffer.readBits(5);
      n = localBitReaderBuffer.readBits(3);
      i1 = localBitReaderBuffer.readBits(3);
      if (m != 16)
        break;
      throw new RuntimeException("You cannot read E-AC-3 track with AC3TrackImpl.class - user EC3TrackImpl.class");
      j = 44100;
      continue;
      j = 32000;
    }
    if (m == 9)
      j /= 2;
    while ((m == 8) || (m == 6))
    {
      if ((i1 != 1) && ((i1 & 0x1) == 1))
        localBitReaderBuffer.readBits(2);
      if ((i1 & 0x4) != 0)
        localBitReaderBuffer.readBits(2);
      if (i1 == 2)
        localBitReaderBuffer.readBits(2);
      switch (i1)
      {
      default:
        throw new RuntimeException("Unsupported acmod");
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      }
    }
    throw new RuntimeException("Unsupported bsid");
    int i2 = 2;
    while (true)
    {
      int i3 = localBitReaderBuffer.readBits(1);
      if (i3 == 1)
        (i2 + 1);
      AudioSampleEntry localAudioSampleEntry = new AudioSampleEntry("ac-3");
      localAudioSampleEntry.setChannelCount(2);
      localAudioSampleEntry.setSampleRate(j);
      localAudioSampleEntry.setDataReferenceIndex(1);
      localAudioSampleEntry.setSampleSize(16);
      AC3SpecificBox localAC3SpecificBox = new AC3SpecificBox();
      localAC3SpecificBox.setAcmod(i1);
      localAC3SpecificBox.setBitRateCode(k >> 1);
      localAC3SpecificBox.setBsid(m);
      localAC3SpecificBox.setBsmod(n);
      localAC3SpecificBox.setFscod(i);
      localAC3SpecificBox.setLfeon(i3);
      localAC3SpecificBox.setReserved(0);
      localAudioSampleEntry.addBox(localAC3SpecificBox);
      return localAudioSampleEntry;
      i2 = 1;
      continue;
      i2 = 2;
      continue;
      i2 = 3;
      continue;
      i2 = 3;
      continue;
      i2 = 4;
      continue;
      i2 = 4;
      continue;
      i2 = 5;
    }
  }

  private int getFrameSize(int paramInt1, int paramInt2)
  {
    int i = paramInt1 >>> 1;
    int j = paramInt1 & 0x1;
    if ((i > 18) || (j > 1) || (paramInt2 > 2))
      throw new RuntimeException("Cannot determine framesize of current sample");
    return 2 * bitRateAndFrameSizeTable[i][j][paramInt2][1];
  }

  private List<Sample> readSamples()
    throws IOException
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(5);
    ArrayList localArrayList = new ArrayList();
    while (-1 != this.dataSource.read(localByteBuffer))
    {
      int i = getFrameSize(0x3F & localByteBuffer.get(4), localByteBuffer.get(4) >> 6);
      localArrayList.add(new Sample()
      {
        private final DataSource dataSource;
        private final long size;
        private final long start;

        public ByteBuffer asByteBuffer()
        {
          try
          {
            ByteBuffer localByteBuffer = this.dataSource.map(this.start, this.size);
            return localByteBuffer;
          }
          catch (IOException localIOException)
          {
            throw new RuntimeException(localIOException);
          }
        }

        public long getSize()
        {
          return this.size;
        }

        public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
          throws IOException
        {
          this.dataSource.transferTo(this.start, this.size, paramAnonymousWritableByteChannel);
        }
      });
      this.dataSource.position(this.dataSource.position() - 5L + i);
      localByteBuffer.rewind();
    }
    this.duration = new long[localArrayList.size()];
    Arrays.fill(this.duration, 1536L);
    return localArrayList;
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
    try
    {
      long[] arrayOfLong = this.duration;
      return arrayOfLong;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
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
}