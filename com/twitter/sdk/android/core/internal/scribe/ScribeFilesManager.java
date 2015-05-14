package com.twitter.sdk.android.core.internal.scribe;

import android.content.Context;
import io.fabric.sdk.android.services.common.CurrentTimeProvider;
import io.fabric.sdk.android.services.events.EventTransform;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.fabric.sdk.android.services.events.QueueFileEventStorage;
import java.io.IOException;
import java.util.UUID;

class ScribeFilesManager extends EventsFilesManager<ScribeEvent>
{
  static final String FILE_EXTENSION = ".tap";
  static final String FILE_PREFIX = "se";

  public ScribeFilesManager(Context paramContext, EventTransform<ScribeEvent> paramEventTransform, CurrentTimeProvider paramCurrentTimeProvider, QueueFileEventStorage paramQueueFileEventStorage, int paramInt)
    throws IOException
  {
    super(paramContext, paramEventTransform, paramCurrentTimeProvider, paramQueueFileEventStorage, paramInt);
  }

  protected String generateUniqueRollOverFileName()
  {
    UUID localUUID = UUID.randomUUID();
    return "se" + "_" + localUUID.toString() + "_" + this.currentTimeProvider.getCurrentTimeMillis() + ".tap";
  }
}