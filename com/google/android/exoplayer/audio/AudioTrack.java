package com.google.android.exoplayer.audio;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.media.AudioTimestamp;
import android.media.MediaFormat;
import android.os.ConditionVariable;
import android.util.Log;
import com.google.android.exoplayer.util.Util;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;

@TargetApi(16)
public final class AudioTrack
{
  private static final int BUFFER_MULTIPLICATION_FACTOR = 4;
  public static final long CURRENT_POSITION_NOT_SET = -9223372036854775808L;
  private static final long MAX_AUDIO_TIMESTAMP_OFFSET_US = 5000000L;
  private static final long MAX_BUFFER_DURATION_US = 750000L;
  private static final long MAX_LATENCY_US = 5000000L;
  private static final int MAX_PLAYHEAD_OFFSET_COUNT = 10;
  private static final long MIN_BUFFER_DURATION_US = 250000L;
  private static final int MIN_PLAYHEAD_OFFSET_SAMPLE_INTERVAL_US = 30000;
  private static final int MIN_TIMESTAMP_SAMPLE_INTERVAL_US = 500000;
  public static final int RESULT_BUFFER_CONSUMED = 2;
  public static final int RESULT_POSITION_DISCONTINUITY = 1;
  public static final int SESSION_ID_NOT_SET = 0;
  private static final int START_IN_SYNC = 1;
  private static final int START_NEED_SYNC = 2;
  private static final int START_NOT_SET = 0;
  private static final String TAG = "AudioTrack";
  private static final int UNKNOWN_AC3_BITRATE;
  private int ac3Bitrate;
  private boolean audioTimestampSet;
  private android.media.AudioTrack audioTrack;
  private AudioTrackUtil audioTrackUtil;
  private int bufferSize;
  private int channelConfig;
  private int encoding;
  private int frameSize;
  private Method getLatencyMethod;
  private boolean isAc3;
  private long lastPlayheadSampleTimeUs;
  private long lastTimestampSampleTimeUs;
  private long latencyUs;
  private int minBufferSize;
  private int nextPlayheadOffsetIndex;
  private int playheadOffsetCount;
  private final long[] playheadOffsets;
  private final ConditionVariable releasingConditionVariable = new ConditionVariable(true);
  private long resumeSystemTimeUs;
  private int sampleRate;
  private long smoothedPlayheadOffsetUs;
  private int startMediaTimeState;
  private long startMediaTimeUs;
  private long submittedBytes;
  private byte[] temporaryBuffer;
  private int temporaryBufferOffset;
  private int temporaryBufferSize;
  private float volume;

  public AudioTrack()
  {
    if (Util.SDK_INT >= 18);
    try
    {
      this.getLatencyMethod = android.media.AudioTrack.class.getMethod("getLatency", (Class[])null);
      label39: this.playheadOffsets = new long[10];
      this.volume = 1.0F;
      this.startMediaTimeState = 0;
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      break label39;
    }
  }

  private long bytesToFrames(long paramLong)
  {
    if (this.isAc3)
    {
      if (this.ac3Bitrate == 0)
        return 0L;
      return 8L * paramLong * this.sampleRate / (1000 * this.ac3Bitrate);
    }
    return paramLong / this.frameSize;
  }

  // ERROR //
  private void checkAudioTrackInitialized()
    throws AudioTrack.InitializationException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 139\011com/google/android/exoplayer/audio/AudioTrack:audioTrack\011Landroid/media/AudioTrack;
    //   4: invokevirtual 143\011android/media/AudioTrack:getState\011()I
    //   7: istore_1
    //   8: iload_1
    //   9: iconst_1
    //   10: if_icmpne +4 -> 14
    //   13: return
    //   14: aload_0
    //   15: getfield 139\011com/google/android/exoplayer/audio/AudioTrack:audioTrack\011Landroid/media/AudioTrack;
    //   18: invokevirtual 146\011android/media/AudioTrack:release\011()V
    //   21: aload_0
    //   22: aconst_null
    //   23: putfield 139\011com/google/android/exoplayer/audio/AudioTrack:audioTrack\011Landroid/media/AudioTrack;
    //   26: new 135\011com/google/android/exoplayer/audio/AudioTrack$InitializationException
    //   29: dup
    //   30: iload_1
    //   31: aload_0
    //   32: getfield 130\011com/google/android/exoplayer/audio/AudioTrack:sampleRate\011I
    //   35: aload_0
    //   36: getfield 148\011com/google/android/exoplayer/audio/AudioTrack:channelConfig\011I
    //   39: aload_0
    //   40: getfield 150\011com/google/android/exoplayer/audio/AudioTrack:bufferSize\011I
    //   43: invokespecial 153\011com/google/android/exoplayer/audio/AudioTrack$InitializationException:<init>\011(IIII)V
    //   46: athrow
    //   47: astore_3
    //   48: aload_0
    //   49: aconst_null
    //   50: putfield 139\011com/google/android/exoplayer/audio/AudioTrack:audioTrack\011Landroid/media/AudioTrack;
    //   53: goto -27 -> 26
    //   56: astore_2
    //   57: aload_0
    //   58: aconst_null
    //   59: putfield 139\011com/google/android/exoplayer/audio/AudioTrack:audioTrack\011Landroid/media/AudioTrack;
    //   62: aload_2
    //   63: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   14\01121\01147\011java/lang/Exception
    //   14\01121\01156\011finally
  }

  private long durationUsToFrames(long paramLong)
  {
    return paramLong * this.sampleRate / 1000000L;
  }

  private long framesToDurationUs(long paramLong)
  {
    return 1000000L * paramLong / this.sampleRate;
  }

  private boolean hasCurrentPositionUs()
  {
    return (isInitialized()) && (this.startMediaTimeUs != 0L);
  }

  private void maybeSampleSyncParams()
  {
    long l1 = this.audioTrackUtil.getPlaybackHeadPositionUs();
    if (l1 == 0L);
    long l2;
    do
    {
      return;
      l2 = System.nanoTime() / 1000L;
      if (l2 - this.lastPlayheadSampleTimeUs >= 30000L)
      {
        this.playheadOffsets[this.nextPlayheadOffsetIndex] = (l1 - l2);
        this.nextPlayheadOffsetIndex = ((1 + this.nextPlayheadOffsetIndex) % 10);
        if (this.playheadOffsetCount < 10)
          this.playheadOffsetCount = (1 + this.playheadOffsetCount);
        this.lastPlayheadSampleTimeUs = l2;
        this.smoothedPlayheadOffsetUs = 0L;
        for (int i = 0; i < this.playheadOffsetCount; i++)
          this.smoothedPlayheadOffsetUs += this.playheadOffsets[i] / this.playheadOffsetCount;
      }
    }
    while (l2 - this.lastTimestampSampleTimeUs < 500000L);
    this.audioTimestampSet = this.audioTrackUtil.updateTimestamp();
    long l3;
    long l4;
    if (this.audioTimestampSet)
    {
      l3 = this.audioTrackUtil.getTimestampNanoTime() / 1000L;
      l4 = this.audioTrackUtil.getTimestampFramePosition();
      if (l3 >= this.resumeSystemTimeUs)
        break label311;
      this.audioTimestampSet = false;
    }
    while (true)
    {
      if (this.getLatencyMethod != null);
      try
      {
        this.latencyUs = (1000L * ((Integer)this.getLatencyMethod.invoke(this.audioTrack, (Object[])null)).intValue() - framesToDurationUs(bytesToFrames(this.bufferSize)));
        this.latencyUs = Math.max(this.latencyUs, 0L);
        if (this.latencyUs > 5000000L)
        {
          Log.w("AudioTrack", "Ignoring impossibly large audio latency: " + this.latencyUs);
          this.latencyUs = 0L;
        }
        this.lastTimestampSampleTimeUs = l2;
        return;
        label311: if (Math.abs(l3 - l2) > 5000000L)
        {
          this.audioTimestampSet = false;
          Log.w("AudioTrack", "Spurious audio timestamp (system clock mismatch): " + l4 + ", " + l3 + ", " + l2 + ", " + l1);
          continue;
        }
        if (Math.abs(framesToDurationUs(l4) - l1) <= 5000000L)
          continue;
        this.audioTimestampSet = false;
        Log.w("AudioTrack", "Spurious audio timestamp (frame position mismatch): " + l4 + ", " + l3 + ", " + l2 + ", " + l1);
      }
      catch (Exception localException)
      {
        while (true)
          this.getLatencyMethod = null;
      }
    }
  }

  private void resetSyncParams()
  {
    this.smoothedPlayheadOffsetUs = 0L;
    this.playheadOffsetCount = 0;
    this.nextPlayheadOffsetIndex = 0;
    this.lastPlayheadSampleTimeUs = 0L;
    this.audioTimestampSet = false;
    this.lastTimestampSampleTimeUs = 0L;
  }

  @TargetApi(21)
  private static void setVolumeV21(android.media.AudioTrack paramAudioTrack, float paramFloat)
  {
    paramAudioTrack.setVolume(paramFloat);
  }

  private static void setVolumeV3(android.media.AudioTrack paramAudioTrack, float paramFloat)
  {
    paramAudioTrack.setStereoVolume(paramFloat, paramFloat);
  }

  @TargetApi(21)
  private static int writeNonBlockingV21(android.media.AudioTrack paramAudioTrack, ByteBuffer paramByteBuffer, int paramInt)
  {
    return paramAudioTrack.write(paramByteBuffer, paramInt, 1);
  }

  public long getCurrentPositionUs(boolean paramBoolean)
  {
    long l2;
    if (!hasCurrentPositionUs())
      l2 = -9223372036854775808L;
    while (true)
    {
      return l2;
      if (this.audioTrack.getPlayState() == 3)
        maybeSampleSyncParams();
      long l1 = System.nanoTime() / 1000L;
      if (this.audioTimestampSet)
        return framesToDurationUs(durationUsToFrames(l1 - this.audioTrackUtil.getTimestampNanoTime() / 1000L) + this.audioTrackUtil.getTimestampFramePosition()) + this.startMediaTimeUs;
      if (this.playheadOffsetCount == 0);
      for (l2 = this.audioTrackUtil.getPlaybackHeadPositionUs() + this.startMediaTimeUs; !paramBoolean; l2 = l1 + this.smoothedPlayheadOffsetUs + this.startMediaTimeUs)
        return l2 - this.latencyUs;
    }
  }

  public int handleBuffer(ByteBuffer paramByteBuffer, int paramInt1, int paramInt2, long paramLong)
    throws AudioTrack.WriteException
  {
    int j;
    if (paramInt2 == 0)
      j = 2;
    label403: label420: 
    do
    {
      return j;
      int i = this.temporaryBufferSize;
      j = 0;
      long l1;
      int k;
      if (i == 0)
      {
        if ((this.isAc3) && (this.ac3Bitrate == 0))
          this.ac3Bitrate = ((768000 + paramInt2 * 8 * this.sampleRate) / 1536000);
        l1 = paramLong - framesToDurationUs(bytesToFrames(paramInt2));
        if (this.startMediaTimeUs == 0L)
        {
          this.startMediaTimeUs = Math.max(0L, l1);
          this.startMediaTimeState = 1;
        }
      }
      else
      {
        if (this.temporaryBufferSize == 0)
        {
          this.temporaryBufferSize = paramInt2;
          paramByteBuffer.position(paramInt1);
          if (Util.SDK_INT < 21)
          {
            if ((this.temporaryBuffer == null) || (this.temporaryBuffer.length < paramInt2))
              this.temporaryBuffer = new byte[paramInt2];
            paramByteBuffer.get(this.temporaryBuffer, 0, paramInt2);
            this.temporaryBufferOffset = 0;
          }
        }
        if (Util.SDK_INT >= 21)
          break label403;
        int m = (int)(this.submittedBytes - this.audioTrackUtil.getPlaybackHeadPosition() * this.frameSize);
        int n = this.bufferSize - m;
        k = 0;
        if (n > 0)
        {
          int i1 = Math.min(this.temporaryBufferSize, n);
          k = this.audioTrack.write(this.temporaryBuffer, this.temporaryBufferOffset, i1);
          if (k >= 0)
            this.temporaryBufferOffset = (k + this.temporaryBufferOffset);
        }
      }
      while (true)
      {
        if (k >= 0)
          break label420;
        throw new WriteException(k);
        long l2 = this.startMediaTimeUs + framesToDurationUs(bytesToFrames(this.submittedBytes));
        if ((this.startMediaTimeState == 1) && (Math.abs(l2 - l1) > 200000L))
        {
          Log.e("AudioTrack", "Discontinuity detected [expected " + l2 + ", got " + l1 + "]");
          this.startMediaTimeState = 2;
        }
        int i2 = this.startMediaTimeState;
        j = 0;
        if (i2 != 2)
          break;
        this.startMediaTimeUs += l1 - l2;
        this.startMediaTimeState = 1;
        j = 0x0 | 0x1;
        break;
        k = writeNonBlockingV21(this.audioTrack, paramByteBuffer, this.temporaryBufferSize);
      }
      this.temporaryBufferSize -= k;
      this.submittedBytes += k;
    }
    while (this.temporaryBufferSize != 0);
    return j | 0x2;
  }

  public void handleDiscontinuity()
  {
    if (this.startMediaTimeState == 1)
      this.startMediaTimeState = 2;
  }

  public boolean hasEnoughDataToBeginPlayback()
  {
    return this.submittedBytes > 3 * this.minBufferSize / 2;
  }

  public boolean hasPendingData()
  {
    return (isInitialized()) && (bytesToFrames(this.submittedBytes) > this.audioTrackUtil.getPlaybackHeadPosition());
  }

  public int initialize()
    throws AudioTrack.InitializationException
  {
    return initialize(0);
  }

  public int initialize(int paramInt)
    throws AudioTrack.InitializationException
  {
    this.releasingConditionVariable.block();
    if (paramInt == 0)
    {
      this.audioTrack = new android.media.AudioTrack(3, this.sampleRate, this.channelConfig, this.encoding, this.bufferSize, 1);
      checkAudioTrackInitialized();
      if (Util.SDK_INT < 19)
        break label116;
    }
    label116: for (this.audioTrackUtil = new AudioTrackUtilV19(this.audioTrack); ; this.audioTrackUtil = new AudioTrackUtil(this.audioTrack))
    {
      setVolume(this.volume);
      return this.audioTrack.getAudioSessionId();
      this.audioTrack = new android.media.AudioTrack(3, this.sampleRate, this.channelConfig, this.encoding, this.bufferSize, 1, paramInt);
      break;
    }
  }

  public boolean isInitialized()
  {
    return this.audioTrack != null;
  }

  public void pause()
  {
    if (isInitialized())
    {
      resetSyncParams();
      this.audioTrack.pause();
    }
  }

  public void play()
  {
    if (isInitialized())
    {
      this.resumeSystemTimeUs = (System.nanoTime() / 1000L);
      this.audioTrack.play();
    }
  }

  public void reconfigure(MediaFormat paramMediaFormat)
  {
    reconfigure(paramMediaFormat, 2, 0);
  }

  @SuppressLint({"InlinedApi"})
  public void reconfigure(MediaFormat paramMediaFormat, int paramInt1, int paramInt2)
  {
    int i = paramMediaFormat.getInteger("channel-count");
    int j;
    int k;
    switch (i)
    {
    case 3:
    case 4:
    case 5:
    case 7:
    default:
      throw new IllegalArgumentException("Unsupported channel count: " + i);
    case 1:
      j = 4;
      k = paramMediaFormat.getInteger("sample-rate");
      if ((paramInt1 != 5) && (paramInt1 != 6))
        break;
    case 2:
    case 6:
    case 8:
    }
    for (boolean bool = true; ; bool = false)
    {
      if ((!isInitialized()) || (this.sampleRate != k) || (this.channelConfig != j) || (this.isAc3) || (bool))
        break label178;
      return;
      j = 12;
      break;
      j = 252;
      break;
      j = 1020;
      break;
    }
    label178: reset();
    this.encoding = paramInt1;
    this.sampleRate = k;
    this.channelConfig = j;
    this.isAc3 = bool;
    this.ac3Bitrate = 0;
    this.frameSize = (i * 2);
    this.minBufferSize = android.media.AudioTrack.getMinBufferSize(k, j, paramInt1);
    if (paramInt2 != 0)
    {
      this.bufferSize = paramInt2;
      return;
    }
    int m = 4 * this.minBufferSize;
    int n = (int)durationUsToFrames(250000L) * this.frameSize;
    int i1 = (int)Math.max(this.minBufferSize, durationUsToFrames(750000L) * this.frameSize);
    if (m < n);
    while (true)
    {
      this.bufferSize = n;
      return;
      if (m > i1)
        n = i1;
      else
        n = m;
    }
  }

  public void reset()
  {
    if (isInitialized())
    {
      this.submittedBytes = 0L;
      this.temporaryBufferSize = 0;
      this.startMediaTimeUs = 0L;
      resetSyncParams();
      if (this.audioTrack.getPlayState() == 3)
        this.audioTrack.pause();
      final android.media.AudioTrack localAudioTrack = this.audioTrack;
      this.audioTrack = null;
      this.audioTrackUtil = null;
      this.releasingConditionVariable.close();
      new Thread()
      {
        public void run()
        {
          try
          {
            localAudioTrack.release();
            return;
          }
          finally
          {
            AudioTrack.this.releasingConditionVariable.open();
          }
        }
      }
      .start();
    }
  }

  public void setVolume(float paramFloat)
  {
    this.volume = paramFloat;
    if (isInitialized())
    {
      if (Util.SDK_INT >= 21)
        setVolumeV21(this.audioTrack, paramFloat);
    }
    else
      return;
    setVolumeV3(this.audioTrack, paramFloat);
  }

  private static class AudioTrackUtil
  {
    protected final android.media.AudioTrack audioTrack;
    private long lastRawPlaybackHeadPosition;
    private long rawPlaybackHeadWrapCount;
    private final int sampleRate;

    public AudioTrackUtil(android.media.AudioTrack paramAudioTrack)
    {
      this.audioTrack = paramAudioTrack;
      this.sampleRate = paramAudioTrack.getSampleRate();
    }

    public long getPlaybackHeadPosition()
    {
      long l = 0xFFFFFFFF & this.audioTrack.getPlaybackHeadPosition();
      if (this.lastRawPlaybackHeadPosition > l)
        this.rawPlaybackHeadWrapCount = (1L + this.rawPlaybackHeadWrapCount);
      this.lastRawPlaybackHeadPosition = l;
      return l + (this.rawPlaybackHeadWrapCount << 32);
    }

    public long getPlaybackHeadPositionUs()
    {
      return 1000000L * getPlaybackHeadPosition() / this.sampleRate;
    }

    public long getTimestampFramePosition()
    {
      throw new UnsupportedOperationException();
    }

    public long getTimestampNanoTime()
    {
      throw new UnsupportedOperationException();
    }

    public boolean updateTimestamp()
    {
      return false;
    }
  }

  @TargetApi(19)
  private static class AudioTrackUtilV19 extends AudioTrack.AudioTrackUtil
  {
    private final AudioTimestamp audioTimestamp = new AudioTimestamp();
    private long lastRawTimestampFramePosition;
    private long lastTimestampFramePosition;
    private long rawTimestampFramePositionWrapCount;

    public AudioTrackUtilV19(android.media.AudioTrack paramAudioTrack)
    {
      super();
    }

    public long getTimestampFramePosition()
    {
      return this.lastTimestampFramePosition;
    }

    public long getTimestampNanoTime()
    {
      return this.audioTimestamp.nanoTime;
    }

    public boolean updateTimestamp()
    {
      boolean bool = this.audioTrack.getTimestamp(this.audioTimestamp);
      if (bool)
      {
        long l = this.audioTimestamp.framePosition;
        if (this.lastRawTimestampFramePosition > l)
          this.rawTimestampFramePositionWrapCount = (1L + this.rawTimestampFramePositionWrapCount);
        this.lastRawTimestampFramePosition = l;
        this.lastTimestampFramePosition = (l + (this.rawTimestampFramePositionWrapCount << 32));
      }
      return bool;
    }
  }

  public static class InitializationException extends Exception
  {
    public final int audioTrackState;

    public InitializationException(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      super();
      this.audioTrackState = paramInt1;
    }
  }

  public static class WriteException extends Exception
  {
    public final int errorCode;

    public WriteException(int paramInt)
    {
      super();
      this.errorCode = paramInt;
    }
  }
}