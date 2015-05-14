package com.google.android.exoplayer.hls.parser;

import android.util.Log;
import android.util.SparseArray;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableBitArray;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

public final class TsExtractor extends HlsExtractor
{
  private static final long MAX_PTS = 8589934591L;
  private static final String SEI_MIME = "application/eia-608";
  private static final String TAG = "TsExtractor";
  private static final int TS_PACKET_SIZE = 188;
  private static final int TS_PAT_PID = 0;
  private static final int TS_STREAM_TYPE_AAC = 15;
  private static final int TS_STREAM_TYPE_EIA608 = 256;
  private static final int TS_STREAM_TYPE_H264 = 27;
  private static final int TS_STREAM_TYPE_ID3 = 21;
  private static final int TS_SYNC_BYTE = 71;
  private final BufferPool bufferPool;
  private final long firstSampleTimestamp;
  private boolean hasAudio = false;
  private boolean hasVideo = false;
  private long lastPts;
  private volatile boolean prepared;
  private final SparseArray<SampleQueue> sampleQueues;
  private long timestampOffsetUs;
  private final ParsableByteArray tsPacketBuffer;
  private int tsPacketBytesRead;
  private final SparseArray<TsPayloadReader> tsPayloadReaders;
  private final ParsableBitArray tsScratch;

  public TsExtractor(boolean paramBoolean, long paramLong, BufferPool paramBufferPool)
  {
    super(paramBoolean);
    this.firstSampleTimestamp = paramLong;
    this.bufferPool = paramBufferPool;
    this.tsScratch = new ParsableBitArray(new byte[3]);
    this.tsPacketBuffer = new ParsableByteArray(188);
    this.sampleQueues = new SparseArray();
    this.tsPayloadReaders = new SparseArray();
    this.tsPayloadReaders.put(0, new PatReader());
    this.lastPts = -9223372036854775808L;
  }

  private boolean checkPrepared()
  {
    int i = this.sampleQueues.size();
    if (i == 0)
      return false;
    int j = 0;
    for (int k = 0; k < i; k++)
    {
      if (((SampleQueue)this.sampleQueues.valueAt(k)).getMediaFormat() != null)
        if (((SampleQueue)this.sampleQueues.valueAt(k)).getMediaFormat().getFrameworkMediaFormatV16().getString("mime").equals("video/avc"))
          this.hasVideo = true;
      while ((j != 0) && (this.hasVideo))
      {
        return false;
        if (((SampleQueue)this.sampleQueues.valueAt(k)).getMediaFormat().getFrameworkMediaFormatV16().getString("mime").equals("audio/mp4a-latm"))
        {
          this.hasAudio = true;
        }
        else if ((((SampleQueue)this.sampleQueues.valueAt(k)).getMediaFormat().getFrameworkMediaFormatV16().getString("mime").equals("application/eia-608")) && ((this.hasAudio) || (this.hasVideo)))
        {
          return true;
          j = 1;
        }
      }
      if ((this.hasAudio) && (!this.hasVideo))
        return true;
    }
    return false;
  }

  public void discardUntil(int paramInt, long paramLong)
  {
    Assertions.checkState(this.prepared);
    ((SampleQueue)this.sampleQueues.valueAt(paramInt)).discardUntil(paramLong);
  }

  public com.google.android.exoplayer.MediaFormat getFormat(int paramInt)
  {
    Assertions.checkState(this.prepared);
    return ((SampleQueue)this.sampleQueues.valueAt(paramInt)).getMediaFormat();
  }

  public long getLargestSampleTimestamp()
  {
    long l = -9223372036854775808L;
    for (int i = 0; i < this.sampleQueues.size(); i++)
      l = Math.max(l, ((SampleQueue)this.sampleQueues.valueAt(i)).getLargestParsedTimestampUs());
    return l;
  }

  public boolean getSample(int paramInt, SampleHolder paramSampleHolder)
  {
    Assertions.checkState(this.prepared);
    return ((SampleQueue)this.sampleQueues.valueAt(paramInt)).getSample(paramSampleHolder);
  }

  protected SampleQueue getSampleQueue(int paramInt)
  {
    return (SampleQueue)this.sampleQueues.valueAt(paramInt);
  }

  public int getTrackCount()
  {
    Assertions.checkState(this.prepared);
    return this.sampleQueues.size();
  }

  public boolean hasSamples(int paramInt)
  {
    Assertions.checkState(this.prepared);
    return !((SampleQueue)this.sampleQueues.valueAt(paramInt)).isEmpty();
  }

  public boolean isPrepared()
  {
    return this.prepared;
  }

  long ptsToTimeUs(long paramLong)
  {
    long l3;
    long l4;
    if (this.lastPts != -9223372036854775808L)
    {
      long l2 = (4294967295L + this.lastPts) / 8589934591L;
      l3 = paramLong + 8589934591L * (l2 - 1L);
      l4 = paramLong + 8589934591L * l2;
      if (Math.abs(l3 - this.lastPts) >= Math.abs(l4 - this.lastPts))
        break label117;
    }
    label117: for (paramLong = l3; ; paramLong = l4)
    {
      long l1 = 1000000L * paramLong / 90000L;
      if (this.lastPts == -9223372036854775808L)
        this.timestampOffsetUs = (this.firstSampleTimestamp - l1);
      this.lastPts = paramLong;
      return l1 + this.timestampOffsetUs;
    }
  }

  public int read(DataSource paramDataSource)
    throws IOException
  {
    int i = paramDataSource.read(this.tsPacketBuffer.data, this.tsPacketBytesRead, 188 - this.tsPacketBytesRead);
    if (i == -1)
      i = -1;
    do
    {
      do
      {
        do
        {
          return i;
          this.tsPacketBytesRead = (i + this.tsPacketBytesRead);
        }
        while (this.tsPacketBytesRead < 188);
        this.tsPacketBytesRead = 0;
        this.tsPacketBuffer.setPosition(0);
        this.tsPacketBuffer.setLimit(188);
      }
      while (this.tsPacketBuffer.readUnsignedByte() != 71);
      this.tsPacketBuffer.readBytes(this.tsScratch, 3);
      this.tsScratch.skipBits(1);
      boolean bool1 = this.tsScratch.readBit();
      this.tsScratch.skipBits(1);
      int j = this.tsScratch.readBits(13);
      this.tsScratch.skipBits(2);
      boolean bool2 = this.tsScratch.readBit();
      boolean bool3 = this.tsScratch.readBit();
      if (bool2)
      {
        int k = this.tsPacketBuffer.readUnsignedByte();
        this.tsPacketBuffer.skip(k);
      }
      if (bool3)
      {
        TsPayloadReader localTsPayloadReader = (TsPayloadReader)this.tsPayloadReaders.get(j);
        if (localTsPayloadReader != null)
          localTsPayloadReader.consume(this.tsPacketBuffer, bool1);
      }
    }
    while (this.prepared);
    this.prepared = checkPrepared();
    return i;
  }

  public void release()
  {
    for (int i = 0; i < this.sampleQueues.size(); i++)
      ((SampleQueue)this.sampleQueues.valueAt(i)).release();
  }

  private class PatReader extends TsExtractor.TsPayloadReader
  {
    private final ParsableBitArray patScratch = new ParsableBitArray(new byte[4]);

    public PatReader()
    {
      super();
    }

    public void consume(ParsableByteArray paramParsableByteArray, boolean paramBoolean)
    {
      if (paramBoolean)
        paramParsableByteArray.skip(paramParsableByteArray.readUnsignedByte());
      paramParsableByteArray.readBytes(this.patScratch, 3);
      this.patScratch.skipBits(12);
      int i = this.patScratch.readBits(12);
      paramParsableByteArray.skip(5);
      int j = (i - 9) / 4;
      for (int k = 0; k < j; k++)
      {
        paramParsableByteArray.readBytes(this.patScratch, 4);
        this.patScratch.skipBits(19);
        int m = this.patScratch.readBits(13);
        TsExtractor.this.tsPayloadReaders.put(m, new TsExtractor.PmtReader(TsExtractor.this));
      }
    }
  }

  private class PesReader extends TsExtractor.TsPayloadReader
  {
    private static final int HEADER_SIZE = 9;
    private static final int MAX_HEADER_EXTENSION_SIZE = 5;
    private static final int STATE_FINDING_HEADER = 0;
    private static final int STATE_READING_BODY = 3;
    private static final int STATE_READING_HEADER = 1;
    private static final int STATE_READING_HEADER_EXTENSION = 2;
    private boolean bodyStarted;
    private int bytesRead;
    private int extendedHeaderLength;
    private int payloadSize;
    private final ElementaryStreamReader pesPayloadReader;
    private final ParsableBitArray pesScratch;
    private boolean ptsFlag;
    private int state;
    private long timeUs;

    public PesReader(ElementaryStreamReader arg2)
    {
      super();
      Object localObject;
      this.pesPayloadReader = localObject;
      this.pesScratch = new ParsableBitArray(new byte[9]);
      this.state = 0;
    }

    private boolean continueRead(ParsableByteArray paramParsableByteArray, byte[] paramArrayOfByte, int paramInt)
    {
      int i = Math.min(paramParsableByteArray.bytesLeft(), paramInt - this.bytesRead);
      if (i <= 0)
        return true;
      if (paramArrayOfByte == null)
        paramParsableByteArray.skip(i);
      while (true)
      {
        this.bytesRead = (i + this.bytesRead);
        if (this.bytesRead == paramInt)
          break;
        return false;
        paramParsableByteArray.readBytes(paramArrayOfByte, this.bytesRead, i);
      }
    }

    private boolean parseHeader()
    {
      this.pesScratch.setPosition(0);
      int i = this.pesScratch.readBits(24);
      if (i != 1)
      {
        Log.w("TsExtractor", "Unexpected start code prefix: " + i);
        this.payloadSize = -1;
        return false;
      }
      this.pesScratch.skipBits(8);
      int j = this.pesScratch.readBits(16);
      this.pesScratch.skipBits(8);
      this.ptsFlag = this.pesScratch.readBit();
      this.pesScratch.skipBits(7);
      this.extendedHeaderLength = this.pesScratch.readBits(8);
      if (j == 0);
      for (this.payloadSize = -1; ; this.payloadSize = (-9 + (j + 6) - this.extendedHeaderLength))
        return true;
    }

    private void parseHeaderExtension()
    {
      this.pesScratch.setPosition(0);
      this.timeUs = 0L;
      if (this.ptsFlag)
      {
        this.pesScratch.skipBits(4);
        long l1 = this.pesScratch.readBitsLong(3) << 30;
        this.pesScratch.skipBits(1);
        long l2 = l1 | this.pesScratch.readBitsLong(15) << 15;
        this.pesScratch.skipBits(1);
        long l3 = l2 | this.pesScratch.readBitsLong(15);
        this.pesScratch.skipBits(1);
        this.timeUs = TsExtractor.this.ptsToTimeUs(l3);
      }
    }

    private void setState(int paramInt)
    {
      this.state = paramInt;
      this.bytesRead = 0;
    }

    public void consume(ParsableByteArray paramParsableByteArray, boolean paramBoolean)
    {
      if (paramBoolean)
        switch (this.state)
        {
        case 0:
        case 1:
        default:
          setState(1);
        case 2:
        case 3:
        }
      while (true)
        if (paramParsableByteArray.bytesLeft() > 0)
          switch (this.state)
          {
          default:
            break;
          case 0:
            paramParsableByteArray.skip(paramParsableByteArray.bytesLeft());
            continue;
            Log.w("TsExtractor", "Unexpected start indicator reading extended header");
            break;
            if (this.payloadSize != -1)
              Log.w("TsExtractor", "Unexpected start indicator: expected " + this.payloadSize + " more bytes");
            if (!this.bodyStarted)
              break;
            this.pesPayloadReader.packetFinished();
            break;
          case 1:
            if (continueRead(paramParsableByteArray, this.pesScratch.getData(), 9))
            {
              if (parseHeader());
              for (int m = 2; ; m = 0)
              {
                setState(m);
                break;
              }
            }
            break;
          case 2:
            int k = Math.min(5, this.extendedHeaderLength);
            if ((continueRead(paramParsableByteArray, this.pesScratch.getData(), k)) && (continueRead(paramParsableByteArray, null, this.extendedHeaderLength)))
            {
              parseHeaderExtension();
              this.bodyStarted = false;
              setState(3);
            }
            break;
          case 3:
            int i = paramParsableByteArray.bytesLeft();
            int j;
            label286: ElementaryStreamReader localElementaryStreamReader;
            long l;
            if (this.payloadSize == -1)
            {
              j = 0;
              if (j > 0)
              {
                i -= j;
                paramParsableByteArray.setLimit(i + paramParsableByteArray.getPosition());
              }
              localElementaryStreamReader = this.pesPayloadReader;
              l = this.timeUs;
              if (this.bodyStarted)
                break label394;
            }
            label394: for (boolean bool = true; ; bool = false)
            {
              localElementaryStreamReader.consume(paramParsableByteArray, l, bool);
              this.bodyStarted = true;
              if (this.payloadSize == -1)
                break;
              this.payloadSize -= i;
              if (this.payloadSize != 0)
                break;
              this.pesPayloadReader.packetFinished();
              setState(1);
              break;
              j = i - this.payloadSize;
              break label286;
            }
          }
    }
  }

  private class PmtReader extends TsExtractor.TsPayloadReader
  {
    private final ParsableBitArray pmtScratch = new ParsableBitArray(new byte[5]);

    public PmtReader()
    {
      super();
    }

    public void consume(ParsableByteArray paramParsableByteArray, boolean paramBoolean)
    {
      if (paramBoolean)
        paramParsableByteArray.skip(paramParsableByteArray.readUnsignedByte());
      paramParsableByteArray.readBytes(this.pmtScratch, 3);
      this.pmtScratch.skipBits(12);
      int i = this.pmtScratch.readBits(12);
      paramParsableByteArray.skip(7);
      paramParsableByteArray.readBytes(this.pmtScratch, 2);
      this.pmtScratch.skipBits(4);
      int j = this.pmtScratch.readBits(12);
      paramParsableByteArray.skip(j);
      int k = -4 + (i - 9 - j);
      label359: 
      while (k > 0)
      {
        paramParsableByteArray.readBytes(this.pmtScratch, 5);
        int m = this.pmtScratch.readBits(8);
        this.pmtScratch.skipBits(3);
        int n = this.pmtScratch.readBits(13);
        this.pmtScratch.skipBits(4);
        int i1 = this.pmtScratch.readBits(12);
        paramParsableByteArray.skip(i1);
        k -= i1 + 5;
        if (TsExtractor.this.sampleQueues.get(m) == null)
        {
          Object localObject = null;
          switch (m)
          {
          default:
          case 15:
          case 27:
          case 21:
          }
          while (true)
          {
            if (localObject == null)
              break label359;
            TsExtractor.this.sampleQueues.put(m, localObject);
            TsExtractor.this.tsPayloadReaders.put(n, new TsExtractor.PesReader(TsExtractor.this, (ElementaryStreamReader)localObject));
            break;
            localObject = new AdtsReader(TsExtractor.this.bufferPool);
            continue;
            SeiReader localSeiReader = new SeiReader(TsExtractor.this.bufferPool);
            TsExtractor.this.sampleQueues.put(256, localSeiReader);
            localObject = new H264Reader(TsExtractor.this.bufferPool, localSeiReader);
            continue;
            localObject = new Id3Reader(TsExtractor.this.bufferPool);
          }
        }
      }
    }
  }

  private static abstract class TsPayloadReader
  {
    public abstract void consume(ParsableByteArray paramParsableByteArray, boolean paramBoolean);
  }
}