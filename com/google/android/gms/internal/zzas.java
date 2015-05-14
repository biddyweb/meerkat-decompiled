package com.google.android.gms.internal;

import java.util.PriorityQueue;

public class zzas
{
  static long zza(int paramInt1, int paramInt2, long paramLong1, long paramLong2, long paramLong3)
  {
    long l = paramLong2 * ((2147483647L + paramInt1) % 1073807359L) % 1073807359L;
    return (paramLong3 * ((paramLong1 + 1073807359L - l) % 1073807359L) % 1073807359L + (2147483647L + paramInt2) % 1073807359L) % 1073807359L;
  }

  static long zza(long paramLong, int paramInt)
  {
    if (paramInt == 0)
      paramLong = 1L;
    while (paramInt == 1)
      return paramLong;
    if (paramInt % 2 == 0)
      return zza(paramLong * paramLong % 1073807359L, paramInt / 2) % 1073807359L;
    return paramLong * (zza(paramLong * paramLong % 1073807359L, paramInt / 2) % 1073807359L) % 1073807359L;
  }

  static String zza(String[] paramArrayOfString, int paramInt1, int paramInt2)
  {
    if (paramArrayOfString.length < paramInt1 + paramInt2)
    {
      zzhx.zzZ("Unable to construct shingle");
      return "";
    }
    StringBuffer localStringBuffer = new StringBuffer();
    for (int i = paramInt1; i < -1 + (paramInt1 + paramInt2); i++)
    {
      localStringBuffer.append(paramArrayOfString[i]);
      localStringBuffer.append(' ');
    }
    localStringBuffer.append(paramArrayOfString[(-1 + (paramInt1 + paramInt2))]);
    return localStringBuffer.toString();
  }

  static void zza(int paramInt, long paramLong, String paramString, PriorityQueue<zza> paramPriorityQueue)
  {
    zza localzza = new zza(paramLong, paramString);
    if ((paramPriorityQueue.size() == paramInt) && (((zza)paramPriorityQueue.peek()).value > localzza.value));
    do
    {
      do
        return;
      while (paramPriorityQueue.contains(localzza));
      paramPriorityQueue.add(localzza);
    }
    while (paramPriorityQueue.size() <= paramInt);
    paramPriorityQueue.poll();
  }

  public static void zza(String[] paramArrayOfString, int paramInt1, int paramInt2, PriorityQueue<zza> paramPriorityQueue)
  {
    long l1 = zzb(paramArrayOfString, 0, paramInt2);
    zza(paramInt1, l1, zza(paramArrayOfString, 0, paramInt2), paramPriorityQueue);
    long l2 = zza(16785407L, paramInt2 - 1);
    for (int i = 1; i < 1 + (paramArrayOfString.length - paramInt2); i++)
    {
      l1 = zza(zzaq.zzo(paramArrayOfString[(i - 1)]), zzaq.zzo(paramArrayOfString[(-1 + (i + paramInt2))]), l1, l2, 16785407L);
      zza(paramInt1, l1, zza(paramArrayOfString, i, paramInt2), paramPriorityQueue);
    }
  }

  private static long zzb(String[] paramArrayOfString, int paramInt1, int paramInt2)
  {
    long l = (2147483647L + zzaq.zzo(paramArrayOfString[paramInt1])) % 1073807359L;
    for (int i = paramInt1 + 1; i < paramInt1 + paramInt2; i++)
      l = (l * 16785407L % 1073807359L + (2147483647L + zzaq.zzo(paramArrayOfString[i])) % 1073807359L) % 1073807359L;
    return l;
  }

  public static class zza
  {
    final long value;
    final String zzoI;

    zza(long paramLong, String paramString)
    {
      this.value = paramLong;
      this.zzoI = paramString;
    }

    public boolean equals(Object paramObject)
    {
      if ((paramObject == null) || (!(paramObject instanceof zza)));
      while (((zza)paramObject).value != this.value)
        return false;
      return true;
    }

    public int hashCode()
    {
      return (int)this.value;
    }
  }
}