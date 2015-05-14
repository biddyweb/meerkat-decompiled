package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface zzxd
{
  public static final class zza extends zzwy
  {
    public long zzaIq;
    public long zzaIr;
    public int zzaIs;
    public zzxe.zza zzaIt;
    public int zzaIu;
    public zzxd.zzc[] zzaIv;
    public int zzaIw;
    public boolean zzaIx;
    public zzxc.zzb[] zzaIy;

    public zza()
    {
      zzwi();
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zza localzza;
      do
      {
        return true;
        if (!(paramObject instanceof zza))
          return false;
        localzza = (zza)paramObject;
        if (this.zzaIq != localzza.zzaIq)
          return false;
        if (this.zzaIr != localzza.zzaIr)
          return false;
        if (this.zzaIs != localzza.zzaIs)
          return false;
        if (this.zzaIt == null)
        {
          if (localzza.zzaIt != null)
            return false;
        }
        else if (!this.zzaIt.equals(localzza.zzaIt))
          return false;
        if (this.zzaIu != localzza.zzaIu)
          return false;
        if (!zzww.equals(this.zzaIv, localzza.zzaIv))
          return false;
        if (this.zzaIw != localzza.zzaIw)
          return false;
        if (this.zzaIx != localzza.zzaIx)
          return false;
      }
      while (zzww.equals(this.zzaIy, localzza.zzaIy));
      return false;
    }

    public int hashCode()
    {
      int i = 31 * (31 * (31 * (527 + (int)(this.zzaIq ^ this.zzaIq >>> 32)) + (int)(this.zzaIr ^ this.zzaIr >>> 32)) + this.zzaIs);
      int j;
      int k;
      if (this.zzaIt == null)
      {
        j = 0;
        k = 31 * (31 * (31 * (31 * (j + i) + this.zzaIu) + zzww.hashCode(this.zzaIv)) + this.zzaIw);
        if (!this.zzaIx)
          break label128;
      }
      label128: for (int m = 1231; ; m = 1237)
      {
        return 31 * (m + k) + zzww.hashCode(this.zzaIy);
        j = this.zzaIt.hashCode();
        break;
      }
    }

    public zza zzG(zzwq paramzzwq)
      throws IOException
    {
      while (true)
      {
        int i = paramzzwq.zzvu();
        switch (i)
        {
        default:
          if (zzxb.zzb(paramzzwq, i))
            continue;
        case 0:
          return this;
        case 8:
          this.zzaIq = paramzzwq.zzvw();
          break;
        case 16:
          this.zzaIr = paramzzwq.zzvw();
          break;
        case 24:
          this.zzaIs = paramzzwq.zzvx();
          break;
        case 34:
          if (this.zzaIt == null)
            this.zzaIt = new zzxe.zza();
          paramzzwq.zza(this.zzaIt);
          break;
        case 40:
          this.zzaIu = paramzzwq.zzvx();
          break;
        case 50:
          int n = zzxb.zzc(paramzzwq, 50);
          if (this.zzaIv == null);
          zzxd.zzc[] arrayOfzzc;
          for (int i1 = 0; ; i1 = this.zzaIv.length)
          {
            arrayOfzzc = new zzxd.zzc[n + i1];
            if (i1 != 0)
              System.arraycopy(this.zzaIv, 0, arrayOfzzc, 0, i1);
            while (i1 < -1 + arrayOfzzc.length)
            {
              arrayOfzzc[i1] = new zzxd.zzc();
              paramzzwq.zza(arrayOfzzc[i1]);
              paramzzwq.zzvu();
              i1++;
            }
          }
          arrayOfzzc[i1] = new zzxd.zzc();
          paramzzwq.zza(arrayOfzzc[i1]);
          this.zzaIv = arrayOfzzc;
          break;
        case 56:
          int m = paramzzwq.zzvx();
          switch (m)
          {
          default:
            break;
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          }
          this.zzaIw = m;
          break;
        case 64:
          this.zzaIx = paramzzwq.zzvy();
          break;
        case 74:
        }
        int j = zzxb.zzc(paramzzwq, 74);
        if (this.zzaIy == null);
        zzxc.zzb[] arrayOfzzb;
        for (int k = 0; ; k = this.zzaIy.length)
        {
          arrayOfzzb = new zzxc.zzb[j + k];
          if (k != 0)
            System.arraycopy(this.zzaIy, 0, arrayOfzzb, 0, k);
          while (k < -1 + arrayOfzzb.length)
          {
            arrayOfzzb[k] = new zzxc.zzb();
            paramzzwq.zza(arrayOfzzb[k]);
            paramzzwq.zzvu();
            k++;
          }
        }
        arrayOfzzb[k] = new zzxc.zzb();
        paramzzwq.zza(arrayOfzzb[k]);
        this.zzaIy = arrayOfzzb;
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzaIq != 0L)
        paramzzwr.zzb(1, this.zzaIq);
      if (this.zzaIr != 0L)
        paramzzwr.zzb(2, this.zzaIr);
      if (this.zzaIs != 0)
        paramzzwr.zzy(3, this.zzaIs);
      if (this.zzaIt != null)
        paramzzwr.zza(4, this.zzaIt);
      if (this.zzaIu != 0)
        paramzzwr.zzy(5, this.zzaIu);
      if ((this.zzaIv != null) && (this.zzaIv.length > 0))
        for (int k = 0; k < this.zzaIv.length; k++)
        {
          zzxd.zzc localzzc = this.zzaIv[k];
          if (localzzc != null)
            paramzzwr.zza(6, localzzc);
        }
      if (this.zzaIw != 0)
        paramzzwr.zzy(7, this.zzaIw);
      if (this.zzaIx)
        paramzzwr.zzb(8, this.zzaIx);
      if (this.zzaIy != null)
      {
        int i = this.zzaIy.length;
        int j = 0;
        if (i > 0)
          while (j < this.zzaIy.length)
          {
            zzxc.zzb localzzb = this.zzaIy[j];
            if (localzzb != null)
              paramzzwr.zza(9, localzzb);
            j++;
          }
      }
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzaIq != 0L)
        i += zzwr.zzd(1, this.zzaIq);
      if (this.zzaIr != 0L)
        i += zzwr.zzd(2, this.zzaIr);
      if (this.zzaIs != 0)
        i += zzwr.zzA(3, this.zzaIs);
      if (this.zzaIt != null)
        i += zzwr.zzc(4, this.zzaIt);
      if (this.zzaIu != 0)
        i += zzwr.zzA(5, this.zzaIu);
      if ((this.zzaIv != null) && (this.zzaIv.length > 0))
      {
        int m = i;
        for (int n = 0; n < this.zzaIv.length; n++)
        {
          zzxd.zzc localzzc = this.zzaIv[n];
          if (localzzc != null)
            m += zzwr.zzc(6, localzzc);
        }
        i = m;
      }
      if (this.zzaIw != 0)
        i += zzwr.zzA(7, this.zzaIw);
      if (this.zzaIx)
        i += zzwr.zzc(8, this.zzaIx);
      if (this.zzaIy != null)
      {
        int j = this.zzaIy.length;
        int k = 0;
        if (j > 0)
          while (k < this.zzaIy.length)
          {
            zzxc.zzb localzzb = this.zzaIy[k];
            if (localzzb != null)
              i += zzwr.zzc(9, localzzb);
            k++;
          }
      }
      return i;
    }

    public zza zzwi()
    {
      this.zzaIq = 0L;
      this.zzaIr = 0L;
      this.zzaIs = 0;
      this.zzaIt = null;
      this.zzaIu = 0;
      this.zzaIv = zzxd.zzc.zzwl();
      this.zzaIw = 0;
      this.zzaIx = false;
      this.zzaIy = zzxc.zzb.zzwa();
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzb extends zzwy
  {
    private static volatile zzb[] zzaIz;
    public long zzaIA;
    public long zzaIB;
    public zzxc.zzf[] zzaIC;
    public int zzaID;
    public zzxc.zzb zzaIE;
    public int zzaIF;
    public zzxc.zzb zzaIG;
    public long zzaIH;
    public long zzaII;

    public zzb()
    {
      zzwk();
    }

    public static zzb[] zzwj()
    {
      if (zzaIz == null);
      synchronized (zzww.zzaHL)
      {
        if (zzaIz == null)
          zzaIz = new zzb[0];
        return zzaIz;
      }
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zzb localzzb;
      do
      {
        return true;
        if (!(paramObject instanceof zzb))
          return false;
        localzzb = (zzb)paramObject;
        if (this.zzaIA != localzzb.zzaIA)
          return false;
        if (this.zzaIB != localzzb.zzaIB)
          return false;
        if (!zzww.equals(this.zzaIC, localzzb.zzaIC))
          return false;
        if (this.zzaID != localzzb.zzaID)
          return false;
        if (this.zzaIE == null)
        {
          if (localzzb.zzaIE != null)
            return false;
        }
        else if (!this.zzaIE.equals(localzzb.zzaIE))
          return false;
        if (this.zzaIF != localzzb.zzaIF)
          return false;
        if (this.zzaIG == null)
        {
          if (localzzb.zzaIG != null)
            return false;
        }
        else if (!this.zzaIG.equals(localzzb.zzaIG))
          return false;
        if (this.zzaIH != localzzb.zzaIH)
          return false;
      }
      while (this.zzaII == localzzb.zzaII);
      return false;
    }

    public int hashCode()
    {
      int i = 31 * (31 * (31 * (31 * (527 + (int)(this.zzaIA ^ this.zzaIA >>> 32)) + (int)(this.zzaIB ^ this.zzaIB >>> 32)) + zzww.hashCode(this.zzaIC)) + this.zzaID);
      int j;
      int k;
      int m;
      if (this.zzaIE == null)
      {
        j = 0;
        k = 31 * (31 * (j + i) + this.zzaIF);
        zzxc.zzb localzzb = this.zzaIG;
        m = 0;
        if (localzzb != null)
          break label145;
      }
      while (true)
      {
        return 31 * (31 * (k + m) + (int)(this.zzaIH ^ this.zzaIH >>> 32)) + (int)(this.zzaII ^ this.zzaII >>> 32);
        j = this.zzaIE.hashCode();
        break;
        label145: m = this.zzaIG.hashCode();
      }
    }

    public zzb zzH(zzwq paramzzwq)
      throws IOException
    {
      while (true)
      {
        int i = paramzzwq.zzvu();
        switch (i)
        {
        default:
          if (zzxb.zzb(paramzzwq, i))
            continue;
        case 0:
          return this;
        case 8:
          this.zzaIA = paramzzwq.zzvw();
          break;
        case 16:
          this.zzaIB = paramzzwq.zzvw();
          break;
        case 26:
          int j = zzxb.zzc(paramzzwq, 26);
          if (this.zzaIC == null);
          zzxc.zzf[] arrayOfzzf;
          for (int k = 0; ; k = this.zzaIC.length)
          {
            arrayOfzzf = new zzxc.zzf[j + k];
            if (k != 0)
              System.arraycopy(this.zzaIC, 0, arrayOfzzf, 0, k);
            while (k < -1 + arrayOfzzf.length)
            {
              arrayOfzzf[k] = new zzxc.zzf();
              paramzzwq.zza(arrayOfzzf[k]);
              paramzzwq.zzvu();
              k++;
            }
          }
          arrayOfzzf[k] = new zzxc.zzf();
          paramzzwq.zza(arrayOfzzf[k]);
          this.zzaIC = arrayOfzzf;
          break;
        case 32:
          this.zzaID = paramzzwq.zzvx();
          break;
        case 42:
          if (this.zzaIE == null)
            this.zzaIE = new zzxc.zzb();
          paramzzwq.zza(this.zzaIE);
          break;
        case 48:
          this.zzaIF = paramzzwq.zzvx();
          break;
        case 58:
          if (this.zzaIG == null)
            this.zzaIG = new zzxc.zzb();
          paramzzwq.zza(this.zzaIG);
          break;
        case 64:
          this.zzaIH = paramzzwq.zzvw();
          break;
        case 72:
        }
        this.zzaII = paramzzwq.zzvw();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzaIA != 0L)
        paramzzwr.zzb(1, this.zzaIA);
      if (this.zzaIB != 0L)
        paramzzwr.zzb(2, this.zzaIB);
      if ((this.zzaIC != null) && (this.zzaIC.length > 0))
        for (int i = 0; i < this.zzaIC.length; i++)
        {
          zzxc.zzf localzzf = this.zzaIC[i];
          if (localzzf != null)
            paramzzwr.zza(3, localzzf);
        }
      if (this.zzaID != 0)
        paramzzwr.zzy(4, this.zzaID);
      if (this.zzaIE != null)
        paramzzwr.zza(5, this.zzaIE);
      if (this.zzaIF != 0)
        paramzzwr.zzy(6, this.zzaIF);
      if (this.zzaIG != null)
        paramzzwr.zza(7, this.zzaIG);
      if (this.zzaIH != 0L)
        paramzzwr.zzb(8, this.zzaIH);
      if (this.zzaII != 0L)
        paramzzwr.zzb(9, this.zzaII);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzaIA != 0L)
        i += zzwr.zzd(1, this.zzaIA);
      if (this.zzaIB != 0L)
        i += zzwr.zzd(2, this.zzaIB);
      if ((this.zzaIC != null) && (this.zzaIC.length > 0))
      {
        int j = i;
        for (int k = 0; k < this.zzaIC.length; k++)
        {
          zzxc.zzf localzzf = this.zzaIC[k];
          if (localzzf != null)
            j += zzwr.zzc(3, localzzf);
        }
        i = j;
      }
      if (this.zzaID != 0)
        i += zzwr.zzA(4, this.zzaID);
      if (this.zzaIE != null)
        i += zzwr.zzc(5, this.zzaIE);
      if (this.zzaIF != 0)
        i += zzwr.zzA(6, this.zzaIF);
      if (this.zzaIG != null)
        i += zzwr.zzc(7, this.zzaIG);
      if (this.zzaIH != 0L)
        i += zzwr.zzd(8, this.zzaIH);
      if (this.zzaII != 0L)
        i += zzwr.zzd(9, this.zzaII);
      return i;
    }

    public zzb zzwk()
    {
      this.zzaIA = 0L;
      this.zzaIB = 0L;
      this.zzaIC = zzxc.zzf.zzwg();
      this.zzaID = 0;
      this.zzaIE = null;
      this.zzaIF = 0;
      this.zzaIG = null;
      this.zzaIH = 0L;
      this.zzaII = 0L;
      this.zzaHM = -1;
      return this;
    }
  }

  public static final class zzc extends zzwy
  {
    private static volatile zzc[] zzaIJ;
    public int zzaID;
    public zzxc.zzb zzaIE;
    public zzxd.zzb[] zzaIK;
    public boolean zzaIx;

    public zzc()
    {
      zzwm();
    }

    public static zzc[] zzwl()
    {
      if (zzaIJ == null);
      synchronized (zzww.zzaHL)
      {
        if (zzaIJ == null)
          zzaIJ = new zzc[0];
        return zzaIJ;
      }
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      zzc localzzc;
      do
      {
        return true;
        if (!(paramObject instanceof zzc))
          return false;
        localzzc = (zzc)paramObject;
        if (this.zzaID != localzzc.zzaID)
          return false;
        if (this.zzaIE == null)
        {
          if (localzzc.zzaIE != null)
            return false;
        }
        else if (!this.zzaIE.equals(localzzc.zzaIE))
          return false;
        if (!zzww.equals(this.zzaIK, localzzc.zzaIK))
          return false;
      }
      while (this.zzaIx == localzzc.zzaIx);
      return false;
    }

    public int hashCode()
    {
      int i = 31 * (527 + this.zzaID);
      int j;
      int k;
      if (this.zzaIE == null)
      {
        j = 0;
        k = 31 * (31 * (j + i) + zzww.hashCode(this.zzaIK));
        if (!this.zzaIx)
          break label67;
      }
      label67: for (int m = 1231; ; m = 1237)
      {
        return m + k;
        j = this.zzaIE.hashCode();
        break;
      }
    }

    public zzc zzI(zzwq paramzzwq)
      throws IOException
    {
      while (true)
      {
        int i = paramzzwq.zzvu();
        switch (i)
        {
        default:
          if (zzxb.zzb(paramzzwq, i))
            continue;
        case 0:
          return this;
        case 8:
          this.zzaID = paramzzwq.zzvx();
          break;
        case 18:
          if (this.zzaIE == null)
            this.zzaIE = new zzxc.zzb();
          paramzzwq.zza(this.zzaIE);
          break;
        case 26:
          int j = zzxb.zzc(paramzzwq, 26);
          if (this.zzaIK == null);
          zzxd.zzb[] arrayOfzzb;
          for (int k = 0; ; k = this.zzaIK.length)
          {
            arrayOfzzb = new zzxd.zzb[j + k];
            if (k != 0)
              System.arraycopy(this.zzaIK, 0, arrayOfzzb, 0, k);
            while (k < -1 + arrayOfzzb.length)
            {
              arrayOfzzb[k] = new zzxd.zzb();
              paramzzwq.zza(arrayOfzzb[k]);
              paramzzwq.zzvu();
              k++;
            }
          }
          arrayOfzzb[k] = new zzxd.zzb();
          paramzzwq.zza(arrayOfzzb[k]);
          this.zzaIK = arrayOfzzb;
          break;
        case 32:
        }
        this.zzaIx = paramzzwq.zzvy();
      }
    }

    public void zza(zzwr paramzzwr)
      throws IOException
    {
      if (this.zzaID != 0)
        paramzzwr.zzy(1, this.zzaID);
      if (this.zzaIE != null)
        paramzzwr.zza(2, this.zzaIE);
      if ((this.zzaIK != null) && (this.zzaIK.length > 0))
        for (int i = 0; i < this.zzaIK.length; i++)
        {
          zzxd.zzb localzzb = this.zzaIK[i];
          if (localzzb != null)
            paramzzwr.zza(3, localzzb);
        }
      if (this.zzaIx)
        paramzzwr.zzb(4, this.zzaIx);
      super.zza(paramzzwr);
    }

    protected int zzc()
    {
      int i = super.zzc();
      if (this.zzaID != 0)
        i += zzwr.zzA(1, this.zzaID);
      if (this.zzaIE != null)
        i += zzwr.zzc(2, this.zzaIE);
      if ((this.zzaIK != null) && (this.zzaIK.length > 0))
      {
        int j = i;
        for (int k = 0; k < this.zzaIK.length; k++)
        {
          zzxd.zzb localzzb = this.zzaIK[k];
          if (localzzb != null)
            j += zzwr.zzc(3, localzzb);
        }
        i = j;
      }
      if (this.zzaIx)
        i += zzwr.zzc(4, this.zzaIx);
      return i;
    }

    public zzc zzwm()
    {
      this.zzaID = 0;
      this.zzaIE = null;
      this.zzaIK = zzxd.zzb.zzwj();
      this.zzaIx = false;
      this.zzaHM = -1;
      return this;
    }
  }
}