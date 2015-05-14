package com.google.android.gms.internal;

import android.os.Bundle;
import android.util.SparseArray;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.internal.AppVisibleCustomProperties;
import com.google.android.gms.drive.metadata.internal.zzj;
import java.util.Arrays;
import java.util.Collections;

public class zzmj extends zzj<AppVisibleCustomProperties>
{
  public zzmj(int paramInt)
  {
    super("customProperties", Collections.singleton("customProperties"), Arrays.asList(new String[] { "customPropertiesExtra" }), paramInt);
  }

  protected AppVisibleCustomProperties zzl(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    return (AppVisibleCustomProperties)paramDataHolder.zziu().getSparseParcelableArray("customPropertiesExtra").get(paramInt1, AppVisibleCustomProperties.zzVl);
  }
}