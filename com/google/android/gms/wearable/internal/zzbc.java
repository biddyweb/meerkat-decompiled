package com.google.android.gms.wearable.internal;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.wearable.DataApi.DataItemResult;
import com.google.android.gms.wearable.DataApi.DeleteDataItemsResult;
import com.google.android.gms.wearable.DataApi.GetFdForAssetResult;
import com.google.android.gms.wearable.DataItemBuffer;
import com.google.android.gms.wearable.MessageApi.SendMessageResult;
import com.google.android.gms.wearable.NodeApi.GetConnectedNodesResult;
import com.google.android.gms.wearable.NodeApi.GetLocalNodeResult;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.FutureTask;

final class zzbc
{
  static abstract class zza<T> extends zza
  {
    private zza.zzb<T> zzGC;

    public zza(zza.zzb<T> paramzzb)
    {
      this.zzGC = paramzzb;
    }

    public void zzE(T paramT)
    {
      zza.zzb localzzb = this.zzGC;
      if (localzzb != null)
      {
        localzzb.zzd(paramT);
        this.zzGC = null;
      }
    }
  }

  static final class zzb extends zzbc.zza<DataApi.DeleteDataItemsResult>
  {
    public zzb(zza.zzb<DataApi.DeleteDataItemsResult> paramzzb)
    {
      super();
    }

    public void zza(zzs paramzzs)
    {
      zzE(new zzi.zzc(zzay.zzep(paramzzs.statusCode), paramzzs.zzaGh));
    }
  }

  static final class zzc extends zzbc.zza<NodeApi.GetConnectedNodesResult>
  {
    public zzc(zza.zzb<NodeApi.GetConnectedNodesResult> paramzzb)
    {
      super();
    }

    public void zza(zzy paramzzy)
    {
      ArrayList localArrayList = new ArrayList();
      localArrayList.addAll(paramzzy.zzaGk);
      zzE(new zzan.zzb(zzay.zzep(paramzzy.statusCode), localArrayList));
    }
  }

  static final class zzd extends zzbc.zza<DataApi.DataItemResult>
  {
    public zzd(zza.zzb<DataApi.DataItemResult> paramzzb)
    {
      super();
    }

    public void zza(zzaa paramzzaa)
    {
      zzE(new zzi.zzb(zzay.zzep(paramzzaa.statusCode), paramzzaa.zzaGl));
    }
  }

  static final class zze extends zzbc.zza<DataItemBuffer>
  {
    public zze(zza.zzb<DataItemBuffer> paramzzb)
    {
      super();
    }

    public void zzac(DataHolder paramDataHolder)
    {
      zzE(new DataItemBuffer(paramDataHolder));
    }
  }

  static final class zzf extends zzbc.zza<DataApi.GetFdForAssetResult>
  {
    public zzf(zza.zzb<DataApi.GetFdForAssetResult> paramzzb)
    {
      super();
    }

    public void zza(zzac paramzzac)
    {
      zzE(new zzi.zzd(zzay.zzep(paramzzac.statusCode), paramzzac.zzaGm));
    }
  }

  static final class zzg extends zzbc.zza<NodeApi.GetLocalNodeResult>
  {
    public zzg(zza.zzb<NodeApi.GetLocalNodeResult> paramzzb)
    {
      super();
    }

    public void zza(zzae paramzzae)
    {
      zzE(new zzan.zzc(zzay.zzep(paramzzae.statusCode), paramzzae.zzaGn));
    }
  }

  static final class zzh extends zza
  {
    public void zza(Status paramStatus)
    {
    }
  }

  static final class zzi extends zzbc.zza<DataApi.DataItemResult>
  {
    private final List<FutureTask<Boolean>> zzaGF;

    zzi(zza.zzb<DataApi.DataItemResult> paramzzb, List<FutureTask<Boolean>> paramList)
    {
      super();
      this.zzaGF = paramList;
    }

    public void zza(zzas paramzzas)
    {
      zzE(new zzi.zzb(zzay.zzep(paramzzas.statusCode), paramzzas.zzaGl));
      if (paramzzas.statusCode != 0)
      {
        Iterator localIterator = this.zzaGF.iterator();
        while (localIterator.hasNext())
          ((FutureTask)localIterator.next()).cancel(true);
      }
    }
  }

  static final class zzj extends zzbc.zza<MessageApi.SendMessageResult>
  {
    public zzj(zza.zzb<MessageApi.SendMessageResult> paramzzb)
    {
      super();
    }

    public void zza(zzaw paramzzaw)
    {
      zzE(new zzak.zzb(zzay.zzep(paramzzaw.statusCode), paramzzaw.zzaGD));
    }
  }
}