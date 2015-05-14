package com.google.android.gms.common.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class zzw
{
  public static boolean equal(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)));
  }

  public static int hashCode(Object[] paramArrayOfObject)
  {
    return Arrays.hashCode(paramArrayOfObject);
  }

  public static zza zzk(Object paramObject)
  {
    return new zza(paramObject, null);
  }

  public static final class zza
  {
    private final List<String> zzQr;
    private final Object zzzF;

    private zza(Object paramObject)
    {
      this.zzzF = zzx.zzl(paramObject);
      this.zzQr = new ArrayList();
    }

    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder(100).append(this.zzzF.getClass().getSimpleName()).append('{');
      int i = this.zzQr.size();
      for (int j = 0; j < i; j++)
      {
        localStringBuilder.append((String)this.zzQr.get(j));
        if (j < i - 1)
          localStringBuilder.append(", ");
      }
      return '}';
    }

    public zza zza(String paramString, Object paramObject)
    {
      this.zzQr.add((String)zzx.zzl(paramString) + "=" + String.valueOf(paramObject));
      return this;
    }
  }
}