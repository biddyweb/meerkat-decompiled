package com.google.android.exoplayer.hls.parser;

import android.util.Pair;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.util.CodecSpecificDataUtil;
import com.google.android.exoplayer.util.ParsableBitArray;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.util.Collections;

class AdtsReader extends ElementaryStreamReader
{
  private static final int CRC_SIZE = 2;
  private static final int HEADER_SIZE = 5;
  private static final int STATE_FINDING_SYNC = 0;
  private static final int STATE_READING_HEADER = 1;
  private static final int STATE_READING_SAMPLE = 2;
  private final ParsableBitArray adtsScratch = new ParsableBitArray(new byte[7]);
  private int bytesRead;
  private long frameDurationUs;
  private boolean hasCrc;
  private boolean lastByteWasFF;
  private int sampleSize;
  private int state = 0;
  private long timeUs;

  public AdtsReader(BufferPool paramBufferPool)
  {
    super(paramBufferPool);
  }

  private boolean continueRead(ParsableByteArray paramParsableByteArray, byte[] paramArrayOfByte, int paramInt)
  {
    int i = Math.min(paramParsableByteArray.bytesLeft(), paramInt - this.bytesRead);
    paramParsableByteArray.readBytes(paramArrayOfByte, this.bytesRead, i);
    this.bytesRead = (i + this.bytesRead);
    return this.bytesRead == paramInt;
  }

  private void parseHeader()
  {
    this.adtsScratch.setPosition(0);
    if (!hasMediaFormat())
    {
      int i = 1 + this.adtsScratch.readBits(2);
      int j = this.adtsScratch.readBits(4);
      this.adtsScratch.skipBits(1);
      byte[] arrayOfByte = CodecSpecificDataUtil.buildAudioSpecificConfig(i, j, this.adtsScratch.readBits(3));
      Pair localPair = CodecSpecificDataUtil.parseAudioSpecificConfig(arrayOfByte);
      MediaFormat localMediaFormat = MediaFormat.createAudioFormat("audio/mp4a-latm", -1, ((Integer)localPair.second).intValue(), ((Integer)localPair.first).intValue(), Collections.singletonList(arrayOfByte));
      this.frameDurationUs = (1024000000L / localMediaFormat.sampleRate);
      setMediaFormat(localMediaFormat);
    }
    while (true)
    {
      this.adtsScratch.skipBits(4);
      this.sampleSize = (-5 + (-2 + this.adtsScratch.readBits(13)));
      if (this.hasCrc)
        this.sampleSize = (-2 + this.sampleSize);
      return;
      this.adtsScratch.skipBits(10);
    }
  }

  private boolean skipToNextSync(ParsableByteArray paramParsableByteArray)
  {
    byte[] arrayOfByte = paramParsableByteArray.data;
    int i = paramParsableByteArray.getPosition();
    int j = paramParsableByteArray.limit();
    for (int k = i; k < j; k++)
    {
      boolean bool1;
      int m;
      if ((0xFF & arrayOfByte[k]) == 255)
      {
        bool1 = true;
        if ((!this.lastByteWasFF) || (bool1) || ((0xF0 & arrayOfByte[k]) != 240))
          break label122;
        m = 1;
        label72: this.lastByteWasFF = bool1;
        if (m == 0)
          continue;
        if ((0x1 & arrayOfByte[k]) != 0)
          break label128;
      }
      label128: for (boolean bool2 = true; ; bool2 = false)
      {
        this.hasCrc = bool2;
        paramParsableByteArray.setPosition(k + 1);
        this.lastByteWasFF = false;
        return true;
        bool1 = false;
        break;
        label122: m = 0;
        break label72;
      }
    }
    paramParsableByteArray.setPosition(j);
    return false;
  }

  public void consume(ParsableByteArray paramParsableByteArray, long paramLong, boolean paramBoolean)
  {
    if (paramBoolean)
      this.timeUs = paramLong;
    while (paramParsableByteArray.bytesLeft() > 0)
      switch (this.state)
      {
      default:
        break;
      case 0:
        if (skipToNextSync(paramParsableByteArray))
        {
          this.bytesRead = 0;
          this.state = 1;
        }
        break;
      case 1:
        if (this.hasCrc);
        for (int j = 7; continueRead(paramParsableByteArray, this.adtsScratch.getData(), j); j = 5)
        {
          parseHeader();
          startSample(this.timeUs);
          this.bytesRead = 0;
          this.state = 2;
          break;
        }
      case 2:
        int i = Math.min(paramParsableByteArray.bytesLeft(), this.sampleSize - this.bytesRead);
        appendData(paramParsableByteArray, i);
        this.bytesRead = (i + this.bytesRead);
        if (this.bytesRead == this.sampleSize)
        {
          commitSample(true);
          this.timeUs += this.frameDurationUs;
          this.bytesRead = 0;
          this.state = 0;
        }
        break;
      }
  }

  public void packetFinished()
  {
  }
}