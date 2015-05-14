package com.google.android.gms.games.event;

import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class EventBuffer extends AbstractDataBuffer<Event>
{
  public EventBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  public Event get(int paramInt)
  {
    return new EventRef(this.zzMd, paramInt);
  }
}