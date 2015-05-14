package com.twitter.sdk.android.core.internal.scribe;

import android.content.Context;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import io.fabric.sdk.android.Kit;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.fabric.sdk.android.services.common.IdManager;
import io.fabric.sdk.android.services.common.SystemCurrentTimeProvider;
import io.fabric.sdk.android.services.events.DisabledEventsStrategy;
import io.fabric.sdk.android.services.events.EventsStrategy;
import io.fabric.sdk.android.services.events.QueueFileEventStorage;
import io.fabric.sdk.android.services.persistence.FileStoreImpl;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledExecutorService;
import javax.net.ssl.SSLSocketFactory;

public class ScribeClient
{
  private static final String STORAGE_DIR_BASE = "_se_to_send";
  private static final String WORKING_FILENAME_BASE = "_se.tap";
  private final TwitterAuthConfig authConfig;
  private final ScheduledExecutorService executor;
  private final IdManager idManager;
  private final Kit kit;
  private final ScribeConfig scribeConfig;
  final ConcurrentHashMap<Long, ScribeHandler> scribeHandlers;
  private final List<SessionManager<? extends Session>> sessionManagers;
  private final SSLSocketFactory sslSocketFactory;
  private final ScribeEvent.Transform transform;

  public ScribeClient(Kit paramKit, ScheduledExecutorService paramScheduledExecutorService, ScribeConfig paramScribeConfig, ScribeEvent.Transform paramTransform, TwitterAuthConfig paramTwitterAuthConfig, List<SessionManager<? extends Session>> paramList, SSLSocketFactory paramSSLSocketFactory, IdManager paramIdManager)
  {
    this.kit = paramKit;
    this.executor = paramScheduledExecutorService;
    this.scribeConfig = paramScribeConfig;
    this.transform = paramTransform;
    this.authConfig = paramTwitterAuthConfig;
    this.sessionManagers = paramList;
    this.sslSocketFactory = paramSSLSocketFactory;
    this.idManager = paramIdManager;
    this.scribeHandlers = new ConcurrentHashMap(2);
  }

  private ScribeHandler newScribeHandler(long paramLong)
    throws IOException
  {
    Context localContext = this.kit.getContext();
    QueueFileEventStorage localQueueFileEventStorage = new QueueFileEventStorage(localContext, new FileStoreImpl(this.kit).getFilesDir(), getWorkingFileNameForOwner(paramLong), getStorageDirForOwner(paramLong));
    ScribeFilesManager localScribeFilesManager = new ScribeFilesManager(localContext, this.transform, new SystemCurrentTimeProvider(), localQueueFileEventStorage, this.scribeConfig.maxFilesToKeep);
    return new ScribeHandler(localContext, getScribeStrategy(paramLong, localScribeFilesManager), localScribeFilesManager, this.executor);
  }

  ScribeHandler getScribeHandler(long paramLong)
    throws IOException
  {
    if (!this.scribeHandlers.containsKey(Long.valueOf(paramLong)))
      this.scribeHandlers.putIfAbsent(Long.valueOf(paramLong), newScribeHandler(paramLong));
    return (ScribeHandler)this.scribeHandlers.get(Long.valueOf(paramLong));
  }

  EventsStrategy<ScribeEvent> getScribeStrategy(long paramLong, ScribeFilesManager paramScribeFilesManager)
  {
    Context localContext = this.kit.getContext();
    if (this.scribeConfig.isEnabled)
    {
      CommonUtils.logControlled(localContext, "Scribe enabled");
      EnabledScribeStrategy localEnabledScribeStrategy = new EnabledScribeStrategy(localContext, this.executor, paramScribeFilesManager, this.scribeConfig, new ScribeFilesSender(localContext, this.scribeConfig, paramLong, this.authConfig, this.sessionManagers, this.sslSocketFactory, this.executor, this.idManager));
      return localEnabledScribeStrategy;
    }
    CommonUtils.logControlled(localContext, "Scribe disabled");
    return new DisabledEventsStrategy();
  }

  String getStorageDirForOwner(long paramLong)
  {
    return paramLong + "_se_to_send";
  }

  String getWorkingFileNameForOwner(long paramLong)
  {
    return paramLong + "_se.tap";
  }

  public boolean scribe(ScribeEvent paramScribeEvent, long paramLong)
  {
    try
    {
      getScribeHandler(paramLong).scribe(paramScribeEvent);
      return true;
    }
    catch (IOException localIOException)
    {
      CommonUtils.logControlledError(this.kit.getContext(), "Failed to scribe event", localIOException);
    }
    return false;
  }

  public boolean scribeAndFlush(ScribeEvent paramScribeEvent, long paramLong)
  {
    try
    {
      getScribeHandler(paramLong).scribeAndFlush(paramScribeEvent);
      return true;
    }
    catch (IOException localIOException)
    {
      CommonUtils.logControlledError(this.kit.getContext(), "Failed to scribe event", localIOException);
    }
    return false;
  }
}