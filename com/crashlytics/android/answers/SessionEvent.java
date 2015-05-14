package com.crashlytics.android.answers;

import android.app.Activity;
import java.util.Collections;
import java.util.Map;

final class SessionEvent
{
  static final String ACTIVITY_KEY = "activity";
  static final String SESSION_ID_KEY = "sessionId";
  public final Map<String, Object> customAttributes;
  public final String customType;
  public final Map<String, String> details;
  public final SessionEventMetadata sessionEventMetadata;
  private String stringRepresentation;
  public final long timestamp;
  public final Type type;

  private SessionEvent(SessionEventMetadata paramSessionEventMetadata, long paramLong, Type paramType, Map<String, String> paramMap, String paramString, Map<String, Object> paramMap1)
  {
    this.sessionEventMetadata = paramSessionEventMetadata;
    this.timestamp = paramLong;
    this.type = paramType;
    this.details = paramMap;
    this.customType = paramString;
    this.customAttributes = paramMap1;
  }

  public static SessionEvent buildActivityLifecycleEvent(SessionEventMetadata paramSessionEventMetadata, Type paramType, Activity paramActivity)
  {
    return buildEvent(paramSessionEventMetadata, paramType, Collections.singletonMap("activity", paramActivity.getClass().getName()));
  }

  public static SessionEvent buildCrashEvent(SessionEventMetadata paramSessionEventMetadata, String paramString)
  {
    Map localMap = Collections.singletonMap("sessionId", paramString);
    return buildEvent(paramSessionEventMetadata, Type.CRASH, localMap);
  }

  public static SessionEvent buildCustomEvent(SessionEventMetadata paramSessionEventMetadata, String paramString, Map<String, Object> paramMap)
  {
    return buildEvent(paramSessionEventMetadata, Type.CUSTOM, Collections.emptyMap(), paramString, paramMap);
  }

  public static SessionEvent buildErrorEvent(SessionEventMetadata paramSessionEventMetadata, String paramString)
  {
    Map localMap = Collections.singletonMap("sessionId", paramString);
    return buildEvent(paramSessionEventMetadata, Type.ERROR, localMap);
  }

  private static SessionEvent buildEvent(SessionEventMetadata paramSessionEventMetadata, Type paramType, Map<String, String> paramMap)
  {
    return buildEvent(paramSessionEventMetadata, paramType, paramMap, null, Collections.emptyMap());
  }

  private static SessionEvent buildEvent(SessionEventMetadata paramSessionEventMetadata, Type paramType, Map<String, String> paramMap, String paramString, Map<String, Object> paramMap1)
  {
    return new SessionEvent(paramSessionEventMetadata, System.currentTimeMillis(), paramType, paramMap, paramString, paramMap1);
  }

  public static SessionEvent buildInstallEvent(SessionEventMetadata paramSessionEventMetadata)
  {
    return buildEvent(paramSessionEventMetadata, Type.INSTALL, Collections.emptyMap());
  }

  public String toString()
  {
    if (this.stringRepresentation == null)
      this.stringRepresentation = ("[" + getClass().getSimpleName() + ": " + "timestamp=" + this.timestamp + ", type=" + this.type + ", details=" + this.details.toString() + ", customType=" + this.customType + ", customAttributes=" + this.customAttributes.toString() + ", metadata=[" + this.sessionEventMetadata + "]]");
    return this.stringRepresentation;
  }

  static enum Type
  {
    static
    {
      RESUME = new Type("RESUME", 2);
      SAVE_INSTANCE_STATE = new Type("SAVE_INSTANCE_STATE", 3);
      PAUSE = new Type("PAUSE", 4);
      STOP = new Type("STOP", 5);
      DESTROY = new Type("DESTROY", 6);
      ERROR = new Type("ERROR", 7);
      CRASH = new Type("CRASH", 8);
      INSTALL = new Type("INSTALL", 9);
      CUSTOM = new Type("CUSTOM", 10);
      Type[] arrayOfType = new Type[11];
      arrayOfType[0] = CREATE;
      arrayOfType[1] = START;
      arrayOfType[2] = RESUME;
      arrayOfType[3] = SAVE_INSTANCE_STATE;
      arrayOfType[4] = PAUSE;
      arrayOfType[5] = STOP;
      arrayOfType[6] = DESTROY;
      arrayOfType[7] = ERROR;
      arrayOfType[8] = CRASH;
      arrayOfType[9] = INSTALL;
      arrayOfType[10] = CUSTOM;
    }
  }
}