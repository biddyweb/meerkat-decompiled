package com.google.android.gms.fitness.request;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.Field;
import com.google.android.gms.internal.zzni;
import com.google.android.gms.internal.zzni.zza;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DataTypeCreateRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<DataTypeCreateRequest> CREATOR = new zzk();
  private final String mName;
  private final int zzFG;
  private final String zzFO;
  private final List<Field> zzZd;
  private final zzni zzabi;

  DataTypeCreateRequest(int paramInt, String paramString1, List<Field> paramList, IBinder paramIBinder, String paramString2)
  {
    this.zzFG = paramInt;
    this.mName = paramString1;
    this.zzZd = Collections.unmodifiableList(paramList);
    if (paramIBinder == null);
    for (zzni localzzni = null; ; localzzni = zzni.zza.zzaF(paramIBinder))
    {
      this.zzabi = localzzni;
      this.zzFO = paramString2;
      return;
    }
  }

  private DataTypeCreateRequest(Builder paramBuilder)
  {
    this(Builder.zza(paramBuilder), Builder.zzb(paramBuilder), null, null);
  }

  public DataTypeCreateRequest(DataTypeCreateRequest paramDataTypeCreateRequest, zzni paramzzni, String paramString)
  {
    this(paramDataTypeCreateRequest.mName, paramDataTypeCreateRequest.zzZd, paramzzni, paramString);
  }

  public DataTypeCreateRequest(String paramString1, List<Field> paramList, zzni paramzzni, String paramString2)
  {
    this.zzFG = 2;
    this.mName = paramString1;
    this.zzZd = Collections.unmodifiableList(paramList);
    this.zzabi = paramzzni;
    this.zzFO = paramString2;
  }

  private boolean zzb(DataTypeCreateRequest paramDataTypeCreateRequest)
  {
    return (zzw.equal(this.mName, paramDataTypeCreateRequest.mName)) && (zzw.equal(this.zzZd, paramDataTypeCreateRequest.zzZd));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof DataTypeCreateRequest)) && (zzb((DataTypeCreateRequest)paramObject)));
  }

  public List<Field> getFields()
  {
    return this.zzZd;
  }

  public String getName()
  {
    return this.mName;
  }

  public String getPackageName()
  {
    return this.zzFO;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.mName;
    arrayOfObject[1] = this.zzZd;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("name", this.mName).zza("fields", this.zzZd).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzk.zza(this, paramParcel, paramInt);
  }

  public IBinder zzlQ()
  {
    if (this.zzabi == null)
      return null;
    return this.zzabi.asBinder();
  }

  public static class Builder
  {
    private String mName;
    private List<Field> zzZd = new ArrayList();

    public Builder addField(Field paramField)
    {
      if (!this.zzZd.contains(paramField))
        this.zzZd.add(paramField);
      return this;
    }

    public Builder addField(String paramString, int paramInt)
    {
      if ((paramString != null) && (!paramString.isEmpty()));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Invalid name specified");
        return addField(Field.zzn(paramString, paramInt));
      }
    }

    public DataTypeCreateRequest build()
    {
      boolean bool1 = true;
      boolean bool2;
      if (this.mName != null)
      {
        bool2 = bool1;
        zzx.zza(bool2, "Must set the name");
        if (this.zzZd.isEmpty())
          break label50;
      }
      while (true)
      {
        zzx.zza(bool1, "Must specify the data fields");
        return new DataTypeCreateRequest(this, null);
        bool2 = false;
        break;
        label50: bool1 = false;
      }
    }

    public Builder setName(String paramString)
    {
      this.mName = paramString;
      return this;
    }
  }
}