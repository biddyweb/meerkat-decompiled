package com.google.android.gms.internal;

public abstract class zzki<T>
{
  private static zza zzNG = null;
  private static int zzNH = 0;
  private static final Object zzmz = new Object();
  private T zzNI = null;
  protected final String zzqd;
  protected final T zzqe;

  protected zzki(String paramString, T paramT)
  {
    this.zzqd = paramString;
    this.zzqe = paramT;
  }

  public static boolean isInitialized()
  {
    return zzNG != null;
  }

  public static zzki<Integer> zza(String paramString, Integer paramInteger)
  {
    return new zzki(paramString, paramInteger)
    {
      protected Integer zzaY(String paramAnonymousString)
      {
        return zzki.zzit().zzb(this.zzqd, (Integer)this.zzqe);
      }
    };
  }

  public static zzki<Long> zza(String paramString, Long paramLong)
  {
    return new zzki(paramString, paramLong)
    {
      protected Long zzaX(String paramAnonymousString)
      {
        return zzki.zzit().getLong(this.zzqd, (Long)this.zzqe);
      }
    };
  }

  public static zzki<Boolean> zzg(String paramString, boolean paramBoolean)
  {
    return new zzki(paramString, Boolean.valueOf(paramBoolean))
    {
      protected Boolean zzaW(String paramAnonymousString)
      {
        return zzki.zzit().zzb(this.zzqd, (Boolean)this.zzqe);
      }
    };
  }

  public static int zzis()
  {
    return zzNH;
  }

  public static zzki<String> zzp(String paramString1, String paramString2)
  {
    return new zzki(paramString1, paramString2)
    {
      protected String zzaZ(String paramAnonymousString)
      {
        return zzki.zzit().getString(this.zzqd, (String)this.zzqe);
      }
    };
  }

  public final T get()
  {
    if (this.zzNI != null)
      return this.zzNI;
    return zzaV(this.zzqd);
  }

  protected abstract T zzaV(String paramString);

  private static abstract interface zza
  {
    public abstract Long getLong(String paramString, Long paramLong);

    public abstract String getString(String paramString1, String paramString2);

    public abstract Boolean zzb(String paramString, Boolean paramBoolean);

    public abstract Integer zzb(String paramString, Integer paramInteger);
  }
}