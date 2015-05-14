package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public abstract class zzld
{
  private void zza(StringBuilder paramStringBuilder, zza paramzza, Object paramObject)
  {
    if (paramzza.zzjx() == 11)
    {
      paramStringBuilder.append(((zzld)paramzza.zzjH().cast(paramObject)).toString());
      return;
    }
    if (paramzza.zzjx() == 7)
    {
      paramStringBuilder.append("\"");
      paramStringBuilder.append(zzma.zzbt((String)paramObject));
      paramStringBuilder.append("\"");
      return;
    }
    paramStringBuilder.append(paramObject);
  }

  private void zza(StringBuilder paramStringBuilder, zza paramzza, ArrayList<Object> paramArrayList)
  {
    paramStringBuilder.append("[");
    int i = 0;
    int j = paramArrayList.size();
    while (i < j)
    {
      if (i > 0)
        paramStringBuilder.append(",");
      Object localObject = paramArrayList.get(i);
      if (localObject != null)
        zza(paramStringBuilder, paramzza, localObject);
      i++;
    }
    paramStringBuilder.append("]");
  }

  public String toString()
  {
    Map localMap = zzjz();
    StringBuilder localStringBuilder = new StringBuilder(100);
    Iterator localIterator = localMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      zza localzza = (zza)localMap.get(str);
      if (zza(localzza))
      {
        Object localObject = zza(localzza, zzb(localzza));
        if (localStringBuilder.length() == 0)
          localStringBuilder.append("{");
        while (true)
        {
          localStringBuilder.append("\"").append(str).append("\":");
          if (localObject != null)
            break label139;
          localStringBuilder.append("null");
          break;
          localStringBuilder.append(",");
        }
        label139: switch (localzza.zzjy())
        {
        default:
          if (localzza.zzjD())
            zza(localStringBuilder, localzza, (ArrayList)localObject);
          break;
        case 8:
          localStringBuilder.append("\"").append(zzlt.zze((byte[])localObject)).append("\"");
          break;
        case 9:
          localStringBuilder.append("\"").append(zzlt.zzf((byte[])localObject)).append("\"");
          break;
        case 10:
          zzmb.zza(localStringBuilder, (HashMap)localObject);
          continue;
          zza(localStringBuilder, localzza, localObject);
        }
      }
    }
    if (localStringBuilder.length() > 0)
      localStringBuilder.append("}");
    while (true)
    {
      return localStringBuilder.toString();
      localStringBuilder.append("{}");
    }
  }

  protected <O, I> I zza(zza<I, O> paramzza, Object paramObject)
  {
    if (zza.zzc(paramzza) != null)
      paramObject = paramzza.convertBack(paramObject);
    return paramObject;
  }

  protected boolean zza(zza paramzza)
  {
    if (paramzza.zzjy() == 11)
    {
      if (paramzza.zzjE())
        return zzbr(paramzza.zzjF());
      return zzbq(paramzza.zzjF());
    }
    return zzbp(paramzza.zzjF());
  }

  protected Object zzb(zza paramzza)
  {
    String str1 = paramzza.zzjF();
    if (paramzza.zzjH() != null)
    {
      boolean bool;
      if (zzbo(paramzza.zzjF()) == null)
      {
        bool = true;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = paramzza.zzjF();
        zzx.zza(bool, "Concrete field shouldn't be value object: %s", arrayOfObject);
        if (!paramzza.zzjE())
          break label79;
      }
      label79: for (HashMap localHashMap = zzjB(); ; localHashMap = zzjA())
      {
        if (localHashMap == null)
          break label88;
        return localHashMap.get(str1);
        bool = false;
        break;
      }
      try
      {
        label88: String str2 = "get" + Character.toUpperCase(str1.charAt(0)) + str1.substring(1);
        Object localObject = getClass().getMethod(str2, new Class[0]).invoke(this, new Object[0]);
        return localObject;
      }
      catch (Exception localException)
      {
        throw new RuntimeException(localException);
      }
    }
    return zzbo(paramzza.zzjF());
  }

  protected abstract Object zzbo(String paramString);

  protected abstract boolean zzbp(String paramString);

  protected boolean zzbq(String paramString)
  {
    throw new UnsupportedOperationException("Concrete types not supported");
  }

  protected boolean zzbr(String paramString)
  {
    throw new UnsupportedOperationException("Concrete type arrays not supported");
  }

  public HashMap<String, Object> zzjA()
  {
    return null;
  }

  public HashMap<String, Object> zzjB()
  {
    return null;
  }

  public abstract Map<String, zza<?, ?>> zzjz();

  public static class zza<I, O>
    implements SafeParcelable
  {
    public static final zzlf CREATOR = new zzlf();
    private final int zzFG;
    protected final int zzQP;
    protected final boolean zzQQ;
    protected final int zzQR;
    protected final boolean zzQS;
    protected final String zzQT;
    protected final int zzQU;
    protected final Class<? extends zzld> zzQV;
    protected final String zzQW;
    private zzlh zzQX;
    private zzld.zzb<I, O> zzQY;

    zza(int paramInt1, int paramInt2, boolean paramBoolean1, int paramInt3, boolean paramBoolean2, String paramString1, int paramInt4, String paramString2, zzky paramzzky)
    {
      this.zzFG = paramInt1;
      this.zzQP = paramInt2;
      this.zzQQ = paramBoolean1;
      this.zzQR = paramInt3;
      this.zzQS = paramBoolean2;
      this.zzQT = paramString1;
      this.zzQU = paramInt4;
      if (paramString2 == null)
        this.zzQV = null;
      for (this.zzQW = null; paramzzky == null; this.zzQW = paramString2)
      {
        this.zzQY = null;
        return;
        this.zzQV = zzlk.class;
      }
      this.zzQY = paramzzky.zzjv();
    }

    protected zza(int paramInt1, boolean paramBoolean1, int paramInt2, boolean paramBoolean2, String paramString, int paramInt3, Class<? extends zzld> paramClass, zzld.zzb<I, O> paramzzb)
    {
      this.zzFG = 1;
      this.zzQP = paramInt1;
      this.zzQQ = paramBoolean1;
      this.zzQR = paramInt2;
      this.zzQS = paramBoolean2;
      this.zzQT = paramString;
      this.zzQU = paramInt3;
      this.zzQV = paramClass;
      if (paramClass == null);
      for (this.zzQW = null; ; this.zzQW = paramClass.getCanonicalName())
      {
        this.zzQY = paramzzb;
        return;
      }
    }

    public static zza zza(String paramString, int paramInt, zzld.zzb<?, ?> paramzzb, boolean paramBoolean)
    {
      return new zza(paramzzb.zzjx(), paramBoolean, paramzzb.zzjy(), false, paramString, paramInt, null, paramzzb);
    }

    public static <T extends zzld> zza<T, T> zza(String paramString, int paramInt, Class<T> paramClass)
    {
      return new zza(11, false, 11, false, paramString, paramInt, paramClass, null);
    }

    public static <T extends zzld> zza<ArrayList<T>, ArrayList<T>> zzb(String paramString, int paramInt, Class<T> paramClass)
    {
      return new zza(11, true, 11, true, paramString, paramInt, paramClass, null);
    }

    public static zza<Integer, Integer> zzi(String paramString, int paramInt)
    {
      return new zza(0, false, 0, false, paramString, paramInt, null, null);
    }

    public static zza<Double, Double> zzj(String paramString, int paramInt)
    {
      return new zza(4, false, 4, false, paramString, paramInt, null, null);
    }

    public static zza<Boolean, Boolean> zzk(String paramString, int paramInt)
    {
      return new zza(6, false, 6, false, paramString, paramInt, null, null);
    }

    public static zza<String, String> zzl(String paramString, int paramInt)
    {
      return new zza(7, false, 7, false, paramString, paramInt, null, null);
    }

    public static zza<ArrayList<String>, ArrayList<String>> zzm(String paramString, int paramInt)
    {
      return new zza(7, true, 7, true, paramString, paramInt, null, null);
    }

    public I convertBack(O paramO)
    {
      return this.zzQY.convertBack(paramO);
    }

    public int describeContents()
    {
      return 0;
    }

    public int getVersionCode()
    {
      return this.zzFG;
    }

    public String toString()
    {
      StringBuilder localStringBuilder1 = new StringBuilder();
      localStringBuilder1.append("Field\n");
      localStringBuilder1.append("            versionCode=").append(this.zzFG).append('\n');
      localStringBuilder1.append("                 typeIn=").append(this.zzQP).append('\n');
      localStringBuilder1.append("            typeInArray=").append(this.zzQQ).append('\n');
      localStringBuilder1.append("                typeOut=").append(this.zzQR).append('\n');
      localStringBuilder1.append("           typeOutArray=").append(this.zzQS).append('\n');
      localStringBuilder1.append("        outputFieldName=").append(this.zzQT).append('\n');
      localStringBuilder1.append("      safeParcelFieldId=").append(this.zzQU).append('\n');
      localStringBuilder1.append("       concreteTypeName=").append(zzjI()).append('\n');
      if (zzjH() != null)
        localStringBuilder1.append("     concreteType.class=").append(zzjH().getCanonicalName()).append('\n');
      StringBuilder localStringBuilder2 = localStringBuilder1.append("          converterName=");
      if (this.zzQY == null);
      for (String str = "null"; ; str = this.zzQY.getClass().getCanonicalName())
      {
        localStringBuilder2.append(str).append('\n');
        return localStringBuilder1.toString();
      }
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzlf.zza(this, paramParcel, paramInt);
    }

    public void zza(zzlh paramzzlh)
    {
      this.zzQX = paramzzlh;
    }

    public zza<I, O> zzjC()
    {
      return new zza(this.zzFG, this.zzQP, this.zzQQ, this.zzQR, this.zzQS, this.zzQT, this.zzQU, this.zzQW, zzjK());
    }

    public boolean zzjD()
    {
      return this.zzQQ;
    }

    public boolean zzjE()
    {
      return this.zzQS;
    }

    public String zzjF()
    {
      return this.zzQT;
    }

    public int zzjG()
    {
      return this.zzQU;
    }

    public Class<? extends zzld> zzjH()
    {
      return this.zzQV;
    }

    String zzjI()
    {
      if (this.zzQW == null)
        return null;
      return this.zzQW;
    }

    public boolean zzjJ()
    {
      return this.zzQY != null;
    }

    zzky zzjK()
    {
      if (this.zzQY == null)
        return null;
      return zzky.zza(this.zzQY);
    }

    public Map<String, zza<?, ?>> zzjL()
    {
      zzx.zzl(this.zzQW);
      zzx.zzl(this.zzQX);
      return this.zzQX.zzbs(this.zzQW);
    }

    public int zzjx()
    {
      return this.zzQP;
    }

    public int zzjy()
    {
      return this.zzQR;
    }
  }

  public static abstract interface zzb<I, O>
  {
    public abstract I convertBack(O paramO);

    public abstract int zzjx();

    public abstract int zzjy();
  }
}