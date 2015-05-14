package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;

public final class zztv extends zzd
  implements Moment
{
  private zztt zzavU;

  public zztv(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
  }

  private zztt zzse()
  {
    try
    {
      if (this.zzavU == null)
      {
        byte[] arrayOfByte = getByteArray("momentImpl");
        Parcel localParcel = Parcel.obtain();
        localParcel.unmarshall(arrayOfByte, 0, arrayOfByte.length);
        localParcel.setDataPosition(0);
        this.zzavU = zztt.CREATOR.zzeA(localParcel);
        localParcel.recycle();
      }
      return this.zzavU;
    }
    finally
    {
    }
  }

  public String getId()
  {
    return zzse().getId();
  }

  public ItemScope getResult()
  {
    return zzse().getResult();
  }

  public String getStartDate()
  {
    return zzse().getStartDate();
  }

  public ItemScope getTarget()
  {
    return zzse().getTarget();
  }

  public String getType()
  {
    return zzse().getType();
  }

  public boolean hasId()
  {
    return zzse().hasId();
  }

  public boolean hasResult()
  {
    return zzse().hasResult();
  }

  public boolean hasStartDate()
  {
    return zzse().hasStartDate();
  }

  public boolean hasTarget()
  {
    return zzse().hasTarget();
  }

  public boolean hasType()
  {
    return zzse().hasType();
  }

  public zztt zzsd()
  {
    return zzse();
  }
}