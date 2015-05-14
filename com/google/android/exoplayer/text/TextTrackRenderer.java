package com.google.android.exoplayer.text;

import android.annotation.TargetApi;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.google.android.exoplayer.ExoPlaybackException;
import com.google.android.exoplayer.MediaFormatHolder;
import com.google.android.exoplayer.SampleSource;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.TrackRenderer;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;

@TargetApi(16)
public class TextTrackRenderer extends TrackRenderer
  implements Handler.Callback
{
  private static final int MSG_UPDATE_OVERLAY;
  private long currentPositionUs;
  private final MediaFormatHolder formatHolder;
  private boolean inputStreamEnded;
  private int nextSubtitleEventIndex;
  private SubtitleParserHelper parserHelper;
  private int parserIndex;
  private HandlerThread parserThread;
  private final SampleSource source;
  private Subtitle subtitle;
  private final SubtitleParser[] subtitleParsers;
  private final TextRenderer textRenderer;
  private final Handler textRendererHandler;
  private boolean textRendererNeedsUpdate;
  private int trackIndex;

  public TextTrackRenderer(SampleSource paramSampleSource, TextRenderer paramTextRenderer, Looper paramLooper, SubtitleParser[] paramArrayOfSubtitleParser)
  {
    this.source = ((SampleSource)Assertions.checkNotNull(paramSampleSource));
    this.textRenderer = ((TextRenderer)Assertions.checkNotNull(paramTextRenderer));
    if (paramLooper == null);
    for (Handler localHandler = null; ; localHandler = new Handler(paramLooper, this))
    {
      this.textRendererHandler = localHandler;
      this.subtitleParsers = ((SubtitleParser[])Assertions.checkNotNull(paramArrayOfSubtitleParser));
      this.formatHolder = new MediaFormatHolder();
      return;
    }
  }

  private void clearTextRenderer()
  {
    if (this.textRendererHandler != null)
    {
      this.textRendererHandler.obtainMessage(0, null).sendToTarget();
      return;
    }
    invokeRendererInternal(null);
  }

  private long getNextEventTime()
  {
    if ((this.nextSubtitleEventIndex == -1) || (this.nextSubtitleEventIndex >= this.subtitle.getEventTimeCount()))
      return 9223372036854775807L;
    return this.subtitle.getEventTime(this.nextSubtitleEventIndex);
  }

  private void invokeRendererInternal(String paramString)
  {
    this.textRenderer.onText(paramString);
  }

  private void seekToInternal(long paramLong)
  {
    this.inputStreamEnded = false;
    this.currentPositionUs = paramLong;
    this.source.seekToUs(paramLong);
    if ((this.subtitle != null) && ((paramLong < this.subtitle.getStartTime()) || (this.subtitle.getLastEventTime() <= paramLong)))
      this.subtitle = null;
    this.parserHelper.flush();
    clearTextRenderer();
    syncNextEventIndex(paramLong);
    Subtitle localSubtitle = this.subtitle;
    boolean bool = false;
    if (localSubtitle != null)
      bool = true;
    this.textRendererNeedsUpdate = bool;
  }

  private void syncNextEventIndex(long paramLong)
  {
    if (this.subtitle == null);
    for (int i = -1; ; i = this.subtitle.getNextEventTimeIndex(paramLong))
    {
      this.nextSubtitleEventIndex = i;
      return;
    }
  }

  private void updateTextRenderer(long paramLong)
  {
    String str = this.subtitle.getText(paramLong);
    if (this.textRendererHandler != null)
    {
      this.textRendererHandler.obtainMessage(0, str).sendToTarget();
      return;
    }
    invokeRendererInternal(str);
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
    for (int i = 0; i < this.subtitleParsers.length; i++)
      for (int j = 0; j < this.source.getTrackCount(); j++)
        if (this.subtitleParsers[i].canParse(this.source.getTrackInfo(j).mimeType))
        {
          this.parserIndex = i;
          this.trackIndex = j;
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
    //   2: putfield 110\011com/google/android/exoplayer/text/TextTrackRenderer:currentPositionUs\011J
    //   5: aload_0
    //   6: getfield 50\011com/google/android/exoplayer/text/TextTrackRenderer:source\011Lcom/google/android/exoplayer/SampleSource;
    //   9: lload_1
    //   10: invokeinterface 183 3 0
    //   15: pop
    //   16: aload_0
    //   17: getfield 121\011com/google/android/exoplayer/text/TextTrackRenderer:parserHelper\011Lcom/google/android/exoplayer/text/SubtitleParserHelper;
    //   20: invokevirtual 186\011com/google/android/exoplayer/text/SubtitleParserHelper:isParsing\011()Z
    //   23: ifeq +16 -> 39
    //   26: return
    //   27: astore 5
    //   29: new 145\011com/google/android/exoplayer/ExoPlaybackException
    //   32: dup
    //   33: aload 5
    //   35: invokespecial 154\011com/google/android/exoplayer/ExoPlaybackException:<init>\011(Ljava/lang/Throwable;)V
    //   38: athrow
    //   39: aload_0
    //   40: getfield 89\011com/google/android/exoplayer/text/TextTrackRenderer:subtitle\011Lcom/google/android/exoplayer/text/Subtitle;
    //   43: astore 7
    //   45: aconst_null
    //   46: astore 8
    //   48: aload 7
    //   50: ifnonnull +16 -> 66
    //   53: aload_0
    //   54: getfield 121\011com/google/android/exoplayer/text/TextTrackRenderer:parserHelper\011Lcom/google/android/exoplayer/text/SubtitleParserHelper;
    //   57: invokevirtual 190\011com/google/android/exoplayer/text/SubtitleParserHelper:getAndClearResult\011()Lcom/google/android/exoplayer/text/Subtitle;
    //   60: astore 15
    //   62: aload 15
    //   64: astore 8
    //   66: aload_0
    //   67: getfield 89\011com/google/android/exoplayer/text/TextTrackRenderer:subtitle\011Lcom/google/android/exoplayer/text/Subtitle;
    //   70: ifnonnull +146 -> 216
    //   73: aload 8
    //   75: ifnull +141 -> 216
    //   78: aload_0
    //   79: aload 8
    //   81: putfield 89\011com/google/android/exoplayer/text/TextTrackRenderer:subtitle\011Lcom/google/android/exoplayer/text/Subtitle;
    //   84: aload_0
    //   85: lload_1
    //   86: invokespecial 131\011com/google/android/exoplayer/text/TextTrackRenderer:syncNextEventIndex\011(J)V
    //   89: aload_0
    //   90: iconst_1
    //   91: putfield 133\011com/google/android/exoplayer/text/TextTrackRenderer:textRendererNeedsUpdate\011Z
    //   94: aload_0
    //   95: getfield 108\011com/google/android/exoplayer/text/TextTrackRenderer:inputStreamEnded\011Z
    //   98: ifne +74 -> 172
    //   101: aload_0
    //   102: getfield 89\011com/google/android/exoplayer/text/TextTrackRenderer:subtitle\011Lcom/google/android/exoplayer/text/Subtitle;
    //   105: ifnonnull +67 -> 172
    //   108: aload_0
    //   109: getfield 121\011com/google/android/exoplayer/text/TextTrackRenderer:parserHelper\011Lcom/google/android/exoplayer/text/SubtitleParserHelper;
    //   112: invokevirtual 194\011com/google/android/exoplayer/text/SubtitleParserHelper:getSampleHolder\011()Lcom/google/android/exoplayer/SampleHolder;
    //   115: astore 12
    //   117: aload 12
    //   119: invokevirtual 199\011com/google/android/exoplayer/SampleHolder:clearData\011()V
    //   122: aload_0
    //   123: getfield 50\011com/google/android/exoplayer/text/TextTrackRenderer:source\011Lcom/google/android/exoplayer/SampleSource;
    //   126: aload_0
    //   127: getfield 177\011com/google/android/exoplayer/text/TextTrackRenderer:trackIndex\011I
    //   130: lload_1
    //   131: aload_0
    //   132: getfield 64\011com/google/android/exoplayer/text/TextTrackRenderer:formatHolder\011Lcom/google/android/exoplayer/MediaFormatHolder;
    //   135: aload 12
    //   137: iconst_0
    //   138: invokeinterface 203 7 0
    //   143: istore 13
    //   145: iload 13
    //   147: bipush 253
    //   149: if_icmpne +128 -> 277
    //   152: aload 12
    //   154: getfield 206\011com/google/android/exoplayer/SampleHolder:decodeOnly\011Z
    //   157: ifne +120 -> 277
    //   160: aload_0
    //   161: getfield 121\011com/google/android/exoplayer/text/TextTrackRenderer:parserHelper\011Lcom/google/android/exoplayer/text/SubtitleParserHelper;
    //   164: invokevirtual 209\011com/google/android/exoplayer/text/SubtitleParserHelper:startParseOperation\011()V
    //   167: aload_0
    //   168: iconst_0
    //   169: putfield 133\011com/google/android/exoplayer/text/TextTrackRenderer:textRendererNeedsUpdate\011Z
    //   172: aload_0
    //   173: getfield 133\011com/google/android/exoplayer/text/TextTrackRenderer:textRendererNeedsUpdate\011Z
    //   176: ifeq -150 -> 26
    //   179: aload_0
    //   180: invokevirtual 212\011com/google/android/exoplayer/text/TextTrackRenderer:getState\011()I
    //   183: iconst_3
    //   184: if_icmpne -158 -> 26
    //   187: aload_0
    //   188: iconst_0
    //   189: putfield 133\011com/google/android/exoplayer/text/TextTrackRenderer:textRendererNeedsUpdate\011Z
    //   192: aload_0
    //   193: getfield 89\011com/google/android/exoplayer/text/TextTrackRenderer:subtitle\011Lcom/google/android/exoplayer/text/Subtitle;
    //   196: ifnonnull +107 -> 303
    //   199: aload_0
    //   200: invokespecial 128\011com/google/android/exoplayer/text/TextTrackRenderer:clearTextRenderer\011()V
    //   203: return
    //   204: astore 14
    //   206: new 145\011com/google/android/exoplayer/ExoPlaybackException
    //   209: dup
    //   210: aload 14
    //   212: invokespecial 154\011com/google/android/exoplayer/ExoPlaybackException:<init>\011(Ljava/lang/Throwable;)V
    //   215: athrow
    //   216: aload_0
    //   217: getfield 89\011com/google/android/exoplayer/text/TextTrackRenderer:subtitle\011Lcom/google/android/exoplayer/text/Subtitle;
    //   220: ifnull -126 -> 94
    //   223: aload_0
    //   224: invokespecial 214\011com/google/android/exoplayer/text/TextTrackRenderer:getNextEventTime\011()J
    //   227: lstore 9
    //   229: lload 9
    //   231: lload_1
    //   232: lcmp
    //   233: ifgt +27 -> 260
    //   236: aload_0
    //   237: iconst_1
    //   238: aload_0
    //   239: getfield 87\011com/google/android/exoplayer/text/TextTrackRenderer:nextSubtitleEventIndex\011I
    //   242: iadd
    //   243: putfield 87\011com/google/android/exoplayer/text/TextTrackRenderer:nextSubtitleEventIndex\011I
    //   246: aload_0
    //   247: invokespecial 214\011com/google/android/exoplayer/text/TextTrackRenderer:getNextEventTime\011()J
    //   250: lstore 9
    //   252: aload_0
    //   253: iconst_1
    //   254: putfield 133\011com/google/android/exoplayer/text/TextTrackRenderer:textRendererNeedsUpdate\011Z
    //   257: goto -28 -> 229
    //   260: lload 9
    //   262: ldc2_w 96
    //   265: lcmp
    //   266: ifne -172 -> 94
    //   269: aload_0
    //   270: aconst_null
    //   271: putfield 89\011com/google/android/exoplayer/text/TextTrackRenderer:subtitle\011Lcom/google/android/exoplayer/text/Subtitle;
    //   274: goto -180 -> 94
    //   277: iload 13
    //   279: iconst_m1
    //   280: if_icmpne -108 -> 172
    //   283: aload_0
    //   284: iconst_1
    //   285: putfield 108\011com/google/android/exoplayer/text/TextTrackRenderer:inputStreamEnded\011Z
    //   288: goto -116 -> 172
    //   291: astore 11
    //   293: new 145\011com/google/android/exoplayer/ExoPlaybackException
    //   296: dup
    //   297: aload 11
    //   299: invokespecial 154\011com/google/android/exoplayer/ExoPlaybackException:<init>\011(Ljava/lang/Throwable;)V
    //   302: athrow
    //   303: aload_0
    //   304: lload_1
    //   305: invokespecial 216\011com/google/android/exoplayer/text/TextTrackRenderer:updateTextRenderer\011(J)V
    //   308: return
    //
    // Exception table:
    //   from\011to\011target\011type
    //   5\01116\01127\011java/io/IOException
    //   53\01162\011204\011java/io/IOException
    //   108\011145\011291\011java/io/IOException
    //   152\011172\011291\011java/io/IOException
    //   283\011288\011291\011java/io/IOException
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
    invokeRendererInternal((String)paramMessage.obj);
    return true;
  }

  protected boolean isEnded()
  {
    return (this.inputStreamEnded) && (this.subtitle == null);
  }

  protected boolean isReady()
  {
    return true;
  }

  protected void onDisabled()
  {
    this.subtitle = null;
    this.parserThread.quit();
    this.parserThread = null;
    this.parserHelper = null;
    clearTextRenderer();
    this.source.disable(this.trackIndex);
  }

  protected void onEnabled(long paramLong, boolean paramBoolean)
  {
    this.source.enable(this.trackIndex, paramLong);
    this.parserThread = new HandlerThread("textParser");
    this.parserThread.start();
    this.parserHelper = new SubtitleParserHelper(this.parserThread.getLooper(), this.subtitleParsers[this.parserIndex]);
    seekToInternal(paramLong);
  }

  protected void onReleased()
  {
    this.source.release();
  }

  protected void seekTo(long paramLong)
  {
    this.source.seekToUs(paramLong);
    seekToInternal(paramLong);
  }
}