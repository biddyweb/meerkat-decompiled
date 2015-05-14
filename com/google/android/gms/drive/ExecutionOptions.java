package com.google.android.gms.drive;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.drive.internal.zzr;

public final class ExecutionOptions
{
  public static final int CONFLICT_STRATEGY_KEEP_REMOTE = 1;
  public static final int CONFLICT_STRATEGY_OVERWRITE_REMOTE = 0;
  public static final int MAX_TRACKING_TAG_STRING_LENGTH = 65536;
  private final String zzSq;
  private final boolean zzSr;
  private final int zzSs;

  public ExecutionOptions(String paramString, boolean paramBoolean, int paramInt)
  {
    this.zzSq = paramString;
    this.zzSr = paramBoolean;
    this.zzSs = paramInt;
  }

  public static void zza(GoogleApiClient paramGoogleApiClient, ExecutionOptions paramExecutionOptions)
  {
    zzr localzzr = (zzr)paramGoogleApiClient.zza(Drive.zzGR);
    if ((paramExecutionOptions.zzku()) && (!localzzr.zzkI()))
      throw new IllegalStateException("Application must define an exported DriveEventService subclass in AndroidManifest.xml to be notified on completion");
  }

  public static boolean zzbl(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return false;
    case 1:
    }
    return true;
  }

  public static boolean zzbm(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return false;
    case 0:
    case 1:
    }
    return true;
  }

  public static boolean zzbv(String paramString)
  {
    return (paramString != null) && (!paramString.isEmpty()) && (paramString.length() <= 65536);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if ((paramObject == null) || (paramObject.getClass() != getClass()))
      bool = false;
    ExecutionOptions localExecutionOptions;
    do
    {
      do
        return bool;
      while (paramObject == this);
      localExecutionOptions = (ExecutionOptions)paramObject;
    }
    while ((zzw.equal(this.zzSq, localExecutionOptions.zzSq)) && (this.zzSs == localExecutionOptions.zzSs) && (this.zzSr == localExecutionOptions.zzSr));
    return false;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzSq;
    arrayOfObject[1] = Integer.valueOf(this.zzSs);
    arrayOfObject[2] = Boolean.valueOf(this.zzSr);
    return zzw.hashCode(arrayOfObject);
  }

  public String zzkt()
  {
    return this.zzSq;
  }

  public boolean zzku()
  {
    return this.zzSr;
  }

  public int zzkv()
  {
    return this.zzSs;
  }

  public static final class Builder
  {
    private String zzSq;
    private boolean zzSr;
    private int zzSs = 0;

    public ExecutionOptions build()
    {
      if ((this.zzSs == 1) && (!this.zzSr))
        throw new IllegalStateException("Cannot use CONFLICT_STRATEGY_KEEP_REMOTE without requesting completion notifications");
      return new ExecutionOptions(this.zzSq, this.zzSr, this.zzSs);
    }

    public Builder setConflictStrategy(int paramInt)
    {
      if (!ExecutionOptions.zzbm(paramInt))
        throw new IllegalArgumentException("Unrecognized value for conflict strategy: " + paramInt);
      this.zzSs = paramInt;
      return this;
    }

    public Builder setNotifyOnCompletion(boolean paramBoolean)
    {
      this.zzSr = paramBoolean;
      return this;
    }

    public Builder setTrackingTag(String paramString)
    {
      if (!ExecutionOptions.zzbv(paramString))
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(65536);
        throw new IllegalArgumentException(String.format("trackingTag must not be null nor empty, and the length must be <= the maximum length (%s)", arrayOfObject));
      }
      this.zzSq = paramString;
      return this;
    }
  }
}