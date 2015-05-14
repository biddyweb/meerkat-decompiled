package com.google.android.exoplayer;

import android.os.SystemClock;

class MediaClock
{
  private long deltaUs;
  private long positionUs;
  private boolean started;

  private long elapsedRealtimeMinus(long paramLong)
  {
    return 1000L * SystemClock.elapsedRealtime() - paramLong;
  }

  public long getPositionUs()
  {
    if (this.started)
      return elapsedRealtimeMinus(this.deltaUs);
    return this.positionUs;
  }

  public void setPositionUs(long paramLong)
  {
    this.positionUs = paramLong;
    this.deltaUs = elapsedRealtimeMinus(paramLong);
  }

  public void start()
  {
    if (!this.started)
    {
      this.started = true;
      this.deltaUs = elapsedRealtimeMinus(this.positionUs);
    }
  }

  public void stop()
  {
    if (this.started)
    {
      this.positionUs = elapsedRealtimeMinus(this.deltaUs);
      this.started = false;
    }
  }
}