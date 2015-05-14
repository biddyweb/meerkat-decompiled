package com.google.android.gms.internal;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class zzwt<M extends zzws<M>, T>
{
  public final int tag;
  protected final int type;
  protected final Class<T> zzaHC;
  protected final boolean zzaHD;

  private zzwt(int paramInt1, Class<T> paramClass, int paramInt2, boolean paramBoolean)
  {
    this.type = paramInt1;
    this.zzaHC = paramClass;
    this.tag = paramInt2;
    this.zzaHD = paramBoolean;
  }

  @Deprecated
  public static <M extends zzws<M>, T extends zzwy> zzwt<M, T> zza(int paramInt1, Class<T> paramClass, int paramInt2)
  {
    return new zzwt(paramInt1, paramClass, paramInt2, false);
  }

  private T zzy(List<zzxa> paramList)
  {
    int i = 0;
    ArrayList localArrayList = new ArrayList();
    for (int j = 0; j < paramList.size(); j++)
    {
      zzxa localzzxa = (zzxa)paramList.get(j);
      if (localzzxa.zzaHN.length != 0)
        zza(localzzxa, localArrayList);
    }
    int k = localArrayList.size();
    Object localObject;
    if (k == 0)
      localObject = null;
    while (true)
    {
      return localObject;
      localObject = this.zzaHC.cast(Array.newInstance(this.zzaHC.getComponentType(), k));
      while (i < k)
      {
        Array.set(localObject, i, localArrayList.get(i));
        i++;
      }
    }
  }

  private T zzz(List<zzxa> paramList)
  {
    if (paramList.isEmpty())
      return null;
    zzxa localzzxa = (zzxa)paramList.get(-1 + paramList.size());
    return this.zzaHC.cast(zzz(zzwq.zzt(localzzxa.zzaHN)));
  }

  int zzF(Object paramObject)
  {
    if (this.zzaHD)
      return zzG(paramObject);
    return zzH(paramObject);
  }

  protected int zzG(Object paramObject)
  {
    int i = 0;
    int j = Array.getLength(paramObject);
    for (int k = 0; k < j; k++)
      if (Array.get(paramObject, k) != null)
        i += zzH(Array.get(paramObject, k));
    return i;
  }

  protected int zzH(Object paramObject)
  {
    int i = zzxb.zziI(this.tag);
    switch (this.type)
    {
    default:
      throw new IllegalArgumentException("Unknown type " + this.type);
    case 10:
      return zzwr.zzb(i, (zzwy)paramObject);
    case 11:
    }
    return zzwr.zzc(i, (zzwy)paramObject);
  }

  protected void zza(zzxa paramzzxa, List<Object> paramList)
  {
    paramList.add(zzz(zzwq.zzt(paramzzxa.zzaHN)));
  }

  void zza(Object paramObject, zzwr paramzzwr)
    throws IOException
  {
    if (this.zzaHD)
    {
      zzc(paramObject, paramzzwr);
      return;
    }
    zzb(paramObject, paramzzwr);
  }

  protected void zzb(Object paramObject, zzwr paramzzwr)
  {
    try
    {
      paramzzwr.zziA(this.tag);
      switch (this.type)
      {
      default:
        throw new IllegalArgumentException("Unknown type " + this.type);
      case 10:
      case 11:
      }
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
    zzwy localzzwy = (zzwy)paramObject;
    int i = zzxb.zziI(this.tag);
    paramzzwr.zzb(localzzwy);
    paramzzwr.zzC(i, 4);
    return;
    paramzzwr.zzc((zzwy)paramObject);
  }

  protected void zzc(Object paramObject, zzwr paramzzwr)
  {
    int i = Array.getLength(paramObject);
    for (int j = 0; j < i; j++)
    {
      Object localObject = Array.get(paramObject, j);
      if (localObject != null)
        zzb(localObject, paramzzwr);
    }
  }

  final T zzx(List<zzxa> paramList)
  {
    if (paramList == null)
      return null;
    if (this.zzaHD)
      return zzy(paramList);
    return zzz(paramList);
  }

  protected Object zzz(zzwq paramzzwq)
  {
    Class localClass;
    if (this.zzaHD)
      localClass = this.zzaHC.getComponentType();
    try
    {
      switch (this.type)
      {
      default:
        throw new IllegalArgumentException("Unknown type " + this.type);
      case 10:
      case 11:
      }
    }
    catch (InstantiationException localInstantiationException)
    {
      while (true)
      {
        throw new IllegalArgumentException("Error creating instance of class " + localClass, localInstantiationException);
        localClass = this.zzaHC;
      }
      zzwy localzzwy2 = (zzwy)localClass.newInstance();
      paramzzwq.zza(localzzwy2, zzxb.zziI(this.tag));
      return localzzwy2;
      zzwy localzzwy1 = (zzwy)localClass.newInstance();
      paramzzwq.zza(localzzwy1);
      return localzzwy1;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new IllegalArgumentException("Error creating instance of class " + localClass, localIllegalAccessException);
    }
    catch (IOException localIOException)
    {
      throw new IllegalArgumentException("Error reading extension field", localIOException);
    }
  }
}