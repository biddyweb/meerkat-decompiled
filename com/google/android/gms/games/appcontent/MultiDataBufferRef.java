package com.google.android.gms.games.appcontent;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import java.util.ArrayList;

public abstract class MultiDataBufferRef extends zzd
{
  protected final ArrayList<DataHolder> zzadC;

  protected MultiDataBufferRef(ArrayList<DataHolder> paramArrayList, int paramInt1, int paramInt2)
  {
    super((DataHolder)paramArrayList.get(paramInt1), paramInt2);
    this.zzadC = paramArrayList;
  }
}