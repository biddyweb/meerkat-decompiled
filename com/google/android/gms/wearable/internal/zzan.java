package com.google.android.gms.wearable.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.wearable.Node;
import com.google.android.gms.wearable.NodeApi;
import com.google.android.gms.wearable.NodeApi.GetConnectedNodesResult;
import com.google.android.gms.wearable.NodeApi.GetLocalNodeResult;
import com.google.android.gms.wearable.NodeApi.NodeListener;
import java.util.ArrayList;
import java.util.List;

public final class zzan
  implements NodeApi
{
  public PendingResult<Status> addListener(GoogleApiClient paramGoogleApiClient, NodeApi.NodeListener paramNodeListener)
  {
    return paramGoogleApiClient.zza(new zza(paramGoogleApiClient, paramNodeListener, null));
  }

  public PendingResult<NodeApi.GetConnectedNodesResult> getConnectedNodes(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zzo(this);
      }

      protected NodeApi.GetConnectedNodesResult zzaV(Status paramAnonymousStatus)
      {
        return new zzan.zzb(paramAnonymousStatus, new ArrayList());
      }
    });
  }

  public PendingResult<NodeApi.GetLocalNodeResult> getLocalNode(GoogleApiClient paramGoogleApiClient)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zzn(this);
      }

      protected NodeApi.GetLocalNodeResult zzaU(Status paramAnonymousStatus)
      {
        return new zzan.zzc(paramAnonymousStatus, null);
      }
    });
  }

  public PendingResult<Status> removeListener(GoogleApiClient paramGoogleApiClient, final NodeApi.NodeListener paramNodeListener)
  {
    return paramGoogleApiClient.zza(new zzg(paramGoogleApiClient)
    {
      protected void zza(zzbd paramAnonymouszzbd)
        throws RemoteException
      {
        paramAnonymouszzbd.zzb(this, paramNodeListener);
      }

      public Status zzb(Status paramAnonymousStatus)
      {
        return paramAnonymousStatus;
      }
    });
  }

  private static final class zza extends zzg<Status>
  {
    private NodeApi.NodeListener zzaGz;

    private zza(GoogleApiClient paramGoogleApiClient, NodeApi.NodeListener paramNodeListener)
    {
      super();
      this.zzaGz = paramNodeListener;
    }

    protected void zza(zzbd paramzzbd)
      throws RemoteException
    {
      paramzzbd.zza(this, this.zzaGz);
      this.zzaGz = null;
    }

    public Status zzb(Status paramStatus)
    {
      this.zzaGz = null;
      return paramStatus;
    }
  }

  public static class zzb
    implements NodeApi.GetConnectedNodesResult
  {
    private final Status zzHb;
    private final List<Node> zzaGA;

    public zzb(Status paramStatus, List<Node> paramList)
    {
      this.zzHb = paramStatus;
      this.zzaGA = paramList;
    }

    public List<Node> getNodes()
    {
      return this.zzaGA;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }

  public static class zzc
    implements NodeApi.GetLocalNodeResult
  {
    private final Status zzHb;
    private final Node zzaGB;

    public zzc(Status paramStatus, Node paramNode)
    {
      this.zzHb = paramStatus;
      this.zzaGB = paramNode;
    }

    public Node getNode()
    {
      return this.zzaGB;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }
  }
}