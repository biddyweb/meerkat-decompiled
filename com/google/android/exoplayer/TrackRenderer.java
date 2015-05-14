package com.google.android.exoplayer;

import com.google.android.exoplayer.util.Assertions;

public abstract class TrackRenderer
  implements ExoPlayer.ExoPlayerComponent
{
  public static final long END_OF_TRACK_US = -3L;
  public static final long MATCH_LONGEST_US = -2L;
  protected static final int STATE_ENABLED = 2;
  protected static final int STATE_IGNORE = -1;
  protected static final int STATE_PREPARED = 1;
  protected static final int STATE_RELEASED = -2;
  protected static final int STATE_STARTED = 3;
  protected static final int STATE_UNPREPARED = 0;
  public static final long UNKNOWN_TIME_US = -1L;
  private int state;

  final void disable()
    throws ExoPlaybackException
  {
    if (this.state == 2);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.state = 1;
      onDisabled();
      return;
    }
  }

  protected abstract int doPrepare()
    throws ExoPlaybackException;

  protected abstract void doSomeWork(long paramLong1, long paramLong2)
    throws ExoPlaybackException;

  final void enable(long paramLong, boolean paramBoolean)
    throws ExoPlaybackException
  {
    int i = 1;
    if (this.state == i);
    while (true)
    {
      Assertions.checkState(i);
      this.state = 2;
      onEnabled(paramLong, paramBoolean);
      return;
      int j = 0;
    }
  }

  protected abstract long getBufferedPositionUs();

  protected abstract long getCurrentPositionUs();

  protected abstract long getDurationUs();

  protected final int getState()
  {
    return this.state;
  }

  public void handleMessage(int paramInt, Object paramObject)
    throws ExoPlaybackException
  {
  }

  protected abstract boolean isEnded();

  protected abstract boolean isReady();

  protected boolean isTimeSource()
  {
    return false;
  }

  protected void onDisabled()
    throws ExoPlaybackException
  {
  }

  protected void onEnabled(long paramLong, boolean paramBoolean)
    throws ExoPlaybackException
  {
  }

  protected void onReleased()
    throws ExoPlaybackException
  {
  }

  protected void onStarted()
    throws ExoPlaybackException
  {
  }

  protected void onStopped()
    throws ExoPlaybackException
  {
  }

  final int prepare()
    throws ExoPlaybackException
  {
    if (this.state == 0);
    for (boolean bool1 = true; ; bool1 = false)
    {
      Assertions.checkState(bool1);
      this.state = doPrepare();
      boolean bool2;
      if ((this.state != 0) && (this.state != 1))
      {
        int i = this.state;
        bool2 = false;
        if (i != -1);
      }
      else
      {
        bool2 = true;
      }
      Assertions.checkState(bool2);
      return this.state;
    }
  }

  final void release()
    throws ExoPlaybackException
  {
    if ((this.state != 2) && (this.state != 3) && (this.state != -2));
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.state = -2;
      onReleased();
      return;
    }
  }

  protected abstract void seekTo(long paramLong)
    throws ExoPlaybackException;

  final void start()
    throws ExoPlaybackException
  {
    if (this.state == 2);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.state = 3;
      onStarted();
      return;
    }
  }

  final void stop()
    throws ExoPlaybackException
  {
    if (this.state == 3);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.state = 2;
      onStopped();
      return;
    }
  }
}