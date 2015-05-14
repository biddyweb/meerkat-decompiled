package com.google.android.exoplayer.text.eia608;

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
import com.google.android.exoplayer.text.TextRenderer;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.util.TreeSet;

public class Eia608TrackRenderer extends TrackRenderer
  implements Handler.Callback
{
  private static final int CC_MODE_PAINT_ON = 3;
  private static final int CC_MODE_POP_ON = 2;
  private static final int CC_MODE_ROLL_UP = 1;
  private static final int CC_MODE_UNKNOWN = 0;
  private static final int DEFAULT_CAPTIONS_ROW_COUNT = 4;
  private static final int MAX_SAMPLE_READAHEAD_US = 5000000;
  private static final int MSG_INVOKE_RENDERER;
  private String caption;
  private int captionMode;
  private int captionRowCount;
  private final StringBuilder captionStringBuilder;
  private long currentPositionUs;
  private final Eia608Parser eia608Parser;
  private final MediaFormatHolder formatHolder;
  private boolean inputStreamEnded;
  private String lastRenderedCaption;
  private final TreeSet<ClosedCaptionList> pendingCaptionLists;
  private final SampleHolder sampleHolder;
  private final SampleSource source;
  private final TextRenderer textRenderer;
  private final Handler textRendererHandler;
  private int trackIndex;

  public Eia608TrackRenderer(SampleSource paramSampleSource, TextRenderer paramTextRenderer, Looper paramLooper)
  {
    this.source = ((SampleSource)Assertions.checkNotNull(paramSampleSource));
    this.textRenderer = ((TextRenderer)Assertions.checkNotNull(paramTextRenderer));
    if (paramLooper == null);
    for (Handler localHandler = null; ; localHandler = new Handler(paramLooper, this))
    {
      this.textRendererHandler = localHandler;
      this.eia608Parser = new Eia608Parser();
      this.formatHolder = new MediaFormatHolder();
      this.sampleHolder = new SampleHolder(1);
      this.captionStringBuilder = new StringBuilder();
      this.pendingCaptionLists = new TreeSet();
      return;
    }
  }

  private void clearPendingSample()
  {
    this.sampleHolder.timeUs = -1L;
    this.sampleHolder.clearData();
  }

  private void consumeCaptionList(ClosedCaptionList paramClosedCaptionList)
  {
    int i = paramClosedCaptionList.captions.length;
    if (i == 0);
    do
    {
      return;
      int j = 0;
      if (j < i)
      {
        ClosedCaption localClosedCaption = paramClosedCaptionList.captions[j];
        ClosedCaptionCtrl localClosedCaptionCtrl;
        if (localClosedCaption.type == 0)
        {
          localClosedCaptionCtrl = (ClosedCaptionCtrl)localClosedCaption;
          if (localClosedCaptionCtrl.isMiscCode())
            handleMiscCode(localClosedCaptionCtrl);
        }
        while (true)
        {
          j++;
          break;
          if (localClosedCaptionCtrl.isPreambleAddressCode())
          {
            handlePreambleAddressCode();
            continue;
            handleText((ClosedCaptionText)localClosedCaption);
          }
        }
      }
    }
    while ((this.captionMode != 1) && (this.captionMode != 3));
    this.caption = getDisplayCaption();
  }

  private String getDisplayCaption()
  {
    int i = this.captionStringBuilder.length();
    if (i == 0)
      return null;
    int j;
    if (this.captionStringBuilder.charAt(i - 1) == '\n')
    {
      j = 1;
      label31: if ((i == 1) && (j != 0))
        break label69;
      if (j == 0)
        break label71;
    }
    label69: label71: for (int k = i - 1; ; k = i)
    {
      if (this.captionMode == 1)
        break label76;
      return this.captionStringBuilder.substring(0, k);
      j = 0;
      break label31;
      break;
    }
    label76: int m = k;
    for (int n = 0; (n < this.captionRowCount) && (m != -1); n++)
      m = this.captionStringBuilder.lastIndexOf("\n", m - 1);
    int i1 = 0;
    if (m != -1)
      i1 = m + 1;
    this.captionStringBuilder.delete(0, i1);
    return this.captionStringBuilder.substring(0, k - i1);
  }

  private void handleMiscCode(ClosedCaptionCtrl paramClosedCaptionCtrl)
  {
    switch (paramClosedCaptionCtrl.cc2)
    {
    case 33:
    case 34:
    case 35:
    case 36:
    case 40:
    default:
      if (this.captionMode != 0)
        break;
    case 37:
    case 38:
    case 39:
    case 32:
    case 41:
    }
    do
    {
      return;
      this.captionRowCount = 2;
      setCaptionMode(1);
      return;
      this.captionRowCount = 3;
      setCaptionMode(1);
      return;
      this.captionRowCount = 4;
      setCaptionMode(1);
      return;
      setCaptionMode(2);
      return;
      setCaptionMode(3);
      return;
      switch (paramClosedCaptionCtrl.cc2)
      {
      default:
        return;
      case 44:
        this.caption = null;
      case 46:
      case 47:
      case 45:
      }
    }
    while ((this.captionMode != 1) && (this.captionMode != 3));
    this.captionStringBuilder.setLength(0);
    return;
    this.captionStringBuilder.setLength(0);
    return;
    this.caption = getDisplayCaption();
    this.captionStringBuilder.setLength(0);
    return;
    maybeAppendNewline();
  }

  private void handlePreambleAddressCode()
  {
    maybeAppendNewline();
  }

  private void handleText(ClosedCaptionText paramClosedCaptionText)
  {
    if (this.captionMode != 0)
      this.captionStringBuilder.append(paramClosedCaptionText.text);
  }

  private void invokeRenderer(String paramString)
  {
    if (Util.areEqual(this.lastRenderedCaption, paramString))
      return;
    this.lastRenderedCaption = paramString;
    if (this.textRendererHandler != null)
    {
      this.textRendererHandler.obtainMessage(0, paramString).sendToTarget();
      return;
    }
    invokeRendererInternal(paramString);
  }

  private void invokeRendererInternal(String paramString)
  {
    this.textRenderer.onText(paramString);
  }

  private boolean isSamplePending()
  {
    return this.sampleHolder.timeUs != -1L;
  }

  private void maybeAppendNewline()
  {
    int i = this.captionStringBuilder.length();
    if ((i > 0) && (this.captionStringBuilder.charAt(i - 1) != '\n'))
      this.captionStringBuilder.append('\n');
  }

  private void maybeParsePendingSample()
  {
    if (this.sampleHolder.timeUs > 5000000L + this.currentPositionUs);
    ClosedCaptionList localClosedCaptionList;
    do
    {
      return;
      localClosedCaptionList = this.eia608Parser.parse(this.sampleHolder);
      clearPendingSample();
    }
    while (localClosedCaptionList == null);
    this.pendingCaptionLists.add(localClosedCaptionList);
  }

  private void seekToInternal(long paramLong)
  {
    this.currentPositionUs = paramLong;
    this.inputStreamEnded = false;
    this.pendingCaptionLists.clear();
    clearPendingSample();
    this.captionRowCount = 4;
    setCaptionMode(0);
    invokeRenderer(null);
  }

  private void setCaptionMode(int paramInt)
  {
    if (this.captionMode == paramInt);
    do
    {
      return;
      this.captionMode = paramInt;
      this.captionStringBuilder.setLength(0);
    }
    while ((paramInt != 1) && (paramInt != 0));
    this.caption = null;
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
      if (this.eia608Parser.canParse(this.source.getTrackInfo(i).mimeType))
      {
        this.trackIndex = i;
        return 1;
      }
    return -1;
  }

  protected void doSomeWork(long paramLong1, long paramLong2)
    throws ExoPlaybackException
  {
    this.currentPositionUs = paramLong1;
    while (true)
    {
      try
      {
        this.source.continueBuffering(paramLong1);
        if (isSamplePending())
          maybeParsePendingSample();
        if (this.inputStreamEnded)
        {
          i = -1;
          if ((isSamplePending()) || (i != -3))
            break;
          try
          {
            i = this.source.readData(this.trackIndex, paramLong1, this.formatHolder, this.sampleHolder, false);
            if (i != -3)
              break label121;
            maybeParsePendingSample();
          }
          catch (IOException localIOException2)
          {
            throw new ExoPlaybackException(localIOException2);
          }
        }
      }
      catch (IOException localIOException1)
      {
        throw new ExoPlaybackException(localIOException1);
      }
      int i = -3;
      continue;
      label121: if (i == -1)
        this.inputStreamEnded = true;
    }
    do
    {
      ClosedCaptionList localClosedCaptionList = (ClosedCaptionList)this.pendingCaptionLists.pollFirst();
      consumeCaptionList(localClosedCaptionList);
      if (!localClosedCaptionList.decodeOnly)
        invokeRenderer(this.caption);
    }
    while ((!this.pendingCaptionLists.isEmpty()) && (((ClosedCaptionList)this.pendingCaptionLists.first()).timeUs <= this.currentPositionUs));
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
    return this.inputStreamEnded;
  }

  protected boolean isReady()
  {
    return true;
  }

  protected void onDisabled()
  {
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
}