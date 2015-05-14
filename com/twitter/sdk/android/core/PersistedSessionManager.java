package com.twitter.sdk.android.core;

import android.content.SharedPreferences;
import io.fabric.sdk.android.services.persistence.PreferenceStore;
import io.fabric.sdk.android.services.persistence.PreferenceStoreStrategy;
import io.fabric.sdk.android.services.persistence.SerializationStrategy;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReference;

public class PersistedSessionManager<T extends Session>
  implements SessionManager<T>
{
  private static final int NUM_SESSIONS = 1;
  private final AtomicReference<T> activeSessionRef;
  private final PreferenceStoreStrategy<T> activeSessionStorage;
  private final String prefKeyActiveSession;
  private final String prefKeySession;
  private final PreferenceStore preferenceStore;
  private volatile boolean restorePending = true;
  private final SerializationStrategy<T> serializer;
  private final ConcurrentHashMap<Long, T> sessionMap;
  private final ConcurrentHashMap<Long, PreferenceStoreStrategy<T>> storageMap;

  public PersistedSessionManager(PreferenceStore paramPreferenceStore, SerializationStrategy<T> paramSerializationStrategy, String paramString1, String paramString2)
  {
    this(paramPreferenceStore, paramSerializationStrategy, new ConcurrentHashMap(1), new ConcurrentHashMap(1), new PreferenceStoreStrategy(paramPreferenceStore, paramSerializationStrategy, paramString1), paramString1, paramString2);
  }

  PersistedSessionManager(PreferenceStore paramPreferenceStore, SerializationStrategy<T> paramSerializationStrategy, ConcurrentHashMap<Long, T> paramConcurrentHashMap, ConcurrentHashMap<Long, PreferenceStoreStrategy<T>> paramConcurrentHashMap1, PreferenceStoreStrategy<T> paramPreferenceStoreStrategy, String paramString1, String paramString2)
  {
    this.preferenceStore = paramPreferenceStore;
    this.serializer = paramSerializationStrategy;
    this.sessionMap = paramConcurrentHashMap;
    this.storageMap = paramConcurrentHashMap1;
    this.activeSessionStorage = paramPreferenceStoreStrategy;
    this.activeSessionRef = new AtomicReference();
    this.prefKeyActiveSession = paramString1;
    this.prefKeySession = paramString2;
  }

  private void internalSetSession(long paramLong, T paramT, boolean paramBoolean)
  {
    this.sessionMap.put(Long.valueOf(paramLong), paramT);
    PreferenceStoreStrategy localPreferenceStoreStrategy = (PreferenceStoreStrategy)this.storageMap.get(Long.valueOf(paramLong));
    if (localPreferenceStoreStrategy == null)
    {
      localPreferenceStoreStrategy = new PreferenceStoreStrategy(this.preferenceStore, this.serializer, getPrefKey(paramLong));
      this.storageMap.putIfAbsent(Long.valueOf(paramLong), localPreferenceStoreStrategy);
    }
    localPreferenceStoreStrategy.save(paramT);
    Session localSession = (Session)this.activeSessionRef.get();
    if ((localSession == null) || (paramBoolean))
      try
      {
        this.activeSessionRef.compareAndSet(localSession, paramT);
        this.activeSessionStorage.save(paramT);
        return;
      }
      finally
      {
      }
  }

  private void restoreActiveSession()
  {
    Session localSession = (Session)this.activeSessionStorage.restore();
    if (localSession != null)
      internalSetSession(localSession.getId(), localSession, false);
  }

  private void restoreAllSessions()
  {
    try
    {
      if (this.restorePending)
      {
        restoreActiveSession();
        restoreSessions();
        this.restorePending = false;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void restoreSessions()
  {
    Iterator localIterator = this.preferenceStore.get().getAll().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (isSessionPreferenceKey((String)localEntry.getKey()))
      {
        Session localSession = (Session)this.serializer.deserialize((String)localEntry.getValue());
        if (localSession != null)
          internalSetSession(localSession.getId(), localSession, false);
      }
    }
  }

  public void clearActiveSession()
  {
    restoreAllSessionsIfNecessary();
    if (this.activeSessionRef.get() != null)
      clearSession(((Session)this.activeSessionRef.get()).getId());
  }

  public void clearSession(long paramLong)
  {
    restoreAllSessionsIfNecessary();
    if ((this.activeSessionRef.get() != null) && (((Session)this.activeSessionRef.get()).getId() == paramLong));
    try
    {
      this.activeSessionRef.set(null);
      this.activeSessionStorage.clear();
      this.sessionMap.remove(Long.valueOf(paramLong));
      PreferenceStoreStrategy localPreferenceStoreStrategy = (PreferenceStoreStrategy)this.storageMap.remove(Long.valueOf(paramLong));
      if (localPreferenceStoreStrategy != null)
        localPreferenceStoreStrategy.clear();
      return;
    }
    finally
    {
    }
  }

  public T getActiveSession()
  {
    restoreAllSessionsIfNecessary();
    return (Session)this.activeSessionRef.get();
  }

  String getPrefKey(long paramLong)
  {
    return this.prefKeySession + "_" + paramLong;
  }

  public T getSession(long paramLong)
  {
    restoreAllSessionsIfNecessary();
    return (Session)this.sessionMap.get(Long.valueOf(paramLong));
  }

  public Map<Long, T> getSessionMap()
  {
    restoreAllSessionsIfNecessary();
    return Collections.unmodifiableMap(this.sessionMap);
  }

  boolean isSessionPreferenceKey(String paramString)
  {
    return paramString.startsWith(this.prefKeySession);
  }

  void restoreAllSessionsIfNecessary()
  {
    if (this.restorePending)
      restoreAllSessions();
  }

  public void setActiveSession(T paramT)
  {
    if (paramT == null)
      throw new IllegalArgumentException("Session must not be null!");
    restoreAllSessionsIfNecessary();
    internalSetSession(paramT.getId(), paramT, true);
  }

  public void setSession(long paramLong, T paramT)
  {
    if (paramT == null)
      throw new IllegalArgumentException("Session must not be null!");
    restoreAllSessionsIfNecessary();
    internalSetSession(paramLong, paramT, false);
  }
}