package com.google.android.gms.drive;

import android.os.Bundle;
import com.google.android.gms.common.data.AbstractDataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.internal.zzm;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.drive.metadata.internal.zze;
import com.google.android.gms.internal.zzmi;
import java.util.Collection;
import java.util.Iterator;

public final class MetadataBuffer extends AbstractDataBuffer<Metadata>
{
  private zza zzSt;

  public MetadataBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
    paramDataHolder.zziu().setClassLoader(MetadataBuffer.class.getClassLoader());
  }

  public Metadata get(int paramInt)
  {
    zza localzza = this.zzSt;
    if ((localzza == null) || (zza.zza(localzza) != paramInt))
    {
      localzza = new zza(this.zzMd, paramInt);
      this.zzSt = localzza;
    }
    return localzza;
  }

  @Deprecated
  public String getNextPageToken()
  {
    return null;
  }

  private static class zza extends Metadata
  {
    private final DataHolder zzMd;
    private final int zzNR;
    private final int zzSu;

    public zza(DataHolder paramDataHolder, int paramInt)
    {
      this.zzMd = paramDataHolder;
      this.zzSu = paramInt;
      this.zzNR = paramDataHolder.zzax(paramInt);
    }

    public boolean isDataValid()
    {
      return !this.zzMd.isClosed();
    }

    public <T> T zza(MetadataField<T> paramMetadataField)
    {
      return paramMetadataField.zza(this.zzMd, this.zzSu, this.zzNR);
    }

    public Metadata zzkw()
    {
      MetadataBundle localMetadataBundle = MetadataBundle.zzkZ();
      Iterator localIterator = zze.zzkY().iterator();
      while (localIterator.hasNext())
      {
        MetadataField localMetadataField = (MetadataField)localIterator.next();
        if (localMetadataField != zzmi.zzVU)
          localMetadataField.zza(this.zzMd, localMetadataBundle, this.zzSu, this.zzNR);
      }
      return new zzm(localMetadataBundle);
    }
  }
}