package com.google.android.gms.plus.model.people;

import android.os.Bundle;
import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zze;
import com.google.android.gms.internal.zztw;
import com.google.android.gms.internal.zzuh;

public final class PersonBuffer extends AbstractDataBuffer<Person>
{
  private final zze<zztw> zzawE;

  public PersonBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
    if ((paramDataHolder.zziu() != null) && (paramDataHolder.zziu().getBoolean("com.google.android.gms.plus.IsSafeParcelable", false)))
    {
      this.zzawE = new zze(paramDataHolder, zztw.CREATOR);
      return;
    }
    this.zzawE = null;
  }

  public Person get(int paramInt)
  {
    if (this.zzawE != null)
      return (Person)this.zzawE.zzaw(paramInt);
    return new zzuh(this.zzMd, paramInt);
  }
}