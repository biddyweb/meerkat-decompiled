package com.google.android.gms.games.internal.api;

import android.os.RemoteException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.games.Games.BaseGamesApiMethodImpl;
import com.google.android.gms.games.internal.GamesClientImpl;
import com.google.android.gms.games.internal.game.Acls;
import com.google.android.gms.games.internal.game.Acls.LoadAclResult;

public final class AclsImpl
  implements Acls
{
  private static Acls.LoadAclResult zzJ(Status paramStatus)
  {
    return new Acls.LoadAclResult()
    {
      public Status getStatus()
      {
        return this.zzGT;
      }

      public void release()
      {
      }
    };
  }

  private static abstract class LoadNotifyAclImpl extends Games.BaseGamesApiMethodImpl<Acls.LoadAclResult>
  {
    public Acls.LoadAclResult zzL(Status paramStatus)
    {
      return AclsImpl.zzK(paramStatus);
    }
  }

  private static abstract class UpdateNotifyAclImpl extends Games.BaseGamesApiMethodImpl<Status>
  {
    public Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}