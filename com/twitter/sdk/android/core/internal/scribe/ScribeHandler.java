package com.twitter.sdk.android.core.internal.scribe;

import android.content.Context;
import io.fabric.sdk.android.services.events.DisabledEventsStrategy;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.fabric.sdk.android.services.events.EventsHandler;
import io.fabric.sdk.android.services.events.EventsStrategy;
import java.util.concurrent.ScheduledExecutorService;

class ScribeHandler extends EventsHandler<ScribeEvent>
{
  public ScribeHandler(Context paramContext, EventsStrategy<ScribeEvent> paramEventsStrategy, EventsFilesManager paramEventsFilesManager, ScheduledExecutorService paramScheduledExecutorService)
  {
    super(paramContext, paramEventsStrategy, paramEventsFilesManager, paramScheduledExecutorService);
  }

  protected EventsStrategy<ScribeEvent> getDisabledEventsStrategy()
  {
    return new DisabledEventsStrategy();
  }

  public void scribe(ScribeEvent paramScribeEvent)
  {
    recordEventAsync(paramScribeEvent, false);
  }

  public void scribeAndFlush(ScribeEvent paramScribeEvent)
  {
    recordEventAsync(paramScribeEvent, true);
  }
}