package com.google.android.exoplayer.chunk.parser.webm;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.chunk.parser.Extractor;
import com.google.android.exoplayer.chunk.parser.SegmentIndex;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import com.google.android.exoplayer.util.LongArray;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

public final class WebmExtractor
  implements Extractor
{
  private static final String CODEC_ID_OPUS = "A_OPUS";
  private static final String CODEC_ID_VORBIS = "A_VORBIS";
  private static final String CODEC_ID_VP9 = "V_VP9";
  private static final String DOC_TYPE_WEBM = "webm";
  private static final int ID_AUDIO = 225;
  private static final int ID_BLOCK = 161;
  private static final int ID_BLOCK_GROUP = 160;
  private static final int ID_CHANNELS = 159;
  private static final int ID_CLUSTER = 524531317;
  private static final int ID_CODEC_DELAY = 22186;
  private static final int ID_CODEC_ID = 134;
  private static final int ID_CODEC_PRIVATE = 25506;
  private static final int ID_CUES = 475249515;
  private static final int ID_CUE_CLUSTER_POSITION = 241;
  private static final int ID_CUE_POINT = 187;
  private static final int ID_CUE_TIME = 179;
  private static final int ID_CUE_TRACK_POSITIONS = 183;
  private static final int ID_DOC_TYPE = 17026;
  private static final int ID_DOC_TYPE_READ_VERSION = 17029;
  private static final int ID_DURATION = 17545;
  private static final int ID_EBML = 440786851;
  private static final int ID_EBML_READ_VERSION = 17143;
  private static final int ID_INFO = 357149030;
  private static final int ID_PIXEL_HEIGHT = 186;
  private static final int ID_PIXEL_WIDTH = 176;
  private static final int ID_SAMPLING_FREQUENCY = 181;
  private static final int ID_SEEK_PRE_ROLL = 22203;
  private static final int ID_SEGMENT = 408125543;
  private static final int ID_SIMPLE_BLOCK = 163;
  private static final int ID_TIMECODE_SCALE = 2807729;
  private static final int ID_TIME_CODE = 231;
  private static final int ID_TRACKS = 374648427;
  private static final int ID_TRACK_ENTRY = 174;
  private static final int ID_VIDEO = 224;
  private static final int LACING_EBML = 3;
  private static final int LACING_FIXED = 2;
  private static final int LACING_NONE = 0;
  private static final int LACING_XIPH = 1;
  private static final int OPUS_MAX_INPUT_SIZE = 5760;
  private static final int READ_TERMINATING_RESULTS = 39;
  private static final int UNKNOWN = -1;
  private static final int VORBIS_MAX_INPUT_SIZE = 8192;
  private int channelCount = -1;
  private long clusterTimecodeUs = -1L;
  private long codecDelayNs;
  private String codecId;
  private byte[] codecPrivate;
  private LongArray cueClusterPositions;
  private LongArray cueTimesUs;
  private SegmentIndex cues;
  private long cuesSizeBytes = -1L;
  private long durationUs = -1L;
  private MediaFormat format;
  private int pixelHeight = -1;
  private int pixelWidth = -1;
  private int readResults;
  private final EbmlReader reader;
  private SampleHolder sampleHolder;
  private int sampleRate = -1;
  private long seekPreRollNs;
  private boolean seenAudioTrack;
  private long segmentEndOffsetBytes = -1L;
  private long segmentStartOffsetBytes = -1L;
  private final byte[] simpleBlockTimecodeAndFlags = new byte[3];
  private long simpleBlockTimecodeUs = -1L;
  private long timecodeScale = 1000000L;

  public WebmExtractor()
  {
    this(new DefaultEbmlReader());
  }

  WebmExtractor(EbmlReader paramEbmlReader)
  {
    this.reader = paramEbmlReader;
    this.reader.setEventHandler(new InnerEbmlEventHandler(null));
  }

  private void buildAudioFormat()
    throws ParserException
  {
    if ((this.channelCount != -1) && (this.sampleRate != -1) && ((this.format == null) || (this.format.channelCount != this.channelCount) || (this.format.sampleRate != this.sampleRate)))
      if ("A_VORBIS".equals(this.codecId))
        this.format = MediaFormat.createAudioFormat("audio/vorbis", 8192, this.channelCount, this.sampleRate, parseVorbisCodecPrivate());
    while (this.format != null)
      while (true)
      {
        this.readResults = (0x8 | this.readResults);
        return;
        if ("A_OPUS".equals(this.codecId))
        {
          ArrayList localArrayList = new ArrayList(3);
          localArrayList.add(this.codecPrivate);
          localArrayList.add(ByteBuffer.allocate(64).putLong(this.codecDelayNs).array());
          localArrayList.add(ByteBuffer.allocate(64).putLong(this.seekPreRollNs).array());
          this.format = MediaFormat.createAudioFormat("audio/opus", 5760, this.channelCount, this.sampleRate, localArrayList);
        }
      }
    throw new ParserException("Unable to build format");
  }

  private void buildCues()
    throws ParserException
  {
    if (this.segmentStartOffsetBytes == -1L)
      throw new ParserException("Segment start/end offsets unknown");
    if (this.durationUs == -1L)
      throw new ParserException("Duration unknown");
    if (this.cuesSizeBytes == -1L)
      throw new ParserException("Cues size unknown");
    if ((this.cueTimesUs == null) || (this.cueClusterPositions == null) || (this.cueTimesUs.size() == 0) || (this.cueTimesUs.size() != this.cueClusterPositions.size()))
      throw new ParserException("Invalid/missing cue points");
    int i = this.cueTimesUs.size();
    int[] arrayOfInt = new int[i];
    long[] arrayOfLong1 = new long[i];
    long[] arrayOfLong2 = new long[i];
    long[] arrayOfLong3 = new long[i];
    for (int j = 0; j < i; j++)
    {
      arrayOfLong3[j] = this.cueTimesUs.get(j);
      arrayOfLong1[j] = (this.segmentStartOffsetBytes + this.cueClusterPositions.get(j));
    }
    for (int k = 0; k < i - 1; k++)
    {
      arrayOfInt[k] = ((int)(arrayOfLong1[(k + 1)] - arrayOfLong1[k]));
      arrayOfLong2[k] = (arrayOfLong3[(k + 1)] - arrayOfLong3[k]);
    }
    arrayOfInt[(i - 1)] = ((int)(this.segmentEndOffsetBytes - arrayOfLong1[(i - 1)]));
    arrayOfLong2[(i - 1)] = (this.durationUs - arrayOfLong3[(i - 1)]);
    this.cues = new SegmentIndex((int)this.cuesSizeBytes, arrayOfInt, arrayOfLong1, arrayOfLong2, arrayOfLong3);
    this.cueTimesUs = null;
    this.cueClusterPositions = null;
    this.readResults = (0x10 | this.readResults);
  }

  private void buildVideoFormat()
    throws ParserException
  {
    if ((this.pixelWidth != -1) && (this.pixelHeight != -1) && ((this.format == null) || (this.format.width != this.pixelWidth) || (this.format.height != this.pixelHeight)))
    {
      this.format = MediaFormat.createVideoFormat("video/x-vnd.on2.vp9", -1, this.pixelWidth, this.pixelHeight, null);
      this.readResults = (0x8 | this.readResults);
    }
    while (this.format != null)
      return;
    throw new ParserException("Unable to build format");
  }

  private boolean isCodecSupported(String paramString)
  {
    return ("V_VP9".equals(paramString)) || ("A_OPUS".equals(paramString)) || ("A_VORBIS".equals(paramString));
  }

  private ArrayList<byte[]> parseVorbisCodecPrivate()
    throws ParserException
  {
    try
    {
      if (this.codecPrivate[0] != 2)
        throw new ParserException("Error parsing vorbis codec private");
    }
    catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
    {
      throw new ParserException("Error parsing vorbis codec private");
    }
    int i = 0;
    for (int j = 1; this.codecPrivate[j] == -1; j++)
      i += 255;
    byte[] arrayOfByte1 = this.codecPrivate;
    int k = j + 1;
    int m = i + arrayOfByte1[j];
    int n = 0;
    for (int i1 = k; this.codecPrivate[i1] == -1; i1++)
      n += 255;
    byte[] arrayOfByte2 = this.codecPrivate;
    int i2 = i1 + 1;
    int i3 = n + arrayOfByte2[i1];
    if (this.codecPrivate[i2] != 1)
      throw new ParserException("Error parsing vorbis codec private");
    byte[] arrayOfByte3 = new byte[m];
    System.arraycopy(this.codecPrivate, i2, arrayOfByte3, 0, m);
    int i4 = i2 + m;
    if (this.codecPrivate[i4] != 3)
      throw new ParserException("Error parsing vorbis codec private");
    int i5 = i4 + i3;
    if (this.codecPrivate[i5] != 5)
      throw new ParserException("Error parsing vorbis codec private");
    byte[] arrayOfByte4 = new byte[this.codecPrivate.length - i5];
    System.arraycopy(this.codecPrivate, i5, arrayOfByte4, 0, this.codecPrivate.length - i5);
    ArrayList localArrayList = new ArrayList(2);
    localArrayList.add(arrayOfByte3);
    localArrayList.add(arrayOfByte4);
    return localArrayList;
  }

  private long scaleTimecodeToUs(long paramLong)
  {
    return TimeUnit.NANOSECONDS.toMicros(paramLong * this.timecodeScale);
  }

  public long getDurationUs()
  {
    if (this.durationUs == -1L)
      return -1L;
    return this.durationUs;
  }

  int getElementType(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return 0;
    case 160:
    case 174:
    case 183:
    case 187:
    case 224:
    case 225:
    case 357149030:
    case 374648427:
    case 408125543:
    case 440786851:
    case 475249515:
    case 524531317:
      return 1;
    case 159:
    case 176:
    case 179:
    case 186:
    case 231:
    case 241:
    case 17029:
    case 17143:
    case 22186:
    case 22203:
    case 2807729:
      return 2;
    case 134:
    case 17026:
      return 3;
    case 161:
    case 163:
    case 25506:
      return 4;
    case 181:
    case 17545:
    }
    return 5;
  }

  public MediaFormat getFormat()
  {
    return this.format;
  }

  public SegmentIndex getIndex()
  {
    return this.cues;
  }

  public Map<UUID, byte[]> getPsshInfo()
  {
    return null;
  }

  public boolean hasRelativeIndexOffsets()
  {
    return false;
  }

  boolean onBinaryElement(int paramInt1, long paramLong, int paramInt2, int paramInt3, NonBlockingInputStream paramNonBlockingInputStream)
    throws ParserException
  {
    switch (paramInt1)
    {
    default:
    case 161:
    case 163:
    case 25506:
    }
    while (true)
    {
      return true;
      if (this.sampleHolder == null)
      {
        this.readResults = (0x20 | this.readResults);
        return false;
      }
      this.reader.readVarint(paramNonBlockingInputStream);
      this.reader.readBytes(paramNonBlockingInputStream, this.simpleBlockTimecodeAndFlags, 3);
      long l1 = scaleTimecodeToUs(this.simpleBlockTimecodeAndFlags[0] << 8 | 0xFF & this.simpleBlockTimecodeAndFlags[1]);
      int i;
      if (paramInt1 == 161)
      {
        i = 1;
        if ((0x8 & this.simpleBlockTimecodeAndFlags[2]) != 8)
          break label235;
      }
      label235: for (boolean bool = true; ; bool = false)
      {
        int j = (0x6 & this.simpleBlockTimecodeAndFlags[2]) >> 1;
        switch (j)
        {
        default:
          throw new ParserException("Lacing mode " + j + " not supported");
          if ((0x80 & this.simpleBlockTimecodeAndFlags[2]) == 128);
          for (i = 1; ; i = 0)
            break;
        case 0:
        }
      }
      long l2 = paramLong + paramInt2 + paramInt3;
      this.simpleBlockTimecodeUs = (l1 + this.clusterTimecodeUs);
      SampleHolder localSampleHolder = this.sampleHolder;
      int k;
      label277: ByteBuffer localByteBuffer;
      if (i != 0)
      {
        k = 1;
        localSampleHolder.flags = k;
        this.sampleHolder.decodeOnly = bool;
        this.sampleHolder.timeUs = (l1 + this.clusterTimecodeUs);
        this.sampleHolder.size = ((int)(l2 - this.reader.getBytesRead()));
        if ((this.sampleHolder.data == null) || (this.sampleHolder.data.capacity() < this.sampleHolder.size))
          this.sampleHolder.replaceBuffer(this.sampleHolder.size);
        localByteBuffer = this.sampleHolder.data;
        if (localByteBuffer != null)
          break label431;
        this.reader.skipBytes(paramNonBlockingInputStream, this.sampleHolder.size);
        this.sampleHolder.size = 0;
      }
      while (true)
      {
        this.readResults = (0x4 | this.readResults);
        break;
        k = 0;
        break label277;
        label431: this.reader.readBytes(paramNonBlockingInputStream, localByteBuffer, this.sampleHolder.size);
      }
      this.codecPrivate = new byte[paramInt3];
      this.reader.readBytes(paramNonBlockingInputStream, this.codecPrivate, paramInt3);
    }
  }

  boolean onFloatElement(int paramInt, double paramDouble)
  {
    switch (paramInt)
    {
    default:
    case 17545:
    case 181:
    }
    while (true)
    {
      return true;
      this.durationUs = scaleTimecodeToUs(()paramDouble);
      continue;
      this.sampleRate = ((int)paramDouble);
    }
  }

  boolean onIntegerElement(int paramInt, long paramLong)
    throws ParserException
  {
    switch (paramInt)
    {
    default:
    case 17143:
    case 17029:
    case 2807729:
    case 176:
    case 186:
    case 22186:
    case 22203:
    case 159:
    case 179:
    case 241:
    case 231:
    }
    while (true)
    {
      return true;
      if (paramLong != 1L)
      {
        throw new ParserException("EBMLReadVersion " + paramLong + " not supported");
        if ((paramLong < 1L) || (paramLong > 2L))
        {
          throw new ParserException("DocTypeReadVersion " + paramLong + " not supported");
          this.timecodeScale = paramLong;
          continue;
          this.pixelWidth = ((int)paramLong);
          continue;
          this.pixelHeight = ((int)paramLong);
          continue;
          this.codecDelayNs = paramLong;
          continue;
          this.seekPreRollNs = paramLong;
          continue;
          this.channelCount = ((int)paramLong);
          continue;
          this.cueTimesUs.add(scaleTimecodeToUs(paramLong));
          continue;
          this.cueClusterPositions.add(paramLong);
          continue;
          this.clusterTimecodeUs = scaleTimecodeToUs(paramLong);
        }
      }
    }
  }

  boolean onMasterElementEnd(int paramInt)
    throws ParserException
  {
    switch (paramInt)
    {
    default:
    case 475249515:
    case 224:
    case 225:
    case 174:
    }
    do
    {
      return true;
      buildCues();
      return false;
      buildVideoFormat();
      return true;
      this.seenAudioTrack = true;
      return true;
    }
    while (!this.seenAudioTrack);
    buildAudioFormat();
    return true;
  }

  boolean onMasterElementStart(int paramInt1, long paramLong1, int paramInt2, long paramLong2)
    throws ParserException
  {
    switch (paramInt1)
    {
    default:
    case 408125543:
    case 475249515:
    }
    while (true)
    {
      return true;
      if ((this.segmentStartOffsetBytes != -1L) || (this.segmentEndOffsetBytes != -1L))
        throw new ParserException("Multiple Segment elements not supported");
      this.segmentStartOffsetBytes = (paramLong1 + paramInt2);
      this.segmentEndOffsetBytes = (paramLong2 + (paramLong1 + paramInt2));
      continue;
      this.cuesSizeBytes = (paramLong2 + paramInt2);
      this.cueTimesUs = new LongArray();
      this.cueClusterPositions = new LongArray();
    }
  }

  boolean onStringElement(int paramInt, String paramString)
    throws ParserException
  {
    switch (paramInt)
    {
    default:
    case 17026:
    case 134:
    }
    while (true)
    {
      return true;
      if (!"webm".equals(paramString))
      {
        throw new ParserException("DocType " + paramString + " not supported");
        if (!isCodecSupported(paramString))
          throw new ParserException("CodecID " + paramString + " not supported");
        this.codecId = paramString;
      }
    }
  }

  public int read(NonBlockingInputStream paramNonBlockingInputStream, SampleHolder paramSampleHolder)
    throws ParserException
  {
    this.sampleHolder = paramSampleHolder;
    this.readResults = 0;
    while ((0x27 & this.readResults) == 0)
    {
      int i = this.reader.read(paramNonBlockingInputStream);
      if (i == 1)
        this.readResults = (0x1 | this.readResults);
      else if (i == 2)
        this.readResults = (0x2 | this.readResults);
    }
    this.sampleHolder = null;
    return this.readResults;
  }

  public boolean seekTo(long paramLong, boolean paramBoolean)
  {
    if ((paramBoolean) && (this.cues != null) && (this.clusterTimecodeUs != -1L) && (this.simpleBlockTimecodeUs != -1L) && (paramLong >= this.simpleBlockTimecodeUs))
    {
      int i = Arrays.binarySearch(this.cues.timesUs, this.clusterTimecodeUs);
      if ((i >= 0) && (paramLong < this.clusterTimecodeUs + this.cues.durationsUs[i]))
        return false;
    }
    this.clusterTimecodeUs = -1L;
    this.simpleBlockTimecodeUs = -1L;
    this.reader.reset();
    return true;
  }

  private final class InnerEbmlEventHandler
    implements EbmlEventHandler
  {
    private InnerEbmlEventHandler()
    {
    }

    public int getElementType(int paramInt)
    {
      return WebmExtractor.this.getElementType(paramInt);
    }

    public boolean onBinaryElement(int paramInt1, long paramLong, int paramInt2, int paramInt3, NonBlockingInputStream paramNonBlockingInputStream)
      throws ParserException
    {
      return WebmExtractor.this.onBinaryElement(paramInt1, paramLong, paramInt2, paramInt3, paramNonBlockingInputStream);
    }

    public void onFloatElement(int paramInt, double paramDouble)
    {
      WebmExtractor.this.onFloatElement(paramInt, paramDouble);
    }

    public void onIntegerElement(int paramInt, long paramLong)
      throws ParserException
    {
      WebmExtractor.this.onIntegerElement(paramInt, paramLong);
    }

    public void onMasterElementEnd(int paramInt)
      throws ParserException
    {
      WebmExtractor.this.onMasterElementEnd(paramInt);
    }

    public void onMasterElementStart(int paramInt1, long paramLong1, int paramInt2, long paramLong2)
      throws ParserException
    {
      WebmExtractor.this.onMasterElementStart(paramInt1, paramLong1, paramInt2, paramLong2);
    }

    public void onStringElement(int paramInt, String paramString)
      throws ParserException
    {
      WebmExtractor.this.onStringElement(paramInt, paramString);
    }
  }
}