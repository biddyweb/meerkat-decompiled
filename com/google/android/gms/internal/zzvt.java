package com.google.android.gms.internal;

import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.zzbf;
import java.util.List;

public abstract class zzvt
{
  private zzvj zzaCG;
  private zzvh zzaCH;
  private zzlv zzmW;

  public zzvt(zzvj paramzzvj, zzvh paramzzvh)
  {
    this(paramzzvj, paramzzvh, zzlx.zzkc());
  }

  public zzvt(zzvj paramzzvj, zzvh paramzzvh, zzlv paramzzlv)
  {
    if (paramzzvj.zzun().size() == i);
    while (true)
    {
      zzx.zzO(i);
      this.zzaCG = paramzzvj;
      this.zzaCH = paramzzvh;
      this.zzmW = paramzzlv;
      return;
      int j = 0;
    }
  }

  protected abstract zzb zza(zzve paramzzve);

  protected abstract void zza(zzvk paramzzvk);

  public void zza(zza paramzza)
  {
    zzbf.zzZ("ResourceManager: Failed to download a resource: " + paramzza.name());
    zzve localzzve = (zzve)this.zzaCG.zzun().get(0);
    zzb localzzb = zza(localzzve);
    if ((localzzb != null) && ((localzzb.zzuP() instanceof zzvl.zzc)));
    for (zzvk.zza localzza = new zzvk.zza(Status.zzNo, localzzve, null, (zzvl.zzc)localzzb.zzuP(), localzzb.zzup(), localzzb.zzut()); ; localzza = new zzvk.zza(Status.zzNq, localzzve, zzvk.zza.zza.zzaCf))
    {
      zza(new zzvk(localzza));
      return;
    }
  }

  public void zzo(byte[] paramArrayOfByte)
  {
    zzbf.zzab("ResourceManager: Resource downloaded from Network: " + this.zzaCG.getId());
    zzve localzzve = (zzve)this.zzaCG.zzun().get(0);
    zzvk.zza.zza localzza1 = zzvk.zza.zza.zzaCf;
    Object localObject1 = null;
    long l1 = 0L;
    try
    {
      localObject1 = this.zzaCH.zzn(paramArrayOfByte);
      l1 = this.zzmW.currentTimeMillis();
      if (localObject1 == null)
      {
        zzbf.zzaa("Parsed resource from network is null");
        zzb localzzb2 = zza(localzzve);
        if (localzzb2 != null)
        {
          localObject1 = localzzb2.zzuP();
          localzza1 = localzzb2.zzup();
          long l3 = localzzb2.zzut();
          l1 = l3;
        }
      }
      l2 = l1;
      localObject2 = localzza1;
      localObject3 = localObject1;
      if (localObject3 != null)
      {
        localzza = new zzvk.zza(Status.zzNo, localzzve, paramArrayOfByte, (zzvl.zzc)localObject3, (zzvk.zza.zza)localObject2, l2);
        zza(new zzvk(localzza));
        return;
      }
    }
    catch (zzvl.zzg localzzg)
    {
      while (true)
      {
        long l2;
        Object localObject2;
        Object localObject3;
        zzvk.zza localzza;
        zzbf.zzaa("Resource from network is corrupted");
        zzb localzzb1 = zza(localzzve);
        if (localzzb1 != null)
        {
          Object localObject4 = localzzb1.zzuP();
          zzvk.zza.zza localzza2 = localzzb1.zzup();
          l2 = l1;
          localObject2 = localzza2;
          localObject3 = localObject4;
          continue;
          localzza = new zzvk.zza(Status.zzNq, localzzve, zzvk.zza.zza.zzaCf);
        }
        else
        {
          l2 = l1;
          localObject2 = localzza1;
          localObject3 = localObject1;
        }
      }
    }
  }

  public static enum zza
  {
    static
    {
      zza[] arrayOfzza = new zza[3];
      arrayOfzza[0] = zzaCI;
      arrayOfzza[1] = zzaCJ;
      arrayOfzza[2] = zzaCK;
    }
  }

  public class zzb
  {
    private final Object zzaCM;
    private final zzvk.zza.zza zzaCa;
    private final long zzaCc;

    public Object zzuP()
    {
      return this.zzaCM;
    }

    public zzvk.zza.zza zzup()
    {
      return this.zzaCa;
    }

    public long zzut()
    {
      return this.zzaCc;
    }
  }
}