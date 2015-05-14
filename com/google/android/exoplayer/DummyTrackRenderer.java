package com.google.android.exoplayer;

public class DummyTrackRenderer extends TrackRenderer
{
  protected int doPrepare()
    throws ExoPlaybackException
  {
    return -1;
  }

  protected void doSomeWork(long paramLong1, long paramLong2)
  {
    throw new IllegalStateException();
  }

  protected long getBufferedPositionUs()
  {
    throw new IllegalStateException();
  }

  protected long getCurrentPositionUs()
  {
    throw new IllegalStateException();
  }

  protected long getDurationUs()
  {
    throw new IllegalStateException();
  }

  protected boolean isEnded()
  {
    throw new IllegalStateException();
  }

  protected boolean isReady()
  {
    throw new IllegalStateException();
  }

  protected void seekTo(long paramLong)
  {
    throw new IllegalStateException();
  }
}