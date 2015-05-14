package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.zzj;
import java.util.Arrays;

public class zzml extends zzj<DriveId>
{
  public static final zzml zzWj = new zzml();

  private zzml()
  {
    super("driveId", Arrays.asList(new String[] { "sqlId", "resourceId" }), Arrays.asList(new String[] { "dbInstanceId" }), 4100000);
  }

  protected DriveId zzm(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    long l = paramDataHolder.zziu().getLong("dbInstanceId");
    if ("application/vnd.google-apps.folder".equals(paramDataHolder.zzc(zzmi.zzVM.getName(), paramInt1, paramInt2)));
    for (int i = 1; ; i = 0)
    {
      String str = paramDataHolder.zzc("resourceId", paramInt1, paramInt2);
      if ((str != null) && (str.startsWith("generated-android-")))
        str = null;
      return new DriveId(str, Long.valueOf(paramDataHolder.zza("sqlId", paramInt1, paramInt2)).longValue(), l, i);
    }
  }
}