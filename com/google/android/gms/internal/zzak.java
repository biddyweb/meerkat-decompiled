package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Iterator;

@zzgi
public class zzak
{
  private final int zznW;
  private final int zznX;
  private final int zznY;
  private final zzap zznZ;
  private final Object zznh = new Object();
  private ArrayList<String> zzoa = new ArrayList();
  private int zzob = 0;
  private int zzoc = 0;
  private int zzod = 0;
  private int zzoe;
  private String zzof = "";

  public zzak(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.zznW = paramInt1;
    this.zznX = paramInt2;
    this.zznY = paramInt3;
    this.zznZ = new zzap(paramInt4);
  }

  private String zza(ArrayList<String> paramArrayList, int paramInt)
  {
    String str;
    if (paramArrayList.isEmpty())
      str = "";
    do
    {
      return str;
      StringBuffer localStringBuffer = new StringBuffer();
      Iterator localIterator = paramArrayList.iterator();
      do
      {
        if (!localIterator.hasNext())
          break;
        localStringBuffer.append((String)localIterator.next());
        localStringBuffer.append(' ');
      }
      while (localStringBuffer.length() <= paramInt);
      localStringBuffer.deleteCharAt(-1 + localStringBuffer.length());
      str = localStringBuffer.toString();
    }
    while (str.length() < paramInt);
    return str.substring(0, paramInt);
  }

  private void zzj(String paramString)
  {
    if ((paramString == null) || (paramString.length() < this.zznY))
      return;
    synchronized (this.zznh)
    {
      this.zzoa.add(paramString);
      this.zzob += paramString.length();
      return;
    }
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zzak));
    zzak localzzak;
    do
    {
      return false;
      if (paramObject == this)
        return true;
      localzzak = (zzak)paramObject;
    }
    while ((localzzak.zzbm() == null) || (!localzzak.zzbm().equals(zzbm())));
    return true;
  }

  public int getScore()
  {
    return this.zzoe;
  }

  public int hashCode()
  {
    return zzbm().hashCode();
  }

  public String toString()
  {
    return "ActivityContent fetchId: " + this.zzoc + " score:" + this.zzoe + " total_length:" + this.zzob + "\n text: " + zza(this.zzoa, 200) + "\n signture: " + this.zzof;
  }

  int zza(int paramInt1, int paramInt2)
  {
    return paramInt1 * this.zznW + paramInt2 * this.zznX;
  }

  public boolean zzbl()
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        if (this.zzod == 0)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }

  public String zzbm()
  {
    return this.zzof;
  }

  public void zzbn()
  {
    synchronized (this.zznh)
    {
      this.zzoe = (-100 + this.zzoe);
      return;
    }
  }

  public void zzbo()
  {
    synchronized (this.zznh)
    {
      this.zzod = (-1 + this.zzod);
      return;
    }
  }

  public void zzbp()
  {
    synchronized (this.zznh)
    {
      this.zzod = (1 + this.zzod);
      return;
    }
  }

  public void zzbq()
  {
    synchronized (this.zznh)
    {
      int i = zza(this.zzob, this.zzoc);
      if (i > this.zzoe)
      {
        this.zzoe = i;
        this.zzof = this.zznZ.zza(this.zzoa);
      }
      return;
    }
  }

  int zzbr()
  {
    return this.zzob;
  }

  public void zzc(int paramInt)
  {
    this.zzoc = paramInt;
  }

  public void zzh(String paramString)
  {
    zzj(paramString);
    synchronized (this.zznh)
    {
      if (this.zzod < 0)
        zzhx.zzY("ActivityContent: negative number of WebViews.");
      zzbq();
      return;
    }
  }

  public void zzi(String paramString)
  {
    zzj(paramString);
  }
}