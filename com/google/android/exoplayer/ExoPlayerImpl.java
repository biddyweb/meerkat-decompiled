package com.google.android.exoplayer;

import android.annotation.SuppressLint;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;

final class ExoPlayerImpl
  implements ExoPlayer
{
  private static final String TAG = "ExoPlayerImpl";
  private final Handler eventHandler;
  private final ExoPlayerImplInternal internalPlayer;
  private final CopyOnWriteArraySet<ExoPlayer.Listener> listeners;
  private int pendingPlayWhenReadyAcks;
  private boolean playWhenReady;
  private int playbackState;
  private final boolean[] rendererEnabledFlags;

  @SuppressLint({"HandlerLeak"})
  public ExoPlayerImpl(int paramInt1, int paramInt2, int paramInt3)
  {
    Log.i("ExoPlayerImpl", "Init 1.2.4");
    this.playWhenReady = false;
    this.playbackState = 1;
    this.listeners = new CopyOnWriteArraySet();
    this.rendererEnabledFlags = new boolean[paramInt1];
    for (int i = 0; i < this.rendererEnabledFlags.length; i++)
      this.rendererEnabledFlags[i] = true;
    this.eventHandler = new Handler()
    {
      public void handleMessage(Message paramAnonymousMessage)
      {
        ExoPlayerImpl.this.handleEvent(paramAnonymousMessage);
      }
    };
    this.internalPlayer = new ExoPlayerImplInternal(this.eventHandler, this.playWhenReady, this.rendererEnabledFlags, paramInt2, paramInt3);
  }

  public void addListener(ExoPlayer.Listener paramListener)
  {
    this.listeners.add(paramListener);
  }

  public void blockingSendMessage(ExoPlayer.ExoPlayerComponent paramExoPlayerComponent, int paramInt, Object paramObject)
  {
    this.internalPlayer.blockingSendMessage(paramExoPlayerComponent, paramInt, paramObject);
  }

  public int getBufferedPercentage()
  {
    long l1 = 100L;
    long l2 = getBufferedPosition();
    long l3 = getDuration();
    if ((l2 == -1L) || (l3 == -1L))
      return 0;
    if (l3 == 0L);
    while (true)
    {
      return (int)l1;
      l1 = l1 * l2 / l3;
    }
  }

  public long getBufferedPosition()
  {
    return this.internalPlayer.getBufferedPosition();
  }

  public long getCurrentPosition()
  {
    return this.internalPlayer.getCurrentPosition();
  }

  public long getDuration()
  {
    return this.internalPlayer.getDuration();
  }

  public boolean getPlayWhenReady()
  {
    return this.playWhenReady;
  }

  public Looper getPlaybackLooper()
  {
    return this.internalPlayer.getPlaybackLooper();
  }

  public int getPlaybackState()
  {
    return this.playbackState;
  }

  public boolean getRendererEnabled(int paramInt)
  {
    return this.rendererEnabledFlags[paramInt];
  }

  void handleEvent(Message paramMessage)
  {
    switch (paramMessage.what)
    {
    default:
    case 1:
    case 2:
    case 3:
    }
    while (true)
    {
      return;
      this.playbackState = paramMessage.arg1;
      Iterator localIterator3 = this.listeners.iterator();
      while (localIterator3.hasNext())
        ((ExoPlayer.Listener)localIterator3.next()).onPlayerStateChanged(this.playWhenReady, this.playbackState);
      continue;
      this.pendingPlayWhenReadyAcks = (-1 + this.pendingPlayWhenReadyAcks);
      if (this.pendingPlayWhenReadyAcks == 0)
      {
        Iterator localIterator2 = this.listeners.iterator();
        while (localIterator2.hasNext())
          ((ExoPlayer.Listener)localIterator2.next()).onPlayWhenReadyCommitted();
        continue;
        ExoPlaybackException localExoPlaybackException = (ExoPlaybackException)paramMessage.obj;
        Iterator localIterator1 = this.listeners.iterator();
        while (localIterator1.hasNext())
          ((ExoPlayer.Listener)localIterator1.next()).onPlayerError(localExoPlaybackException);
      }
    }
  }

  public boolean isPlayWhenReadyCommitted()
  {
    return this.pendingPlayWhenReadyAcks == 0;
  }

  public void prepare(TrackRenderer[] paramArrayOfTrackRenderer)
  {
    this.internalPlayer.prepare(paramArrayOfTrackRenderer);
  }

  public void release()
  {
    this.internalPlayer.release();
    this.eventHandler.removeCallbacksAndMessages(null);
  }

  public void removeListener(ExoPlayer.Listener paramListener)
  {
    this.listeners.remove(paramListener);
  }

  public void seekTo(long paramLong)
  {
    this.internalPlayer.seekTo(paramLong);
  }

  public void sendMessage(ExoPlayer.ExoPlayerComponent paramExoPlayerComponent, int paramInt, Object paramObject)
  {
    this.internalPlayer.sendMessage(paramExoPlayerComponent, paramInt, paramObject);
  }

  public void setPlayWhenReady(boolean paramBoolean)
  {
    if (this.playWhenReady != paramBoolean)
    {
      this.playWhenReady = paramBoolean;
      this.pendingPlayWhenReadyAcks = (1 + this.pendingPlayWhenReadyAcks);
      this.internalPlayer.setPlayWhenReady(paramBoolean);
      Iterator localIterator = this.listeners.iterator();
      while (localIterator.hasNext())
        ((ExoPlayer.Listener)localIterator.next()).onPlayerStateChanged(paramBoolean, this.playbackState);
    }
  }

  public void setRendererEnabled(int paramInt, boolean paramBoolean)
  {
    if (this.rendererEnabledFlags[paramInt] != paramBoolean)
    {
      this.rendererEnabledFlags[paramInt] = paramBoolean;
      this.internalPlayer.setRendererEnabled(paramInt, paramBoolean);
    }
  }

  public void stop()
  {
    this.internalPlayer.stop();
  }
}