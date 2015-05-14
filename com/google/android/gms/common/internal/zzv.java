package com.google.android.gms.common.internal;

import java.util.Iterator;

public class zzv
{
  private final String separator;

  private zzv(String paramString)
  {
    this.separator = paramString;
  }

  public static zzv zzbm(String paramString)
  {
    return new zzv(paramString);
  }

  public final String zza(Iterable<?> paramIterable)
  {
    return zza(new StringBuilder(), paramIterable).toString();
  }

  public final StringBuilder zza(StringBuilder paramStringBuilder, Iterable<?> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    if (localIterator.hasNext())
    {
      paramStringBuilder.append(zzj(localIterator.next()));
      while (localIterator.hasNext())
      {
        paramStringBuilder.append(this.separator);
        paramStringBuilder.append(zzj(localIterator.next()));
      }
    }
    return paramStringBuilder;
  }

  CharSequence zzj(Object paramObject)
  {
    if ((paramObject instanceof CharSequence))
      return (CharSequence)paramObject;
    return paramObject.toString();
  }
}