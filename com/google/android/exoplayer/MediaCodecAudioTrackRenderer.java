package com.google.android.exoplayer;

import android.annotation.TargetApi;
import android.media.MediaFormat;
import android.os.Handler;
import com.google.android.exoplayer.audio.AudioTrack;
import com.google.android.exoplayer.audio.AudioTrack.InitializationException;
import com.google.android.exoplayer.audio.AudioTrack.WriteException;
import com.google.android.exoplayer.drm.DrmSessionManager;
import com.google.android.exoplayer.util.MimeTypes;

@TargetApi(16)
public class MediaCodecAudioTrackRenderer extends MediaCodecTrackRenderer
{
  public static final int MSG_SET_VOLUME = 1;
  private int audioSessionId;
  private final AudioTrack audioTrack;
  private long currentPositionUs;
  private final EventListener eventListener;

  public MediaCodecAudioTrackRenderer(SampleSource paramSampleSource)
  {
    this(paramSampleSource, null, true);
  }

  public MediaCodecAudioTrackRenderer(SampleSource paramSampleSource, Handler paramHandler, EventListener paramEventListener)
  {
    this(paramSampleSource, null, true, paramHandler, paramEventListener);
  }

  public MediaCodecAudioTrackRenderer(SampleSource paramSampleSource, DrmSessionManager paramDrmSessionManager, boolean paramBoolean)
  {
    this(paramSampleSource, paramDrmSessionManager, paramBoolean, null, null);
  }

  public MediaCodecAudioTrackRenderer(SampleSource paramSampleSource, DrmSessionManager paramDrmSessionManager, boolean paramBoolean, Handler paramHandler, EventListener paramEventListener)
  {
    super(paramSampleSource, paramDrmSessionManager, paramBoolean, paramHandler, paramEventListener);
    this.eventListener = paramEventListener;
    this.audioSessionId = 0;
    this.audioTrack = new AudioTrack();
  }

  private void notifyAudioTrackInitializationError(final AudioTrack.InitializationException paramInitializationException)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          MediaCodecAudioTrackRenderer.this.eventListener.onAudioTrackInitializationError(paramInitializationException);
        }
      });
  }

  private void notifyAudioTrackWriteError(final AudioTrack.WriteException paramWriteException)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          MediaCodecAudioTrackRenderer.this.eventListener.onAudioTrackWriteError(paramWriteException);
        }
      });
  }

  protected long getCurrentPositionUs()
  {
    long l = this.audioTrack.getCurrentPositionUs(isEnded());
    if (l == -9223372036854775808L);
    for (this.currentPositionUs = Math.max(this.currentPositionUs, super.getCurrentPositionUs()); ; this.currentPositionUs = Math.max(this.currentPositionUs, l))
      return this.currentPositionUs;
  }

  public void handleMessage(int paramInt, Object paramObject)
    throws ExoPlaybackException
  {
    if (paramInt == 1)
    {
      this.audioTrack.setVolume(((Float)paramObject).floatValue());
      return;
    }
    super.handleMessage(paramInt, paramObject);
  }

  protected boolean handlesMimeType(String paramString)
  {
    return (MimeTypes.isAudio(paramString)) && (super.handlesMimeType(paramString));
  }

  protected boolean isEnded()
  {
    return (super.isEnded()) && ((!this.audioTrack.hasPendingData()) || (!this.audioTrack.hasEnoughDataToBeginPlayback()));
  }

  protected boolean isReady()
  {
    return (this.audioTrack.hasPendingData()) || ((super.isReady()) && (getSourceState() == 2));
  }

  protected boolean isTimeSource()
  {
    return true;
  }

  protected void onAudioSessionId(int paramInt)
  {
  }

  protected void onDisabled()
  {
    this.audioSessionId = 0;
    try
    {
      this.audioTrack.reset();
      return;
    }
    finally
    {
      super.onDisabled();
    }
  }

  protected void onEnabled(long paramLong, boolean paramBoolean)
  {
    super.onEnabled(paramLong, paramBoolean);
    this.currentPositionUs = -9223372036854775808L;
  }

  protected void onOutputFormatChanged(MediaFormat paramMediaFormat)
  {
    this.audioTrack.reconfigure(paramMediaFormat);
  }

  protected void onStarted()
  {
    super.onStarted();
    this.audioTrack.play();
  }

  protected void onStopped()
  {
    this.audioTrack.pause();
    super.onStopped();
  }

  // ERROR //
  protected boolean processOutputBuffer(long paramLong1, long paramLong2, android.media.MediaCodec paramMediaCodec, java.nio.ByteBuffer paramByteBuffer, android.media.MediaCodec.BufferInfo paramBufferInfo, int paramInt, boolean paramBoolean)
    throws ExoPlaybackException
  {
    // Byte code:
    //   0: iload 9
    //   2: ifeq +38 -> 40
    //   5: aload 5
    //   7: iload 8
    //   9: iconst_0
    //   10: invokevirtual 168\011android/media/MediaCodec:releaseOutputBuffer\011(IZ)V
    //   13: aload_0
    //   14: getfield 172\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:codecCounters\011Lcom/google/android/exoplayer/CodecCounters;
    //   17: astore 15
    //   19: aload 15
    //   21: iconst_1
    //   22: aload 15
    //   24: getfield 177\011com/google/android/exoplayer/CodecCounters:skippedOutputBufferCount\011I
    //   27: iadd
    //   28: putfield 177\011com/google/android/exoplayer/CodecCounters:skippedOutputBufferCount\011I
    //   31: aload_0
    //   32: getfield 40\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioTrack\011Lcom/google/android/exoplayer/audio/AudioTrack;
    //   35: invokevirtual 180\011com/google/android/exoplayer/audio/AudioTrack:handleDiscontinuity\011()V
    //   38: iconst_1
    //   39: ireturn
    //   40: aload_0
    //   41: getfield 40\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioTrack\011Lcom/google/android/exoplayer/audio/AudioTrack;
    //   44: invokevirtual 183\011com/google/android/exoplayer/audio/AudioTrack:isInitialized\011()Z
    //   47: ifne +37 -> 84
    //   50: aload_0
    //   51: getfield 33\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioSessionId\011I
    //   54: ifeq +105 -> 159
    //   57: aload_0
    //   58: getfield 40\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioTrack\011Lcom/google/android/exoplayer/audio/AudioTrack;
    //   61: aload_0
    //   62: getfield 33\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioSessionId\011I
    //   65: invokevirtual 187\011com/google/android/exoplayer/audio/AudioTrack:initialize\011(I)I
    //   68: pop
    //   69: aload_0
    //   70: invokevirtual 190\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:getState\011()I
    //   73: iconst_3
    //   74: if_icmpne +10 -> 84
    //   77: aload_0
    //   78: getfield 40\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioTrack\011Lcom/google/android/exoplayer/audio/AudioTrack;
    //   81: invokevirtual 150\011com/google/android/exoplayer/audio/AudioTrack:play\011()V
    //   84: aload_0
    //   85: getfield 40\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioTrack\011Lcom/google/android/exoplayer/audio/AudioTrack;
    //   88: aload 6
    //   90: aload 7
    //   92: getfield 195\011android/media/MediaCodec$BufferInfo:offset\011I
    //   95: aload 7
    //   97: getfield 198\011android/media/MediaCodec$BufferInfo:size\011I
    //   100: aload 7
    //   102: getfield 201\011android/media/MediaCodec$BufferInfo:presentationTimeUs\011J
    //   105: invokevirtual 205\011com/google/android/exoplayer/audio/AudioTrack:handleBuffer\011(Ljava/nio/ByteBuffer;IIJ)I
    //   108: istore 11
    //   110: iload 11
    //   112: iconst_1
    //   113: iand
    //   114: ifeq +10 -> 124
    //   117: aload_0
    //   118: ldc2_w 76
    //   121: putfield 79\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:currentPositionUs\011J
    //   124: iload 11
    //   126: iconst_2
    //   127: iand
    //   128: ifeq +89 -> 217
    //   131: aload 5
    //   133: iload 8
    //   135: iconst_0
    //   136: invokevirtual 168\011android/media/MediaCodec:releaseOutputBuffer\011(IZ)V
    //   139: aload_0
    //   140: getfield 172\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:codecCounters\011Lcom/google/android/exoplayer/CodecCounters;
    //   143: astore 12
    //   145: aload 12
    //   147: iconst_1
    //   148: aload 12
    //   150: getfield 208\011com/google/android/exoplayer/CodecCounters:renderedOutputBufferCount\011I
    //   153: iadd
    //   154: putfield 208\011com/google/android/exoplayer/CodecCounters:renderedOutputBufferCount\011I
    //   157: iconst_1
    //   158: ireturn
    //   159: aload_0
    //   160: aload_0
    //   161: getfield 40\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioTrack\011Lcom/google/android/exoplayer/audio/AudioTrack;
    //   164: invokevirtual 210\011com/google/android/exoplayer/audio/AudioTrack:initialize\011()I
    //   167: putfield 33\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioSessionId\011I
    //   170: aload_0
    //   171: aload_0
    //   172: getfield 33\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:audioSessionId\011I
    //   175: invokevirtual 212\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:onAudioSessionId\011(I)V
    //   178: goto -109 -> 69
    //   181: astore 13
    //   183: aload_0
    //   184: aload 13
    //   186: invokespecial 214\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:notifyAudioTrackInitializationError\011(Lcom/google/android/exoplayer/audio/AudioTrack$InitializationException;)V
    //   189: new 91\011com/google/android/exoplayer/ExoPlaybackException
    //   192: dup
    //   193: aload 13
    //   195: invokespecial 217\011com/google/android/exoplayer/ExoPlaybackException:<init>\011(Ljava/lang/Throwable;)V
    //   198: athrow
    //   199: astore 10
    //   201: aload_0
    //   202: aload 10
    //   204: invokespecial 219\011com/google/android/exoplayer/MediaCodecAudioTrackRenderer:notifyAudioTrackWriteError\011(Lcom/google/android/exoplayer/audio/AudioTrack$WriteException;)V
    //   207: new 91\011com/google/android/exoplayer/ExoPlaybackException
    //   210: dup
    //   211: aload 10
    //   213: invokespecial 217\011com/google/android/exoplayer/ExoPlaybackException:<init>\011(Ljava/lang/Throwable;)V
    //   216: athrow
    //   217: iconst_0
    //   218: ireturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   50\01169\011181\011com/google/android/exoplayer/audio/AudioTrack$InitializationException
    //   159\011178\011181\011com/google/android/exoplayer/audio/AudioTrack$InitializationException
    //   84\011110\011199\011com/google/android/exoplayer/audio/AudioTrack$WriteException
  }

  protected void seekTo(long paramLong)
    throws ExoPlaybackException
  {
    super.seekTo(paramLong);
    this.audioTrack.reset();
    this.currentPositionUs = -9223372036854775808L;
  }

  public static abstract interface EventListener extends MediaCodecTrackRenderer.EventListener
  {
    public abstract void onAudioTrackInitializationError(AudioTrack.InitializationException paramInitializationException);

    public abstract void onAudioTrackWriteError(AudioTrack.WriteException paramWriteException);
  }
}