package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.Value;

public class zzmx
{
  public static Value zza(zzxc.zzd paramzzd, zzxc.zzf paramzzf)
  {
    if (paramzzf == null)
      return null;
    Value localValue = new Value(paramzzd.zzaIh.intValue());
    if (paramzzf.zzaIp != null)
      if (paramzzd.zzaIh.intValue() == 2)
      {
        bool2 = true;
        arrayOfObject2 = new Object[2];
        arrayOfObject2[0] = paramzzd.zzaIh;
        arrayOfObject2[1] = paramzzf.zzaIp;
        zzx.zzb(bool2, "Field format %d does not match stored value %s", arrayOfObject2);
        localValue.setFloat(paramzzf.zzaIp.floatValue());
      }
    while (paramzzf.zzaIo == null)
      while (true)
      {
        Object[] arrayOfObject2;
        return localValue;
        boolean bool2 = false;
      }
    if (paramzzd.zzaIh.intValue() == 1);
    for (boolean bool1 = true; ; bool1 = false)
    {
      Object[] arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = paramzzd.zzaIh;
      arrayOfObject1[1] = paramzzf.zzaIo;
      zzx.zzb(bool1, "Field format %d does not match stored value %s", arrayOfObject1);
      localValue.setInt(paramzzf.zzaIo.intValue());
      break;
    }
  }

  public static Value[] zza(zzxc.zzd[] paramArrayOfzzd, zzxc.zzf[] paramArrayOfzzf)
  {
    Value[] arrayOfValue = new Value[paramArrayOfzzf.length];
    int i = Math.min(paramArrayOfzzd.length, paramArrayOfzzf.length);
    for (int j = 0; j < i; j++)
      arrayOfValue[j] = zza(paramArrayOfzzd[j], paramArrayOfzzf[j]);
    return arrayOfValue;
  }

  public static zzxc.zzf[] zza(Value[] paramArrayOfValue)
  {
    zzxc.zzf[] arrayOfzzf = new zzxc.zzf[paramArrayOfValue.length];
    for (int i = 0; i < paramArrayOfValue.length; i++)
      arrayOfzzf[i] = zzb(paramArrayOfValue[i]);
    return arrayOfzzf;
  }

  public static zzxc.zzf zzb(Value paramValue)
  {
    zzxc.zzf localzzf = new zzxc.zzf();
    if ((paramValue == null) || (!paramValue.isSet()))
      return localzzf;
    if (2 == paramValue.getFormat())
    {
      localzzf.zzaIp = Double.valueOf(paramValue.asFloat());
      return localzzf;
    }
    if (1 == paramValue.getFormat())
    {
      localzzf.zzaIo = Integer.valueOf(paramValue.asInt());
      return localzzf;
    }
    throw new IllegalArgumentException("unknown type: " + paramValue.getFormat() + " in: " + paramValue);
  }
}