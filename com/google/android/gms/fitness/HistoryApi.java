package com.google.android.gms.fitness;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.zzc;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.DataSet;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.request.DataDeleteRequest;
import com.google.android.gms.fitness.request.DataReadRequest;
import com.google.android.gms.fitness.result.DataReadResult;
import java.util.concurrent.TimeUnit;

public abstract interface HistoryApi
{
  public abstract PendingResult<Status> deleteData(GoogleApiClient paramGoogleApiClient, DataDeleteRequest paramDataDeleteRequest);

  public abstract PendingResult<Status> insertData(GoogleApiClient paramGoogleApiClient, DataSet paramDataSet);

  public abstract PendingResult<DataReadResult> readData(GoogleApiClient paramGoogleApiClient, DataReadRequest paramDataReadRequest);

  public static class ViewIntentBuilder
  {
    private final Context mContext;
    private long zzON;
    private final DataType zzYo;
    private DataSource zzYp;
    private long zzYq;
    private String zzYr;

    public ViewIntentBuilder(Context paramContext, DataType paramDataType)
    {
      this.mContext = paramContext;
      this.zzYo = paramDataType;
    }

    private Intent zzi(Intent paramIntent)
    {
      if (this.zzYr == null);
      Intent localIntent;
      ResolveInfo localResolveInfo;
      do
      {
        return paramIntent;
        localIntent = new Intent(paramIntent).setPackage(this.zzYr);
        localResolveInfo = this.mContext.getPackageManager().resolveActivity(localIntent, 0);
      }
      while (localResolveInfo == null);
      String str = localResolveInfo.activityInfo.name;
      localIntent.setComponent(new ComponentName(this.zzYr, str));
      return localIntent;
    }

    public Intent build()
    {
      boolean bool1 = true;
      boolean bool2;
      if (this.zzON > 0L)
      {
        bool2 = bool1;
        zzx.zza(bool2, "Start time must be set");
        if (this.zzYq <= this.zzON)
          break label105;
      }
      while (true)
      {
        zzx.zza(bool1, "End time must be set and after start time");
        Intent localIntent = new Intent("vnd.google.fitness.VIEW");
        localIntent.setType(DataType.getMimeType(this.zzYp.getDataType()));
        localIntent.putExtra("vnd.google.fitness.start_time", this.zzON);
        localIntent.putExtra("vnd.google.fitness.end_time", this.zzYq);
        zzc.zza(this.zzYp, localIntent, "vnd.google.fitness.data_source");
        return zzi(localIntent);
        bool2 = false;
        break;
        label105: bool1 = false;
      }
    }

    public ViewIntentBuilder setDataSource(DataSource paramDataSource)
    {
      boolean bool = paramDataSource.getDataType().equals(this.zzYo);
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = paramDataSource;
      arrayOfObject[1] = this.zzYo;
      zzx.zzb(bool, "Data source %s is not for the data type %s", arrayOfObject);
      this.zzYp = paramDataSource;
      return this;
    }

    public ViewIntentBuilder setPreferredApplication(String paramString)
    {
      this.zzYr = paramString;
      return this;
    }

    public ViewIntentBuilder setTimeInterval(long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
    {
      this.zzON = paramTimeUnit.toMillis(paramLong1);
      this.zzYq = paramTimeUnit.toMillis(paramLong2);
      return this;
    }
  }
}