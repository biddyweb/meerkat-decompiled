package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;

public class Subscription
  implements SafeParcelable
{
  public static final Parcelable.Creator<Subscription> CREATOR = new zzs();
  private final int zzFG;
  private final DataType zzYo;
  private final DataSource zzYp;
  private final long zzZQ;
  private final int zzZR;

  Subscription(int paramInt1, DataSource paramDataSource, DataType paramDataType, long paramLong, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzYp = paramDataSource;
    this.zzYo = paramDataType;
    this.zzZQ = paramLong;
    this.zzZR = paramInt2;
  }

  private Subscription(zza paramzza)
  {
    this.zzFG = 1;
    this.zzYo = zza.zza(paramzza);
    this.zzYp = zza.zzb(paramzza);
    this.zzZQ = zza.zzc(paramzza);
    this.zzZR = zza.zzd(paramzza);
  }

  private boolean zza(Subscription paramSubscription)
  {
    return (zzw.equal(this.zzYp, paramSubscription.zzYp)) && (zzw.equal(this.zzYo, paramSubscription.zzYo)) && (this.zzZQ == paramSubscription.zzZQ) && (this.zzZR == paramSubscription.zzZR);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof Subscription)) && (zza((Subscription)paramObject)));
  }

  public int getAccuracyMode()
  {
    return this.zzZR;
  }

  public DataSource getDataSource()
  {
    return this.zzYp;
  }

  public DataType getDataType()
  {
    return this.zzYo;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.zzYp;
    arrayOfObject[1] = this.zzYp;
    arrayOfObject[2] = Long.valueOf(this.zzZQ);
    arrayOfObject[3] = Integer.valueOf(this.zzZR);
    return zzw.hashCode(arrayOfObject);
  }

  public String toDebugString()
  {
    Object[] arrayOfObject = new Object[1];
    if (this.zzYp == null);
    for (String str = this.zzYo.getName(); ; str = this.zzYp.toDebugString())
    {
      arrayOfObject[0] = str;
      return String.format("Subscription{%s}", arrayOfObject);
    }
  }

  public String toString()
  {
    return zzw.zzk(this).zza("dataSource", this.zzYp).zza("dataType", this.zzYo).zza("samplingIntervalMicros", Long.valueOf(this.zzZQ)).zza("accuracyMode", Integer.valueOf(this.zzZR)).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzs.zza(this, paramParcel, paramInt);
  }

  public long zzlI()
  {
    return this.zzZQ;
  }

  public DataType zzlJ()
  {
    if (this.zzYo == null)
      return this.zzYp.getDataType();
    return this.zzYo;
  }

  public static class zza
  {
    private DataType zzYo;
    private DataSource zzYp;
    private long zzZQ = -1L;
    private int zzZR = 2;

    public zza zzb(DataSource paramDataSource)
    {
      this.zzYp = paramDataSource;
      return this;
    }

    public zza zzb(DataType paramDataType)
    {
      this.zzYo = paramDataType;
      return this;
    }

    public Subscription zzlK()
    {
      if ((this.zzYp != null) || (this.zzYo != null));
      for (boolean bool1 = true; ; bool1 = false)
      {
        zzx.zza(bool1, "Must call setDataSource() or setDataType()");
        boolean bool2;
        if ((this.zzYo != null) && (this.zzYp != null))
        {
          boolean bool3 = this.zzYo.equals(this.zzYp.getDataType());
          bool2 = false;
          if (!bool3);
        }
        else
        {
          bool2 = true;
        }
        zzx.zza(bool2, "Specified data type is incompatible with specified data source");
        return new Subscription(this, null);
      }
    }
  }
}