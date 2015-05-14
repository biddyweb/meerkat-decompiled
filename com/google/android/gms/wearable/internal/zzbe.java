package com.google.android.gms.wearable.internal;

import android.content.IntentFilter;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.wearable.DataApi.DataListener;
import com.google.android.gms.wearable.DataEventBuffer;
import com.google.android.gms.wearable.MessageApi.MessageListener;
import com.google.android.gms.wearable.NodeApi.NodeListener;
import com.google.android.gms.wearable.zza.zza;

public class zzbe extends zzah.zza
{
  private zza.zza zzaGM;
  private DataApi.DataListener zzaGN;
  private MessageApi.MessageListener zzaGO;
  private NodeApi.NodeListener zzaGP;
  private final IntentFilter[] zzaGb;

  private zzbe(zza.zza paramzza, DataApi.DataListener paramDataListener, MessageApi.MessageListener paramMessageListener, NodeApi.NodeListener paramNodeListener, IntentFilter[] paramArrayOfIntentFilter)
  {
    this.zzaGM = paramzza;
    this.zzaGN = paramDataListener;
    this.zzaGO = paramMessageListener;
    this.zzaGP = paramNodeListener;
    this.zzaGb = paramArrayOfIntentFilter;
  }

  public static zzbe zza(NodeApi.NodeListener paramNodeListener)
  {
    return new zzbe(null, null, null, paramNodeListener, null);
  }

  public static zzbe zza(zza.zza paramzza)
  {
    return new zzbe(paramzza, null, null, null, null);
  }

  public static zzbe zzb(DataApi.DataListener paramDataListener, IntentFilter[] paramArrayOfIntentFilter)
  {
    return new zzbe(null, paramDataListener, null, null, paramArrayOfIntentFilter);
  }

  public static zzbe zzb(MessageApi.MessageListener paramMessageListener, IntentFilter[] paramArrayOfIntentFilter)
  {
    return new zzbe(null, null, paramMessageListener, null, paramArrayOfIntentFilter);
  }

  public void clear()
  {
    this.zzaGM = null;
    this.zzaGN = null;
    this.zzaGO = null;
    this.zzaGP = null;
  }

  public void zza(zzal paramzzal)
  {
    if (this.zzaGO != null)
      this.zzaGO.onMessageReceived(paramzzal);
  }

  public void zza(zzao paramzzao)
  {
    if (this.zzaGP != null)
      this.zzaGP.onPeerConnected(paramzzao);
  }

  public void zza(zze paramzze)
  {
    if (this.zzaGM != null)
      this.zzaGM.zza(paramzze);
  }

  public void zzab(DataHolder paramDataHolder)
  {
    if (this.zzaGN != null)
      try
      {
        this.zzaGN.onDataChanged(new DataEventBuffer(paramDataHolder));
        return;
      }
      finally
      {
        paramDataHolder.close();
      }
    paramDataHolder.close();
  }

  public void zzb(zzao paramzzao)
  {
    if (this.zzaGP != null)
      this.zzaGP.onPeerDisconnected(paramzzao);
  }

  public IntentFilter[] zzvm()
  {
    return this.zzaGb;
  }
}