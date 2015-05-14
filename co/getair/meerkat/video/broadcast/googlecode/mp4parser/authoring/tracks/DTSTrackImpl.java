package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.DTSSpecificBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import java.io.EOFException;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class DTSTrackImpl extends AbstractTrack
{
  private static final int BUFFER = 67108864;
  int bcCoreBitRate = 0;
  int bcCoreChannelMask = 0;
  int bcCoreMaxSampleRate = 0;
  int bitrate;
  int channelCount;
  int channelMask = 0;
  int codecDelayAtMaxFs = 0;
  int coreBitRate = 0;
  int coreChannelMask = 0;
  int coreFramePayloadInBytes = 0;
  int coreMaxSampleRate = 0;
  boolean coreSubStreamPresent = false;
  private int dataOffset = 0;
  private DataSource dataSource;
  DTSSpecificBox ddts = new DTSSpecificBox();
  int extAvgBitrate = 0;
  int extFramePayloadInBytes = 0;
  int extPeakBitrate = 0;
  int extSmoothBuffSize = 0;
  boolean extensionSubStreamPresent = false;
  int frameSize = 0;
  boolean isVBR = false;
  private String lang = "eng";
  int lbrCodingPresent = 0;
  int lsbTrimPercent = 0;
  int maxSampleRate = 0;
  int numExtSubStreams = 0;
  int numFramesTotal = 0;
  int numSamplesOrigAudioAtMaxFs = 0;
  SampleDescriptionBox sampleDescriptionBox;
  private long[] sampleDurations;
  int sampleSize;
  int samplerate;
  private List<Sample> samples;
  int samplesPerFrame;
  int samplesPerFrameAtMaxFs = 0;
  TrackMetaData trackMetaData = new TrackMetaData();
  String type = "none";

  public DTSTrackImpl(DataSource paramDataSource)
    throws IOException
  {
    super(paramDataSource.toString());
    this.dataSource = paramDataSource;
    parse();
  }

  public DTSTrackImpl(DataSource paramDataSource, String paramString)
    throws IOException
  {
    super(paramDataSource.toString());
    this.lang = paramString;
    this.dataSource = paramDataSource;
    parse();
  }

  private List<Sample> generateSamples(DataSource paramDataSource, int paramInt1, long paramLong, int paramInt2)
    throws IOException
  {
    LookAhead localLookAhead = new LookAhead(paramDataSource, paramInt1, paramLong, paramInt2);
    ArrayList localArrayList = new ArrayList();
    while (true)
    {
      final ByteBuffer localByteBuffer = localLookAhead.findNextStart();
      if (localByteBuffer == null)
        break;
      localArrayList.add(new Sample()
      {
        public ByteBuffer asByteBuffer()
        {
          return localByteBuffer;
        }

        public long getSize()
        {
          return localByteBuffer.rewind().remaining();
        }

        public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
          throws IOException
        {
          paramAnonymousWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
        }
      });
    }
    System.err.println("all samples found");
    return localArrayList;
  }

  private int getBitRate(int paramInt)
    throws IOException
  {
    switch (paramInt)
    {
    default:
      throw new IOException("Unknown bitrate value");
    case 0:
      return 32;
    case 1:
      return 56;
    case 2:
      return 64;
    case 3:
      return 96;
    case 4:
      return 112;
    case 5:
      return 128;
    case 6:
      return 192;
    case 7:
      return 224;
    case 8:
      return 256;
    case 9:
      return 320;
    case 10:
      return 384;
    case 11:
      return 448;
    case 12:
      return 512;
    case 13:
      return 576;
    case 14:
      return 640;
    case 15:
      return 768;
    case 16:
      return 960;
    case 17:
      return 1024;
    case 18:
      return 1152;
    case 19:
      return 1280;
    case 20:
      return 1344;
    case 21:
      return 1408;
    case 22:
      return 1411;
    case 23:
      return 1472;
    case 24:
      return 1536;
    case 25:
    }
    return -1;
  }

  private int getSampleRate(int paramInt)
    throws IOException
  {
    switch (paramInt)
    {
    case 4:
    case 5:
    case 9:
    case 10:
    default:
      throw new IOException("Unknown Sample Rate");
    case 1:
      return 8000;
    case 2:
      return 16000;
    case 3:
      return 32000;
    case 6:
      return 11025;
    case 7:
      return 22050;
    case 8:
      return 44100;
    case 11:
      return 12000;
    case 12:
      return 24000;
    case 13:
    }
    return 48000;
  }

  private void parse()
    throws IOException
  {
    if (!readVariables())
      throw new IOException();
    this.sampleDescriptionBox = new SampleDescriptionBox();
    AudioSampleEntry localAudioSampleEntry = new AudioSampleEntry(this.type);
    localAudioSampleEntry.setChannelCount(this.channelCount);
    localAudioSampleEntry.setSampleRate(this.samplerate);
    localAudioSampleEntry.setDataReferenceIndex(1);
    localAudioSampleEntry.setSampleSize(16);
    localAudioSampleEntry.addBox(this.ddts);
    this.sampleDescriptionBox.addBox(localAudioSampleEntry);
    this.trackMetaData.setCreationTime(new Date());
    this.trackMetaData.setModificationTime(new Date());
    this.trackMetaData.setLanguage(this.lang);
    this.trackMetaData.setTimescale(this.samplerate);
  }

  private boolean parseAuprhdr(int paramInt, ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.get();
    int i = paramByteBuffer.getShort();
    int j = paramByteBuffer.get();
    int k = paramByteBuffer.getShort();
    this.maxSampleRate = (j << 16 | k & 0xFFFF);
    this.numFramesTotal = paramByteBuffer.getInt();
    this.samplesPerFrameAtMaxFs = paramByteBuffer.getShort();
    int m = paramByteBuffer.get();
    int n = paramByteBuffer.getInt();
    this.numSamplesOrigAudioAtMaxFs = (m << 32 | n & 0xFFFF);
    this.channelMask = paramByteBuffer.getShort();
    this.codecDelayAtMaxFs = paramByteBuffer.getShort();
    int i1 = 21;
    if ((i & 0x3) == 3)
    {
      int i2 = paramByteBuffer.get();
      int i3 = paramByteBuffer.getShort();
      this.bcCoreMaxSampleRate = (i2 << 16 | i3 & 0xFFFF);
      this.bcCoreBitRate = paramByteBuffer.getShort();
      this.bcCoreChannelMask = paramByteBuffer.getShort();
      i1 += 7;
    }
    if ((i & 0x4) > 0)
    {
      this.lsbTrimPercent = paramByteBuffer.get();
      i1++;
    }
    if ((i & 0x8) > 0)
      this.lbrCodingPresent = 1;
    while (i1 < paramInt)
    {
      paramByteBuffer.get();
      i1++;
    }
    return true;
  }

  private boolean parseCoressmd(int paramInt, ByteBuffer paramByteBuffer)
  {
    int i = paramByteBuffer.get();
    int j = paramByteBuffer.getShort();
    this.coreMaxSampleRate = (i << 16 | 0xFFFF & j);
    this.coreBitRate = paramByteBuffer.getShort();
    this.coreChannelMask = paramByteBuffer.getShort();
    this.coreFramePayloadInBytes = paramByteBuffer.getInt();
    for (int k = 11; k < paramInt; k++)
      paramByteBuffer.get();
    return true;
  }

  private void parseDtshdhdr(int paramInt, ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.getInt();
    paramByteBuffer.get();
    paramByteBuffer.getInt();
    paramByteBuffer.get();
    int i = paramByteBuffer.getShort();
    paramByteBuffer.get();
    this.numExtSubStreams = paramByteBuffer.get();
    if ((i & 0x1) == 1)
      this.isVBR = true;
    if ((i & 0x8) == 8)
      this.coreSubStreamPresent = true;
    if ((i & 0x10) == 16)
      this.extensionSubStreamPresent = true;
    for (this.numExtSubStreams = (1 + this.numExtSubStreams); ; this.numExtSubStreams = 0)
      for (int j = 14; j < paramInt; j++)
        paramByteBuffer.get();
  }

  private boolean parseExtssmd(int paramInt, ByteBuffer paramByteBuffer)
  {
    int i = paramByteBuffer.get();
    int j = paramByteBuffer.getShort();
    this.extAvgBitrate = (i << 16 | j & 0xFFFF);
    int k;
    if (this.isVBR)
    {
      int m = paramByteBuffer.get();
      int n = paramByteBuffer.getShort();
      this.extPeakBitrate = (m << 16 | n & 0xFFFF);
      this.extSmoothBuffSize = paramByteBuffer.getShort();
      k = 3 + 5;
    }
    while (k < paramInt)
    {
      paramByteBuffer.get();
      k++;
      continue;
      this.extFramePayloadInBytes = paramByteBuffer.getInt();
      k = 3 + 4;
    }
    return true;
  }

  private boolean readVariables()
    throws IOException
  {
    ByteBuffer localByteBuffer = this.dataSource.map(0L, 25000L);
    int i = localByteBuffer.getInt();
    int j = localByteBuffer.getInt();
    if ((i != 1146377032) || (j != 1145586770))
      throw new IOException("data does not start with 'DTSHDHDR' as required for a DTS-HD file");
    if (((i != 1398035021) || (j != 1145132097)) && (localByteBuffer.remaining() > 100))
    {
      int i33 = (int)localByteBuffer.getLong();
      if ((i == 1146377032) && (j == 1145586770))
        parseDtshdhdr(i33, localByteBuffer);
      while (true)
      {
        i = localByteBuffer.getInt();
        j = localByteBuffer.getInt();
        break;
        if ((i == 1129271877) && (j == 1397968196))
        {
          if (!parseCoressmd(i33, localByteBuffer))
            return false;
        }
        else if ((i == 1096110162) && (j == 759710802))
        {
          if (!parseAuprhdr(i33, localByteBuffer))
            return false;
        }
        else if ((i == 1163416659) && (j == 1398754628))
        {
          if (!parseExtssmd(i33, localByteBuffer))
            return false;
        }
        else
          for (int i34 = 0; i34 < i33; i34++)
            localByteBuffer.get();
      }
    }
    long l = localByteBuffer.getLong();
    this.dataOffset = localByteBuffer.position();
    int k = -1;
    int m = 0;
    int n = 0;
    int i1 = -1;
    int i2 = -1;
    int i3 = 0;
    int i4 = 0;
    int i5 = 0;
    int i6 = 0;
    int i7 = 0;
    int i8 = 0;
    int i9 = 0;
    int i10 = 0;
    while (i10 == 0)
    {
      int i20 = localByteBuffer.position();
      int i21 = localByteBuffer.getInt();
      if (i21 == 2147385345)
      {
        if (i1 == 1)
        {
          i10 = 1;
        }
        else
        {
          i1 = 1;
          BitReaderBuffer localBitReaderBuffer2 = new BitReaderBuffer(localByteBuffer);
          int i28 = localBitReaderBuffer2.readBits(1);
          int i29 = localBitReaderBuffer2.readBits(5);
          int i30 = localBitReaderBuffer2.readBits(1);
          if ((i28 != 1) || (i29 != 31) || (i30 != 0))
            return false;
          this.samplesPerFrame = (32 * (1 + localBitReaderBuffer2.readBits(7)));
          int i31 = localBitReaderBuffer2.readBits(14);
          this.frameSize += i31 + 1;
          k = localBitReaderBuffer2.readBits(6);
          this.samplerate = getSampleRate(localBitReaderBuffer2.readBits(4));
          this.bitrate = getBitRate(localBitReaderBuffer2.readBits(5));
          if (localBitReaderBuffer2.readBits(1) != 0)
            return false;
          localBitReaderBuffer2.readBits(1);
          localBitReaderBuffer2.readBits(1);
          localBitReaderBuffer2.readBits(1);
          localBitReaderBuffer2.readBits(1);
          m = localBitReaderBuffer2.readBits(3);
          n = localBitReaderBuffer2.readBits(1);
          localBitReaderBuffer2.readBits(1);
          localBitReaderBuffer2.readBits(2);
          localBitReaderBuffer2.readBits(1);
          if (i30 == 1)
            localBitReaderBuffer2.readBits(16);
          localBitReaderBuffer2.readBits(1);
          int i32 = localBitReaderBuffer2.readBits(4);
          localBitReaderBuffer2.readBits(2);
          switch (localBitReaderBuffer2.readBits(3))
          {
          case 4:
          default:
            return false;
          case 0:
          case 1:
            this.sampleSize = 16;
            label604: localBitReaderBuffer2.readBits(1);
            localBitReaderBuffer2.readBits(1);
            switch (i32)
            {
            default:
              localBitReaderBuffer2.readBits(4);
            case 6:
            case 7:
            }
            break;
          case 2:
          case 3:
          case 5:
          case 6:
          }
          while (true)
          {
            localByteBuffer.position(1 + (i20 + i31));
            break;
            this.sampleSize = 20;
            break label604;
            this.sampleSize = 24;
            break label604;
            (-(16 + localBitReaderBuffer2.readBits(4)));
            continue;
            (-localBitReaderBuffer2.readBits(4));
          }
        }
      }
      else
      {
        if (i21 == 1683496997)
        {
          if (i1 == -1)
          {
            i1 = 0;
            this.samplesPerFrame = this.samplesPerFrameAtMaxFs;
          }
          i2 = 1;
          BitReaderBuffer localBitReaderBuffer1 = new BitReaderBuffer(localByteBuffer);
          localBitReaderBuffer1.readBits(8);
          localBitReaderBuffer1.readBits(2);
          int i22 = localBitReaderBuffer1.readBits(1);
          int i23 = 12;
          int i24 = 20;
          if (i22 == 0)
          {
            i23 = 8;
            i24 = 16;
          }
          int i25 = 1 + localBitReaderBuffer1.readBits(i23);
          int i26 = 1 + localBitReaderBuffer1.readBits(i24);
          localByteBuffer.position(i20 + i25);
          int i27 = localByteBuffer.getInt();
          if (i27 == 1515870810)
          {
            if (i3 == 1)
              i10 = 1;
            i3 = 1;
          }
          while (true)
          {
            if (i10 == 0)
              this.frameSize = (i26 + this.frameSize);
            localByteBuffer.position(i20 + i26);
            break;
            if (i27 == 1191201283)
            {
              if (i4 == 1)
                i10 = 1;
              i4 = 1;
            }
            else if (i27 == 496366178)
            {
              if (i5 == 1)
                i10 = 1;
              i5 = 1;
            }
            else if (i27 == 1700671838)
            {
              if (i6 == 1)
                i10 = 1;
              i6 = 1;
            }
            else if (i27 == 176167201)
            {
              if (i7 == 1)
                i10 = 1;
              i7 = 1;
            }
            else if (i27 == 1101174087)
            {
              if (i8 == 1)
                i10 = 1;
              i8 = 1;
            }
            else if (i27 == 45126241)
            {
              if (i9 == 1)
                i10 = 1;
              i9 = 1;
            }
          }
        }
        throw new IOException("No DTS_SYNCWORD_* found at " + localByteBuffer.position());
      }
    }
    int i11 = -1;
    switch (this.samplesPerFrame)
    {
    default:
    case 512:
    case 1024:
    case 2048:
    case 4096:
    }
    while (i11 == -1)
    {
      return false;
      i11 = 0;
      continue;
      i11 = 1;
      continue;
      i11 = 2;
      continue;
      i11 = 3;
    }
    int i12 = 31;
    int i14;
    label1215: label1229: label1269: int i16;
    switch (k)
    {
    case 1:
    case 3:
    default:
      if (i1 == 0)
        if (i8 == 1)
          if (i9 == 0)
          {
            i14 = 17;
            this.type = "dtsl";
            this.samplerate = this.maxSampleRate;
            this.sampleSize = 24;
            this.ddts.setDTSSamplingFrequency(this.maxSampleRate);
            if (!this.isVBR)
              break label2348;
            this.ddts.setMaxBitRate(1000 * (this.coreBitRate + this.extPeakBitrate));
            this.ddts.setAvgBitRate(1000 * (this.coreBitRate + this.extAvgBitrate));
            this.ddts.setPcmSampleDepth(this.sampleSize);
            this.ddts.setFrameDuration(i11);
            this.ddts.setStreamConstruction(i14);
            if (((0x8 & this.coreChannelMask) <= 0) && ((0x1000 & this.coreChannelMask) <= 0))
              break label2372;
            this.ddts.setCoreLFEPresent(1);
            label1348: this.ddts.setCoreLayout(i12);
            this.ddts.setCoreSize(this.coreFramePayloadInBytes);
            this.ddts.setStereoDownmix(0);
            this.ddts.setRepresentationType(4);
            this.ddts.setChannelLayout(this.channelMask);
            if ((this.coreMaxSampleRate <= 0) || (this.extAvgBitrate <= 0))
              break label2383;
            this.ddts.setMultiAssetFlag(1);
            label1417: this.ddts.setLBRDurationMod(this.lbrCodingPresent);
            this.ddts.setReservedBoxPresent(0);
            this.channelCount = 0;
            i16 = 0;
            label1444: if (i16 >= 16)
              break label2407;
            if ((0x1 & this.channelMask >> i16) == 1)
              switch (i16)
              {
              case 1:
              case 2:
              case 5:
              case 6:
              case 9:
              case 10:
              case 11:
              case 13:
              default:
              case 0:
              case 3:
              case 4:
              case 7:
              case 8:
              case 12:
              case 14:
              }
          }
      break;
    case 0:
    case 2:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    }
    for (this.channelCount = (2 + this.channelCount); ; this.channelCount = (1 + this.channelCount))
    {
      i16++;
      break label1444;
      i12 = k;
      break;
      i14 = 21;
      this.type = "dtsh";
      break label1215;
      if (i7 == 1)
      {
        i14 = 18;
        this.type = "dtse";
        break label1215;
      }
      int i18 = i9;
      i14 = 0;
      if (i18 != 1)
        break label1215;
      this.type = "dtsh";
      if ((i4 == 0) && (i8 == 0))
      {
        i14 = 19;
        break label1215;
      }
      if ((i4 == 1) && (i8 == 0))
      {
        i14 = 20;
        break label1215;
      }
      i14 = 0;
      if (i4 != 0)
        break label1215;
      int i19 = i8;
      i14 = 0;
      if (i19 != 1)
        break label1215;
      i14 = 21;
      break label1215;
      if (i2 < 1)
      {
        if (n > 0)
          switch (m)
          {
          default:
            this.type = "dtsh";
            i14 = 0;
            break;
          case 0:
            i14 = 2;
            this.type = "dtsc";
            break;
          case 2:
            i14 = 4;
            this.type = "dtsc";
            break;
          case 6:
            i14 = 3;
            this.type = "dtsh";
            break;
          }
        i14 = 1;
        this.type = "dtsc";
        break label1229;
      }
      this.type = "dtsh";
      if (n == 0)
      {
        if ((i9 == 0) && (i4 == 1) && (i5 == 0) && (i6 == 0) && (i8 == 0) && (i7 == 0))
        {
          i14 = 5;
          break label1229;
        }
        if ((i9 == 0) && (i4 == 0) && (i5 == 0) && (i6 == 1) && (i8 == 0) && (i7 == 0))
        {
          i14 = 6;
          break label1229;
        }
        if ((i9 == 0) && (i4 == 1) && (i5 == 0) && (i6 == 1) && (i8 == 0) && (i7 == 0))
        {
          i14 = 9;
          break label1229;
        }
        if ((i9 == 0) && (i4 == 0) && (i5 == 1) && (i6 == 0) && (i8 == 0) && (i7 == 0))
        {
          i14 = 10;
          break label1229;
        }
        if ((i9 == 0) && (i4 == 1) && (i5 == 1) && (i6 == 0) && (i8 == 0) && (i7 == 0))
        {
          i14 = 13;
          break label1229;
        }
        i14 = 0;
        if (i9 != 0)
          break label1229;
        i14 = 0;
        if (i4 != 0)
          break label1229;
        i14 = 0;
        if (i5 != 0)
          break label1229;
        i14 = 0;
        if (i6 != 0)
          break label1229;
        int i17 = i8;
        i14 = 0;
        if (i17 != 1)
          break label1229;
        i14 = 0;
        if (i7 != 0)
          break label1229;
        i14 = 14;
        break label1229;
      }
      if ((m == 0) && (i9 == 0) && (i4 == 0) && (i5 == 0) && (i6 == 1) && (i8 == 0) && (i7 == 0))
      {
        i14 = 7;
        break label1229;
      }
      if ((m == 6) && (i9 == 0) && (i4 == 0) && (i5 == 0) && (i6 == 1) && (i8 == 0) && (i7 == 0))
      {
        i14 = 8;
        break label1229;
      }
      if ((m == 0) && (i9 == 0) && (i4 == 0) && (i5 == 1) && (i6 == 0) && (i8 == 0) && (i7 == 0))
      {
        i14 = 11;
        break label1229;
      }
      if ((m == 6) && (i9 == 0) && (i4 == 0) && (i5 == 1) && (i6 == 0) && (i8 == 0) && (i7 == 0))
      {
        i14 = 12;
        break label1229;
      }
      if ((m == 0) && (i9 == 0) && (i4 == 0) && (i5 == 0) && (i6 == 0) && (i8 == 1) && (i7 == 0))
      {
        i14 = 15;
        break label1229;
      }
      int i13 = m;
      i14 = 0;
      if (i13 != 2)
        break label1229;
      i14 = 0;
      if (i9 != 0)
        break label1229;
      i14 = 0;
      if (i4 != 0)
        break label1229;
      i14 = 0;
      if (i5 != 0)
        break label1229;
      i14 = 0;
      if (i6 != 0)
        break label1229;
      int i15 = i8;
      i14 = 0;
      if (i15 != 1)
        break label1229;
      i14 = 0;
      if (i7 != 0)
        break label1229;
      i14 = 16;
      break label1229;
      label2348: this.ddts.setMaxBitRate(1000 * (this.coreBitRate + this.extAvgBitrate));
      break label1269;
      label2372: this.ddts.setCoreLFEPresent(0);
      break label1348;
      label2383: this.ddts.setMultiAssetFlag(0);
      break label1417;
    }
    label2407: this.samples = generateSamples(this.dataSource, this.dataOffset, l, i1);
    this.sampleDurations = new long[this.samples.size()];
    Arrays.fill(this.sampleDurations, this.samplesPerFrame);
    return true;
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
    return this.sampleDurations;
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  public long[] getSyncSamples()
  {
    return null;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.trackMetaData;
  }

  class LookAhead
  {
    ByteBuffer buffer;
    long bufferStartPos;
    private final int corePresent;
    long dataEnd;
    DataSource dataSource;
    int inBufferPos = 0;
    long start;

    LookAhead(DataSource paramLong1, long arg3, long arg5, int arg7)
      throws IOException
    {
      this.dataSource = paramLong1;
      this.bufferStartPos = ???;
      Object localObject;
      this.dataEnd = (localObject + ???);
      int i;
      this.corePresent = i;
      fillBuffer();
    }

    private void discardByte()
    {
      this.inBufferPos = (1 + this.inBufferPos);
    }

    private void discardNext4AndMarkStart()
    {
      this.start = (this.bufferStartPos + this.inBufferPos);
      this.inBufferPos = (4 + this.inBufferPos);
    }

    private void discardQWord()
    {
      this.inBufferPos = (4 + this.inBufferPos);
    }

    private void fillBuffer()
      throws IOException
    {
      System.err.println("Fill Buffer");
      this.buffer = this.dataSource.map(this.bufferStartPos, Math.min(this.dataEnd - this.bufferStartPos, 67108864L));
    }

    private ByteBuffer getSample()
    {
      if (this.start >= this.bufferStartPos)
      {
        this.buffer.position((int)(this.start - this.bufferStartPos));
        ByteBuffer localByteBuffer = this.buffer.slice();
        localByteBuffer.limit((int)(this.inBufferPos - (this.start - this.bufferStartPos)));
        return (ByteBuffer)localByteBuffer;
      }
      throw new RuntimeException("damn! NAL exceeds buffer");
    }

    private boolean nextFourEquals(byte paramByte1, byte paramByte2, byte paramByte3, byte paramByte4)
      throws IOException
    {
      boolean bool2;
      if (this.buffer.limit() - this.inBufferPos >= 4)
      {
        byte b1 = this.buffer.get(this.inBufferPos);
        bool2 = false;
        if (b1 == paramByte1)
        {
          byte b2 = this.buffer.get(1 + this.inBufferPos);
          bool2 = false;
          if (b2 == paramByte2)
          {
            byte b3 = this.buffer.get(2 + this.inBufferPos);
            bool2 = false;
            if (b3 == paramByte3)
            {
              byte b4 = this.buffer.get(3 + this.inBufferPos);
              bool2 = false;
              if (b4 == paramByte4)
                bool2 = true;
            }
          }
        }
      }
      boolean bool1;
      do
      {
        return bool2;
        bool1 = 4L + (this.bufferStartPos + this.inBufferPos) < this.dataSource.size();
        bool2 = false;
      }
      while (bool1);
      throw new EOFException();
    }

    private boolean nextFourEquals0x64582025()
      throws IOException
    {
      return nextFourEquals((byte)100, (byte)88, (byte)32, (byte)37);
    }

    private boolean nextFourEquals0x64582025orEof()
      throws IOException
    {
      return nextFourEqualsOrEof((byte)100, (byte)88, (byte)32, (byte)37);
    }

    private boolean nextFourEquals0x7FFE8001()
      throws IOException
    {
      return nextFourEquals((byte)127, (byte)-2, (byte)-128, (byte)1);
    }

    private boolean nextFourEquals0x7FFE8001orEof()
      throws IOException
    {
      return nextFourEqualsOrEof((byte)127, (byte)-2, (byte)-128, (byte)1);
    }

    private boolean nextFourEqualsOrEof(byte paramByte1, byte paramByte2, byte paramByte3, byte paramByte4)
      throws IOException
    {
      if (this.buffer.limit() - this.inBufferPos >= 4)
      {
        if ((this.bufferStartPos + this.inBufferPos) % 1048576L == 0L)
          System.err.println("" + (this.bufferStartPos + this.inBufferPos) / 1024L / 1024L);
        if ((this.buffer.get(this.inBufferPos) != paramByte1) || (this.buffer.get(1 + this.inBufferPos) != paramByte2) || (this.buffer.get(2 + this.inBufferPos) != paramByte3) || (this.buffer.get(3 + this.inBufferPos) != paramByte4));
      }
      do
      {
        return true;
        return false;
        if (4L + (this.bufferStartPos + this.inBufferPos) <= this.dataEnd)
          break;
      }
      while (this.bufferStartPos + this.inBufferPos == this.dataEnd);
      return false;
      this.bufferStartPos = this.start;
      this.inBufferPos = 0;
      fillBuffer();
      return nextFourEquals0x7FFE8001();
    }

    public ByteBuffer findNextStart()
      throws IOException
    {
      try
      {
        if (this.corePresent == 1)
        {
          if (nextFourEquals0x7FFE8001());
        }
        else
          while (!nextFourEquals0x64582025())
          {
            discardByte();
            break;
          }
        discardNext4AndMarkStart();
        if (this.corePresent == 1)
        {
          if (nextFourEquals0x7FFE8001orEof());
        }
        else
          while (!nextFourEquals0x64582025orEof())
          {
            discardQWord();
            break;
          }
        ByteBuffer localByteBuffer = getSample();
        return localByteBuffer;
      }
      catch (EOFException localEOFException)
      {
      }
      return null;
    }
  }
}