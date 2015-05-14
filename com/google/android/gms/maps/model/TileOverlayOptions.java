package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.zzaa;
import com.google.android.gms.maps.model.internal.zzo;
import com.google.android.gms.maps.model.internal.zzo.zza;

public final class TileOverlayOptions
  implements SafeParcelable
{
  public static final zzw CREATOR = new zzw();
  private final int zzFG;
  private zzo zzarH;
  private TileProvider zzarI;
  private boolean zzarJ = true;
  private float zzarb;
  private boolean zzarc = true;

  public TileOverlayOptions()
  {
    this.zzFG = 1;
  }

  TileOverlayOptions(int paramInt, IBinder paramIBinder, boolean paramBoolean1, float paramFloat, boolean paramBoolean2)
  {
    this.zzFG = paramInt;
    this.zzarH = zzo.zza.zzcf(paramIBinder);
    if (this.zzarH == null);
    for (TileProvider local1 = null; ; local1 = new TileProvider()
    {
      private final zzo zzarK = TileOverlayOptions.zza(TileOverlayOptions.this);

      public Tile getTile(int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        try
        {
          Tile localTile = this.zzarK.getTile(paramAnonymousInt1, paramAnonymousInt2, paramAnonymousInt3);
          return localTile;
        }
        catch (RemoteException localRemoteException)
        {
        }
        return null;
      }
    })
    {
      this.zzarI = local1;
      this.zzarc = paramBoolean1;
      this.zzarb = paramFloat;
      this.zzarJ = paramBoolean2;
      return;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public TileOverlayOptions fadeIn(boolean paramBoolean)
  {
    this.zzarJ = paramBoolean;
    return this;
  }

  public boolean getFadeIn()
  {
    return this.zzarJ;
  }

  public TileProvider getTileProvider()
  {
    return this.zzarI;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public float getZIndex()
  {
    return this.zzarb;
  }

  public boolean isVisible()
  {
    return this.zzarc;
  }

  public TileOverlayOptions tileProvider(final TileProvider paramTileProvider)
  {
    this.zzarI = paramTileProvider;
    if (this.zzarI == null);
    for (zzo.zza local2 = null; ; local2 = new zzo.zza()
    {
      public Tile getTile(int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        return paramTileProvider.getTile(paramAnonymousInt1, paramAnonymousInt2, paramAnonymousInt3);
      }
    })
    {
      this.zzarH = local2;
      return this;
    }
  }

  public TileOverlayOptions visible(boolean paramBoolean)
  {
    this.zzarc = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (zzaa.zzqF())
    {
      zzx.zza(this, paramParcel, paramInt);
      return;
    }
    zzw.zza(this, paramParcel, paramInt);
  }

  public TileOverlayOptions zIndex(float paramFloat)
  {
    this.zzarb = paramFloat;
    return this;
  }

  IBinder zzqK()
  {
    return this.zzarH.asBinder();
  }
}