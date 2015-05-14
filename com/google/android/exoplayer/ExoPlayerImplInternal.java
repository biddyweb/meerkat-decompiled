package com.google.android.exoplayer;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.util.Log;
import android.util.Pair;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.PriorityHandlerThread;
import com.google.android.exoplayer.util.TraceUtil;
import java.util.ArrayList;
import java.util.List;

final class ExoPlayerImplInternal
  implements Handler.Callback
{
  private static final int IDLE_INTERVAL_MS = 1000;
  private static final int MSG_CUSTOM = 9;
  private static final int MSG_DO_SOME_WORK = 7;
  public static final int MSG_ERROR = 3;
  private static final int MSG_INCREMENTAL_PREPARE = 2;
  private static final int MSG_PREPARE = 1;
  private static final int MSG_RELEASE = 5;
  private static final int MSG_SEEK_TO = 6;
  private static final int MSG_SET_PLAY_WHEN_READY = 3;
  public static final int MSG_SET_PLAY_WHEN_READY_ACK = 2;
  private static final int MSG_SET_RENDERER_ENABLED = 8;
  public static final int MSG_STATE_CHANGED = 1;
  private static final int MSG_STOP = 4;
  private static final int PREPARE_INTERVAL_MS = 10;
  private static final int RENDERING_INTERVAL_MS = 10;
  private static final String TAG = "ExoPlayerImplInternal";
  private volatile long bufferedPositionUs;
  private int customMessagesProcessed = 0;
  private int customMessagesSent = 0;
  private volatile long durationUs;
  private long elapsedRealtimeUs;
  private final List<TrackRenderer> enabledRenderers;
  private final Handler eventHandler;
  private final Handler handler;
  private final HandlerThread internalPlaybackThread;
  private final MediaClock mediaClock;
  private final long minBufferUs;
  private final long minRebufferUs;
  private boolean playWhenReady;
  private volatile long positionUs;
  private boolean rebuffering;
  private boolean released;
  private final boolean[] rendererEnabledFlags;
  private TrackRenderer[] renderers;
  private int state;
  private TrackRenderer timeSourceTrackRenderer;

  public ExoPlayerImplInternal(Handler paramHandler, boolean paramBoolean, boolean[] paramArrayOfBoolean, int paramInt1, int paramInt2)
  {
    this.eventHandler = paramHandler;
    this.playWhenReady = paramBoolean;
    this.rendererEnabledFlags = new boolean[paramArrayOfBoolean.length];
    this.minBufferUs = (1000L * paramInt1);
    this.minRebufferUs = (1000L * paramInt2);
    for (int i = 0; i < paramArrayOfBoolean.length; i++)
      this.rendererEnabledFlags[i] = paramArrayOfBoolean[i];
    this.state = 1;
    this.durationUs = -1L;
    this.bufferedPositionUs = -1L;
    this.mediaClock = new MediaClock();
    this.enabledRenderers = new ArrayList(paramArrayOfBoolean.length);
    this.internalPlaybackThread = new PriorityHandlerThread(getClass().getSimpleName() + ":Handler", -16);
    this.internalPlaybackThread.start();
    this.handler = new Handler(this.internalPlaybackThread.getLooper(), this);
  }

  private void doSomeWork()
    throws ExoPlaybackException
  {
    TraceUtil.beginSection("doSomeWork");
    long l1 = SystemClock.elapsedRealtime();
    long l2;
    int i;
    int j;
    int k;
    label38: TrackRenderer localTrackRenderer;
    if (this.durationUs != -1L)
    {
      l2 = this.durationUs;
      i = 1;
      j = 1;
      updatePositionUs();
      k = 0;
      if (k >= this.enabledRenderers.size())
        break label222;
      localTrackRenderer = (TrackRenderer)this.enabledRenderers.get(k);
      localTrackRenderer.doSomeWork(this.positionUs, this.elapsedRealtimeUs);
      if ((i == 0) || (!localTrackRenderer.isEnded()))
        break label135;
      i = 1;
      label97: if ((j == 0) || (!rendererReadyOrEnded(localTrackRenderer)))
        break label141;
      j = 1;
      label114: if (l2 != -1L)
        break label147;
    }
    while (true)
    {
      k++;
      break label38;
      l2 = 9223372036854775807L;
      break;
      label135: i = 0;
      break label97;
      label141: j = 0;
      break label114;
      label147: long l3 = localTrackRenderer.getDurationUs();
      long l4 = localTrackRenderer.getBufferedPositionUs();
      if (l4 == -1L)
        l2 = -1L;
      else if ((l4 != -3L) && ((l3 == -1L) || (l3 == -2L) || (l4 < l3)))
        l2 = Math.min(l2, l4);
    }
    label222: this.bufferedPositionUs = l2;
    if (i != 0)
    {
      setState(5);
      stopRenderers();
      this.handler.removeMessages(7);
      if (((!this.playWhenReady) || (this.state != 4)) && (this.state != 3))
        break label352;
      scheduleNextOperation(7, l1, 10L);
    }
    while (true)
    {
      TraceUtil.endSection();
      return;
      if ((this.state == 3) && (j != 0))
      {
        setState(4);
        if (!this.playWhenReady)
          break;
        startRenderers();
        break;
      }
      if ((this.state != 4) || (j != 0))
        break;
      this.rebuffering = this.playWhenReady;
      setState(3);
      stopRenderers();
      break;
      label352: if (!this.enabledRenderers.isEmpty())
        scheduleNextOperation(7, l1, 1000L);
    }
  }

  private void ensureStopped(TrackRenderer paramTrackRenderer)
    throws ExoPlaybackException
  {
    if (paramTrackRenderer.getState() == 3)
      paramTrackRenderer.stop();
  }

  private void incrementalPrepareInternal()
    throws ExoPlaybackException
  {
    long l1 = SystemClock.elapsedRealtime();
    int i = 1;
    for (int j = 0; j < this.renderers.length; j++)
      if ((this.renderers[j].getState() == 0) && (this.renderers[j].prepare() == 0))
        i = 0;
    if (i == 0)
    {
      scheduleNextOperation(2, l1, 10L);
      return;
    }
    long l2 = 0L;
    int k = 1;
    int m = 1;
    int n = 0;
    if (n < this.renderers.length)
    {
      TrackRenderer localTrackRenderer = this.renderers[n];
      if ((this.rendererEnabledFlags[n] != 0) && (localTrackRenderer.getState() == 1))
      {
        localTrackRenderer.enable(this.positionUs, false);
        this.enabledRenderers.add(localTrackRenderer);
        if ((k == 0) || (!localTrackRenderer.isEnded()))
          break label187;
        k = 1;
        label155: if ((m == 0) || (!rendererReadyOrEnded(localTrackRenderer)))
          break label193;
        m = 1;
        label172: if (l2 != -1L)
          break label199;
      }
      while (true)
      {
        n++;
        break;
        label187: k = 0;
        break label155;
        label193: m = 0;
        break label172;
        label199: long l3 = localTrackRenderer.getDurationUs();
        if (l3 == -1L)
          l2 = -1L;
        else if (l3 != -2L)
          l2 = Math.max(l2, l3);
      }
    }
    this.durationUs = l2;
    if (k != 0)
    {
      setState(5);
      this.handler.sendEmptyMessage(7);
      return;
    }
    if (m != 0);
    for (int i1 = 4; ; i1 = 3)
    {
      setState(i1);
      if ((!this.playWhenReady) || (this.state != 4))
        break;
      startRenderers();
      break;
    }
  }

  private void prepareInternal(TrackRenderer[] paramArrayOfTrackRenderer)
  {
    this.rebuffering = false;
    this.renderers = paramArrayOfTrackRenderer;
    int i = 0;
    if (i < paramArrayOfTrackRenderer.length)
    {
      if (paramArrayOfTrackRenderer[i].isTimeSource())
        if (this.timeSourceTrackRenderer != null)
          break label55;
      label55: for (boolean bool = true; ; bool = false)
      {
        Assertions.checkState(bool);
        this.timeSourceTrackRenderer = paramArrayOfTrackRenderer[i];
        i++;
        break;
      }
    }
    setState(2);
    this.handler.sendEmptyMessage(2);
  }

  private void release(TrackRenderer paramTrackRenderer)
  {
    try
    {
      paramTrackRenderer.release();
      return;
    }
    catch (ExoPlaybackException localExoPlaybackException)
    {
      Log.e("ExoPlayerImplInternal", "Release failed.", localExoPlaybackException);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.e("ExoPlayerImplInternal", "Release failed.", localRuntimeException);
    }
  }

  private void releaseInternal()
  {
    resetInternal();
    try
    {
      this.released = true;
      notifyAll();
      return;
    }
    finally
    {
    }
  }

  private boolean rendererReadyOrEnded(TrackRenderer paramTrackRenderer)
  {
    if (paramTrackRenderer.isEnded());
    do
    {
      return true;
      if (!paramTrackRenderer.isReady())
        return false;
    }
    while (this.state == 4);
    long l1 = paramTrackRenderer.getDurationUs();
    long l2 = paramTrackRenderer.getBufferedPositionUs();
    if (this.rebuffering);
    for (long l3 = this.minRebufferUs; ; l3 = this.minBufferUs)
    {
      boolean bool1;
      if ((l3 > 0L) && (l2 != -1L) && (l2 != -3L) && (l2 < l3 + this.positionUs))
      {
        boolean bool2 = l1 < -1L;
        bool1 = false;
        if (bool2)
        {
          boolean bool3 = l1 < -2L;
          bool1 = false;
          if (bool3)
          {
            boolean bool4 = l2 < l1;
            bool1 = false;
            if (bool4);
          }
        }
      }
      else
      {
        bool1 = true;
      }
      return bool1;
    }
  }

  private void resetInternal()
  {
    this.handler.removeMessages(7);
    this.handler.removeMessages(2);
    this.mediaClock.stop();
    if (this.renderers == null)
      return;
    for (int i = 0; i < this.renderers.length; i++)
    {
      TrackRenderer localTrackRenderer = this.renderers[i];
      stopAndDisable(localTrackRenderer);
      release(localTrackRenderer);
    }
    this.renderers = null;
    this.timeSourceTrackRenderer = null;
    this.enabledRenderers.clear();
    setState(1);
  }

  private void scheduleNextOperation(int paramInt, long paramLong1, long paramLong2)
  {
    long l = paramLong1 + paramLong2 - SystemClock.elapsedRealtime();
    if (l <= 0L)
    {
      this.handler.sendEmptyMessage(paramInt);
      return;
    }
    this.handler.sendEmptyMessageDelayed(paramInt, l);
  }

  private void seekToInternal(long paramLong)
    throws ExoPlaybackException
  {
    this.rebuffering = false;
    this.positionUs = (1000L * paramLong);
    this.mediaClock.stop();
    this.mediaClock.setPositionUs(this.positionUs);
    if ((this.state == 1) || (this.state == 2))
      return;
    for (int i = 0; i < this.enabledRenderers.size(); i++)
    {
      TrackRenderer localTrackRenderer = (TrackRenderer)this.enabledRenderers.get(i);
      ensureStopped(localTrackRenderer);
      localTrackRenderer.seekTo(this.positionUs);
    }
    setState(3);
    this.handler.sendEmptyMessage(7);
  }

  // ERROR //
  private <T> void sendMessageInternal(int paramInt, Object paramObject)
    throws ExoPlaybackException
  {
    // Byte code:
    //   0: aload_2
    //   1: checkcast 337\011android/util/Pair
    //   4: astore 5
    //   6: aload 5
    //   8: getfield 341\011android/util/Pair:first\011Ljava/lang/Object;
    //   11: checkcast 343\011com/google/android/exoplayer/ExoPlayer$ExoPlayerComponent
    //   14: iload_1
    //   15: aload 5
    //   17: getfield 346\011android/util/Pair:second\011Ljava/lang/Object;
    //   20: invokeinterface 349 3 0
    //   25: aload_0
    //   26: monitorenter
    //   27: aload_0
    //   28: iconst_1
    //   29: aload_0
    //   30: getfield 76\011com/google/android/exoplayer/ExoPlayerImplInternal:customMessagesProcessed\011I
    //   33: iadd
    //   34: putfield 76\011com/google/android/exoplayer/ExoPlayerImplInternal:customMessagesProcessed\011I
    //   37: aload_0
    //   38: invokevirtual 307\011java/lang/Object:notifyAll\011()V
    //   41: aload_0
    //   42: monitorexit
    //   43: aload_0
    //   44: getfield 90\011com/google/android/exoplayer/ExoPlayerImplInternal:state\011I
    //   47: iconst_1
    //   48: if_icmpeq +21 -> 69
    //   51: aload_0
    //   52: getfield 90\011com/google/android/exoplayer/ExoPlayerImplInternal:state\011I
    //   55: iconst_2
    //   56: if_icmpeq +13 -> 69
    //   59: aload_0
    //   60: getfield 153\011com/google/android/exoplayer/ExoPlayerImplInternal:handler\011Landroid/os/Handler;
    //   63: bipush 7
    //   65: invokevirtual 272\011android/os/Handler:sendEmptyMessage\011(I)Z
    //   68: pop
    //   69: return
    //   70: astore 6
    //   72: aload_0
    //   73: monitorexit
    //   74: aload 6
    //   76: athrow
    //   77: astore_3
    //   78: aload_0
    //   79: monitorenter
    //   80: aload_0
    //   81: iconst_1
    //   82: aload_0
    //   83: getfield 76\011com/google/android/exoplayer/ExoPlayerImplInternal:customMessagesProcessed\011I
    //   86: iadd
    //   87: putfield 76\011com/google/android/exoplayer/ExoPlayerImplInternal:customMessagesProcessed\011I
    //   90: aload_0
    //   91: invokevirtual 307\011java/lang/Object:notifyAll\011()V
    //   94: aload_0
    //   95: monitorexit
    //   96: aload_3
    //   97: athrow
    //   98: astore 4
    //   100: aload_0
    //   101: monitorexit
    //   102: aload 4
    //   104: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   27\01143\01170\011finally
    //   72\01174\01170\011finally
    //   0\01125\01177\011finally
    //   80\01196\01198\011finally
    //   100\011102\01198\011finally
  }

  private void setPlayWhenReadyInternal(boolean paramBoolean)
    throws ExoPlaybackException
  {
    while (true)
    {
      try
      {
        this.rebuffering = false;
        this.playWhenReady = paramBoolean;
        if (!paramBoolean)
        {
          stopRenderers();
          updatePositionUs();
          return;
        }
        if (this.state == 4)
        {
          startRenderers();
          this.handler.sendEmptyMessage(7);
          continue;
        }
      }
      finally
      {
        this.eventHandler.obtainMessage(2).sendToTarget();
      }
      if (this.state == 3)
        this.handler.sendEmptyMessage(7);
    }
  }

  private void setRendererEnabledInternal(int paramInt, boolean paramBoolean)
    throws ExoPlaybackException
  {
    int i = 1;
    if (this.rendererEnabledFlags[paramInt] == paramBoolean);
    TrackRenderer localTrackRenderer;
    int k;
    do
    {
      do
      {
        return;
        this.rendererEnabledFlags[paramInt] = paramBoolean;
      }
      while ((this.state == i) || (this.state == 2));
      localTrackRenderer = this.renderers[paramInt];
      k = localTrackRenderer.getState();
    }
    while ((k != i) && (k != 2) && (k != 3));
    if (paramBoolean)
    {
      if ((this.playWhenReady) && (this.state == 4));
      while (true)
      {
        localTrackRenderer.enable(this.positionUs, i);
        this.enabledRenderers.add(localTrackRenderer);
        if (i != 0)
          localTrackRenderer.start();
        this.handler.sendEmptyMessage(7);
        return;
        int j = 0;
      }
    }
    if (localTrackRenderer == this.timeSourceTrackRenderer)
      this.mediaClock.setPositionUs(localTrackRenderer.getCurrentPositionUs());
    ensureStopped(localTrackRenderer);
    this.enabledRenderers.remove(localTrackRenderer);
    localTrackRenderer.disable();
  }

  private void setState(int paramInt)
  {
    if (this.state != paramInt)
    {
      this.state = paramInt;
      this.eventHandler.obtainMessage(1, paramInt, 0).sendToTarget();
    }
  }

  private void startRenderers()
    throws ExoPlaybackException
  {
    this.rebuffering = false;
    this.mediaClock.start();
    for (int i = 0; i < this.enabledRenderers.size(); i++)
      ((TrackRenderer)this.enabledRenderers.get(i)).start();
  }

  private void stopAndDisable(TrackRenderer paramTrackRenderer)
  {
    try
    {
      ensureStopped(paramTrackRenderer);
      if (paramTrackRenderer.getState() == 2)
        paramTrackRenderer.disable();
      return;
    }
    catch (ExoPlaybackException localExoPlaybackException)
    {
      Log.e("ExoPlayerImplInternal", "Stop failed.", localExoPlaybackException);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.e("ExoPlayerImplInternal", "Stop failed.", localRuntimeException);
    }
  }

  private void stopInternal()
  {
    this.rebuffering = false;
    resetInternal();
  }

  private void stopRenderers()
    throws ExoPlaybackException
  {
    this.mediaClock.stop();
    for (int i = 0; i < this.enabledRenderers.size(); i++)
      ensureStopped((TrackRenderer)this.enabledRenderers.get(i));
  }

  private void updatePositionUs()
  {
    if ((this.timeSourceTrackRenderer != null) && (this.enabledRenderers.contains(this.timeSourceTrackRenderer)) && (!this.timeSourceTrackRenderer.isEnded()))
    {
      this.positionUs = this.timeSourceTrackRenderer.getCurrentPositionUs();
      this.mediaClock.setPositionUs(this.positionUs);
    }
    while (true)
    {
      this.elapsedRealtimeUs = (1000L * SystemClock.elapsedRealtime());
      return;
      this.positionUs = this.mediaClock.getPositionUs();
    }
  }

  public void blockingSendMessage(ExoPlayer.ExoPlayerComponent paramExoPlayerComponent, int paramInt, Object paramObject)
  {
    try
    {
      if (this.released)
      {
        Log.w("ExoPlayerImplInternal", "Sent message(" + paramInt + ") after release. Message ignored.");
        return;
      }
      int i = this.customMessagesSent;
      this.customMessagesSent = (i + 1);
      this.handler.obtainMessage(9, paramInt, 0, Pair.create(paramExoPlayerComponent, paramObject)).sendToTarget();
      while (true)
      {
        int j = this.customMessagesProcessed;
        if (j > i)
          break;
        try
        {
          wait();
        }
        catch (InterruptedException localInterruptedException)
        {
          Thread.currentThread().interrupt();
        }
      }
    }
    finally
    {
    }
  }

  public long getBufferedPosition()
  {
    if (this.bufferedPositionUs == -1L)
      return -1L;
    return this.bufferedPositionUs / 1000L;
  }

  public long getCurrentPosition()
  {
    return this.positionUs / 1000L;
  }

  public long getDuration()
  {
    if (this.durationUs == -1L)
      return -1L;
    return this.durationUs / 1000L;
  }

  public Looper getPlaybackLooper()
  {
    return this.internalPlaybackThread.getLooper();
  }

  public boolean handleMessage(Message paramMessage)
  {
    boolean bool1;
    try
    {
      int i = paramMessage.what;
      bool1 = false;
      switch (i)
      {
      case 1:
        prepareInternal((TrackRenderer[])paramMessage.obj);
        return true;
      case 2:
        incrementalPrepareInternal();
        return true;
      case 3:
        int m = paramMessage.arg1;
        boolean bool3 = false;
        if (m != 0)
          bool3 = true;
        setPlayWhenReadyInternal(bool3);
        return true;
      case 7:
        doSomeWork();
        return true;
      case 6:
        seekToInternal(((Long)paramMessage.obj).longValue());
        return true;
      case 4:
        stopInternal();
        return true;
      case 5:
        releaseInternal();
        return true;
      case 9:
        sendMessageInternal(paramMessage.arg1, paramMessage.obj);
        return true;
      case 8:
        int j = paramMessage.arg1;
        int k = paramMessage.arg2;
        boolean bool2 = false;
        if (k != 0)
          bool2 = true;
        setRendererEnabledInternal(j, bool2);
        return true;
      }
    }
    catch (ExoPlaybackException localExoPlaybackException)
    {
      Log.e("ExoPlayerImplInternal", "Internal track renderer error.", localExoPlaybackException);
      this.eventHandler.obtainMessage(3, localExoPlaybackException).sendToTarget();
      stopInternal();
      return true;
    }
    catch (RuntimeException localRuntimeException)
    {
      Log.e("ExoPlayerImplInternal", "Internal runtime error.", localRuntimeException);
      this.eventHandler.obtainMessage(3, new ExoPlaybackException(localRuntimeException)).sendToTarget();
      stopInternal();
      bool1 = true;
    }
    return bool1;
  }

  public void prepare(TrackRenderer[] paramArrayOfTrackRenderer)
  {
    this.handler.obtainMessage(1, paramArrayOfTrackRenderer).sendToTarget();
  }

  public void release()
  {
    while (true)
    {
      try
      {
        boolean bool1 = this.released;
        if (bool1)
          return;
        this.handler.sendEmptyMessage(5);
        boolean bool2 = this.released;
        if (!bool2)
        {
          try
          {
            wait();
          }
          catch (InterruptedException localInterruptedException)
          {
            Thread.currentThread().interrupt();
          }
          continue;
        }
      }
      finally
      {
      }
      this.internalPlaybackThread.quit();
    }
  }

  public void seekTo(long paramLong)
  {
    this.handler.obtainMessage(6, Long.valueOf(paramLong)).sendToTarget();
  }

  public void sendMessage(ExoPlayer.ExoPlayerComponent paramExoPlayerComponent, int paramInt, Object paramObject)
  {
    this.customMessagesSent = (1 + this.customMessagesSent);
    this.handler.obtainMessage(9, paramInt, 0, Pair.create(paramExoPlayerComponent, paramObject)).sendToTarget();
  }

  public void setPlayWhenReady(boolean paramBoolean)
  {
    Handler localHandler = this.handler;
    if (paramBoolean);
    for (int i = 1; ; i = 0)
    {
      localHandler.obtainMessage(3, i, 0).sendToTarget();
      return;
    }
  }

  public void setRendererEnabled(int paramInt, boolean paramBoolean)
  {
    Handler localHandler = this.handler;
    if (paramBoolean);
    for (int i = 1; ; i = 0)
    {
      localHandler.obtainMessage(8, paramInt, i).sendToTarget();
      return;
    }
  }

  public void stop()
  {
    this.handler.sendEmptyMessage(4);
  }
}