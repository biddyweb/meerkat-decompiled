package com.google.android.exoplayer.metadata;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import com.google.android.exoplayer.ExoPlaybackException;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.TrackRenderer;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

public class MetadataTrackRenderer<T> extends TrackRenderer
  implements Handler.Callback
{
  private static final int MSG_INVOKE_RENDERER;
  private long currentPositionUs;
  private final MediaFormatHolder formatHolder;
  private boolean inputStreamEnded;
  private final Handler metadataHandler;
  private final MetadataParser<T> metadataParser;
  private final MetadataRenderer<T> metadataRenderer;
  private T pendingMetadata;
  private long pendingMetadataTimestamp;
  private final SampleHolder sampleHolder;
  private final SampleSource source;
  private int trackIndex;

  public MetadataTrackRenderer(SampleSource paramSampleSource, MetadataParser<T> paramMetadataParser, MetadataRenderer<T> paramMetadataRenderer, Looper paramLooper)
  {
    this.source = ((SampleSource)Assertions.checkNotNull(paramSampleSource));
    this.metadataParser = ((MetadataParser)Assertions.checkNotNull(paramMetadataParser));
    this.metadataRenderer = ((MetadataRenderer)Assertions.checkNotNull(paramMetadataRenderer));
    if (paramLooper == null);
    for (Handler localHandler = null; ; localHandler = new Handler(paramLooper, this))
    {
      this.metadataHandler = localHandler;
      this.formatHolder = new MediaFormatHolder();
      this.sampleHolder = new SampleHolder(1);
      return;
    }
  }

  private void invokeRenderer(T paramT)
  {
    if (this.metadataHandler != null)
    {
      this.metadataHandler.obtainMessage(0, paramT).sendToTarget();
      return;
    }
    invokeRendererInternal(paramT);
  }

  private void invokeRendererInternal(T paramT)
  {
    this.metadataRenderer.onMetadata(paramT);
  }

  private void seekToInternal(long paramLong)
  {
    this.currentPositionUs = paramLong;
    this.pendingMetadata = null;
    this.inputStreamEnded = false;
  }

  protected int doPrepare()
    throws ExoPlaybackException
  {
    try
    {
      boolean bool = this.source.prepare();
      if (!bool)
        return 0;
    }
    catch (IOException localIOException)
    {
      throw new ExoPlaybackException(localIOException);
    }
    for (int i = 0; i < this.source.getTrackCount(); i++)
      if (this.metadataParser.canParse(this.source.getTrackInfo(i).mimeType))
      {
        this.trackIndex = i;
        return 1;
      }
    return -1;
  }

  // ERROR //
  protected void doSomeWork(long paramLong1, long paramLong2)
    throws ExoPlaybackException
  {
    // Byte code:
    //   0: aload_0
    //   1: lload_1
    //   2: putfield 95\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:currentPositionUs\011J
    //   5: aload_0
    //   6: getfield 47\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:source\011Lcom/google/android/exoplayer/SampleSource;
    //   9: lload_1
    //   10: invokeinterface 137 3 0
    //   15: pop
    //   16: aload_0
    //   17: getfield 99\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:inputStreamEnded\011Z
    //   20: ifne +94 -> 114
    //   23: aload_0
    //   24: getfield 97\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:pendingMetadata\011Ljava/lang/Object;
    //   27: ifnonnull +87 -> 114
    //   30: aload_0
    //   31: getfield 47\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:source\011Lcom/google/android/exoplayer/SampleSource;
    //   34: aload_0
    //   35: getfield 131\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:trackIndex\011I
    //   38: lload_1
    //   39: aload_0
    //   40: getfield 62\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:formatHolder\011Lcom/google/android/exoplayer/MediaFormatHolder;
    //   43: aload_0
    //   44: getfield 69\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:sampleHolder\011Lcom/google/android/exoplayer/SampleHolder;
    //   47: iconst_0
    //   48: invokeinterface 141 7 0
    //   53: istore 8
    //   55: iload 8
    //   57: bipush 253
    //   59: if_icmpne +100 -> 159
    //   62: aload_0
    //   63: aload_0
    //   64: getfield 69\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:sampleHolder\011Lcom/google/android/exoplayer/SampleHolder;
    //   67: getfield 144\011com/google/android/exoplayer/SampleHolder:timeUs\011J
    //   70: putfield 146\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:pendingMetadataTimestamp\011J
    //   73: aload_0
    //   74: aload_0
    //   75: getfield 51\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:metadataParser\011Lcom/google/android/exoplayer/metadata/MetadataParser;
    //   78: aload_0
    //   79: getfield 69\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:sampleHolder\011Lcom/google/android/exoplayer/SampleHolder;
    //   82: getfield 150\011com/google/android/exoplayer/SampleHolder:data\011Ljava/nio/ByteBuffer;
    //   85: invokevirtual 156\011java/nio/ByteBuffer:array\011()[B
    //   88: aload_0
    //   89: getfield 69\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:sampleHolder\011Lcom/google/android/exoplayer/SampleHolder;
    //   92: getfield 159\011com/google/android/exoplayer/SampleHolder:size\011I
    //   95: invokeinterface 163 3 0
    //   100: putfield 97\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:pendingMetadata\011Ljava/lang/Object;
    //   103: aload_0
    //   104: getfield 69\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:sampleHolder\011Lcom/google/android/exoplayer/SampleHolder;
    //   107: getfield 150\011com/google/android/exoplayer/SampleHolder:data\011Ljava/nio/ByteBuffer;
    //   110: invokevirtual 167\011java/nio/ByteBuffer:clear\011()Ljava/nio/Buffer;
    //   113: pop
    //   114: aload_0
    //   115: getfield 97\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:pendingMetadata\011Ljava/lang/Object;
    //   118: ifnull +28 -> 146
    //   121: aload_0
    //   122: getfield 146\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:pendingMetadataTimestamp\011J
    //   125: aload_0
    //   126: getfield 95\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:currentPositionUs\011J
    //   129: lcmp
    //   130: ifgt +16 -> 146
    //   133: aload_0
    //   134: aload_0
    //   135: getfield 97\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:pendingMetadata\011Ljava/lang/Object;
    //   138: invokespecial 169\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:invokeRenderer\011(Ljava/lang/Object;)V
    //   141: aload_0
    //   142: aconst_null
    //   143: putfield 97\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:pendingMetadata\011Ljava/lang/Object;
    //   146: return
    //   147: astore 5
    //   149: new 103\011com/google/android/exoplayer/ExoPlaybackException
    //   152: dup
    //   153: aload 5
    //   155: invokespecial 112\011com/google/android/exoplayer/ExoPlaybackException:<init>\011(Ljava/lang/Throwable;)V
    //   158: athrow
    //   159: iload 8
    //   161: iconst_m1
    //   162: if_icmpne -48 -> 114
    //   165: aload_0
    //   166: iconst_1
    //   167: putfield 99\011com/google/android/exoplayer/metadata/MetadataTrackRenderer:inputStreamEnded\011Z
    //   170: goto -56 -> 114
    //   173: astore 7
    //   175: new 103\011com/google/android/exoplayer/ExoPlaybackException
    //   178: dup
    //   179: aload 7
    //   181: invokespecial 112\011com/google/android/exoplayer/ExoPlaybackException:<init>\011(Ljava/lang/Throwable;)V
    //   184: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   5\01116\011147\011java/io/IOException
    //   30\01155\011173\011java/io/IOException
    //   62\011114\011173\011java/io/IOException
    //   165\011170\011173\011java/io/IOException
  }

  protected long getBufferedPositionUs()
  {
    return -3L;
  }

  protected long getCurrentPositionUs()
  {
    return this.currentPositionUs;
  }

  protected long getDurationUs()
  {
    return this.source.getTrackInfo(this.trackIndex).durationUs;
  }

  public boolean handleMessage(Message paramMessage)
  {
    switch (paramMessage.what)
    {
    default:
      return false;
    case 0:
    }
    invokeRendererInternal(paramMessage.obj);
    return true;
  }

  protected boolean isEnded()
  {
    return this.inputStreamEnded;
  }

  protected boolean isReady()
  {
    return true;
  }

  protected void onDisabled()
  {
    this.pendingMetadata = null;
    this.source.disable(this.trackIndex);
  }

  protected void onEnabled(long paramLong, boolean paramBoolean)
  {
    this.source.enable(this.trackIndex, paramLong);
    seekToInternal(paramLong);
  }

  protected void seekTo(long paramLong)
    throws ExoPlaybackException
  {
    this.source.seekToUs(paramLong);
    seekToInternal(paramLong);
  }

  public static abstract interface MetadataRenderer<T>
  {
    public abstract void onMetadata(T paramT);
  }
}