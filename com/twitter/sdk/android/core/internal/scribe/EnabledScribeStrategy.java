package com.twitter.sdk.android.core.internal.scribe;

import android.content.Context;
import io.fabric.sdk.android.services.events.EnabledEventsStrategy;
import io.fabric.sdk.android.services.events.FilesSender;
import java.util.concurrent.ScheduledExecutorService;

class EnabledScribeStrategy extends EnabledEventsStrategy<ScribeEvent>
{
  private final FilesSender filesSender;

  public EnabledScribeStrategy(Context paramContext, ScheduledExecutorService paramScheduledExecutorService, ScribeFilesManager paramScribeFilesManager, ScribeConfig paramScribeConfig, ScribeFilesSender paramScribeFilesSender)
  {
    super(paramContext, paramScheduledExecutorService, paramScribeFilesManager);
    this.filesSender = paramScribeFilesSender;
    configureRollover(paramScribeConfig.sendIntervalSeconds);
  }

  public FilesSender getFilesSender()
  {
    return this.filesSender;
  }
}