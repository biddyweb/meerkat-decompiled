package com.google.android.exoplayer.hls.parser;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.util.ParsableByteArray;

abstract class SampleQueue
{
  private volatile long largestParsedTimestampUs;
  private long lastReadTimeUs;
  private volatile MediaFormat mediaFormat;
  private boolean needKeyframe;
  private final RollingSampleBuffer rollingBuffer;
  private final SampleHolder sampleInfoHolder;
  private long spliceOutTimeUs;
  private boolean writingSample;

  protected SampleQueue(BufferPool paramBufferPool)
  {
    this.rollingBuffer = new RollingSampleBuffer(paramBufferPool);
    this.sampleInfoHolder = new SampleHolder(0);
    this.needKeyframe = true;
    this.lastReadTimeUs = -9223372036854775808L;
    this.spliceOutTimeUs = -9223372036854775808L;
    this.largestParsedTimestampUs = -9223372036854775808L;
  }

  private boolean advanceToEligibleSample()
  {
    boolean bool = this.rollingBuffer.peekSample(this.sampleInfoHolder);
    if (this.needKeyframe)
      while ((bool) && ((0x1 & this.sampleInfoHolder.flags) == 0))
      {
        this.rollingBuffer.skipSample();
        bool = this.rollingBuffer.peekSample(this.sampleInfoHolder);
      }
    if (!bool);
    while ((this.spliceOutTimeUs != -9223372036854775808L) && (this.sampleInfoHolder.timeUs >= this.spliceOutTimeUs))
      return false;
    return true;
  }

  protected void appendData(ParsableByteArray paramParsableByteArray, int paramInt)
  {
    this.rollingBuffer.appendData(paramParsableByteArray, paramInt);
  }

  protected void commitSample(boolean paramBoolean)
  {
    commitSample(paramBoolean, 0);
  }

  protected void commitSample(boolean paramBoolean, int paramInt)
  {
    this.rollingBuffer.commitSample(paramBoolean, paramInt);
    this.writingSample = false;
  }

  public boolean configureSpliceTo(SampleQueue paramSampleQueue)
  {
    if (this.spliceOutTimeUs != -9223372036854775808L)
      return true;
    if (this.rollingBuffer.peekSample(this.sampleInfoHolder));
    RollingSampleBuffer localRollingSampleBuffer;
    for (long l = this.sampleInfoHolder.timeUs; ; l = 1L + this.lastReadTimeUs)
    {
      localRollingSampleBuffer = paramSampleQueue.rollingBuffer;
      while ((localRollingSampleBuffer.peekSample(this.sampleInfoHolder)) && ((this.sampleInfoHolder.timeUs < l) || ((0x1 & this.sampleInfoHolder.flags) == 0)))
        localRollingSampleBuffer.skipSample();
    }
    if (localRollingSampleBuffer.peekSample(this.sampleInfoHolder))
    {
      this.spliceOutTimeUs = this.sampleInfoHolder.timeUs;
      return true;
    }
    return false;
  }

  public void discardUntil(long paramLong)
  {
    while ((this.rollingBuffer.peekSample(this.sampleInfoHolder)) && (this.sampleInfoHolder.timeUs < paramLong))
    {
      this.rollingBuffer.skipSample();
      this.needKeyframe = true;
    }
    this.lastReadTimeUs = -9223372036854775808L;
  }

  public long getLargestParsedTimestampUs()
  {
    return this.largestParsedTimestampUs;
  }

  public MediaFormat getMediaFormat()
  {
    return this.mediaFormat;
  }

  public boolean getSample(SampleHolder paramSampleHolder)
  {
    if (!advanceToEligibleSample())
      return false;
    this.rollingBuffer.readSample(paramSampleHolder);
    this.needKeyframe = false;
    this.lastReadTimeUs = paramSampleHolder.timeUs;
    return true;
  }

  public boolean hasMediaFormat()
  {
    return this.mediaFormat != null;
  }

  public boolean isEmpty()
  {
    return !advanceToEligibleSample();
  }

  public void release()
  {
    this.rollingBuffer.release();
  }

  protected void setMediaFormat(MediaFormat paramMediaFormat)
  {
    this.mediaFormat = paramMediaFormat;
  }

  protected void startSample(long paramLong)
  {
    startSample(paramLong, 0);
  }

  protected void startSample(long paramLong, int paramInt)
  {
    this.writingSample = true;
    this.largestParsedTimestampUs = Math.max(this.largestParsedTimestampUs, paramLong);
    this.rollingBuffer.startSample(paramLong, paramInt);
  }

  protected boolean writingSample()
  {
    return this.writingSample;
  }
}