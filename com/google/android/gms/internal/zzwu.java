package com.google.android.gms.internal;

class zzwu
  implements Cloneable
{
  private static final zzwv zzaHE = new zzwv();
  private int mSize;
  private boolean zzaHF = false;
  private int[] zzaHG;
  private zzwv[] zzaHH;

  public zzwu()
  {
    this(10);
  }

  public zzwu(int paramInt)
  {
    int i = idealIntArraySize(paramInt);
    this.zzaHG = new int[i];
    this.zzaHH = new zzwv[i];
    this.mSize = 0;
  }

  private void gc()
  {
    int i = this.mSize;
    int[] arrayOfInt = this.zzaHG;
    zzwv[] arrayOfzzwv = this.zzaHH;
    int j = 0;
    int k = 0;
    while (j < i)
    {
      zzwv localzzwv = arrayOfzzwv[j];
      if (localzzwv != zzaHE)
      {
        if (j != k)
        {
          arrayOfInt[k] = arrayOfInt[j];
          arrayOfzzwv[k] = localzzwv;
          arrayOfzzwv[j] = null;
        }
        k++;
      }
      j++;
    }
    this.zzaHF = false;
    this.mSize = k;
  }

  private int idealByteArraySize(int paramInt)
  {
    for (int i = 4; ; i++)
      if (i < 32)
      {
        if (paramInt <= -12 + (1 << i))
          paramInt = -12 + (1 << i);
      }
      else
        return paramInt;
  }

  private int idealIntArraySize(int paramInt)
  {
    return idealByteArraySize(paramInt * 4) / 4;
  }

  private boolean zza(int[] paramArrayOfInt1, int[] paramArrayOfInt2, int paramInt)
  {
    for (int i = 0; i < paramInt; i++)
      if (paramArrayOfInt1[i] != paramArrayOfInt2[i])
        return false;
    return true;
  }

  private boolean zza(zzwv[] paramArrayOfzzwv1, zzwv[] paramArrayOfzzwv2, int paramInt)
  {
    for (int i = 0; i < paramInt; i++)
      if (!paramArrayOfzzwv1[i].equals(paramArrayOfzzwv2[i]))
        return false;
    return true;
  }

  private int zziG(int paramInt)
  {
    int i = 0;
    int j = -1 + this.mSize;
    while (i <= j)
    {
      int k = i + j >>> 1;
      int m = this.zzaHG[k];
      if (m < paramInt)
        i = k + 1;
      else if (m > paramInt)
        j = k - 1;
      else
        return k;
    }
    return i ^ 0xFFFFFFFF;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    zzwu localzzwu;
    do
    {
      return true;
      if (!(paramObject instanceof zzwu))
        return false;
      localzzwu = (zzwu)paramObject;
      if (size() != localzzwu.size())
        return false;
    }
    while ((zza(this.zzaHG, localzzwu.zzaHG, this.mSize)) && (zza(this.zzaHH, localzzwu.zzaHH, this.mSize)));
    return false;
  }

  public int hashCode()
  {
    if (this.zzaHF)
      gc();
    int i = 17;
    for (int j = 0; j < this.mSize; j++)
      i = 31 * (i * 31 + this.zzaHG[j]) + this.zzaHH[j].hashCode();
    return i;
  }

  public boolean isEmpty()
  {
    return size() == 0;
  }

  public int size()
  {
    if (this.zzaHF)
      gc();
    return this.mSize;
  }

  public void zza(int paramInt, zzwv paramzzwv)
  {
    int i = zziG(paramInt);
    if (i >= 0)
    {
      this.zzaHH[i] = paramzzwv;
      return;
    }
    int j = i ^ 0xFFFFFFFF;
    if ((j < this.mSize) && (this.zzaHH[j] == zzaHE))
    {
      this.zzaHG[j] = paramInt;
      this.zzaHH[j] = paramzzwv;
      return;
    }
    if ((this.zzaHF) && (this.mSize >= this.zzaHG.length))
    {
      gc();
      j = 0xFFFFFFFF ^ zziG(paramInt);
    }
    if (this.mSize >= this.zzaHG.length)
    {
      int k = idealIntArraySize(1 + this.mSize);
      int[] arrayOfInt = new int[k];
      zzwv[] arrayOfzzwv = new zzwv[k];
      System.arraycopy(this.zzaHG, 0, arrayOfInt, 0, this.zzaHG.length);
      System.arraycopy(this.zzaHH, 0, arrayOfzzwv, 0, this.zzaHH.length);
      this.zzaHG = arrayOfInt;
      this.zzaHH = arrayOfzzwv;
    }
    if (this.mSize - j != 0)
    {
      System.arraycopy(this.zzaHG, j, this.zzaHG, j + 1, this.mSize - j);
      System.arraycopy(this.zzaHH, j, this.zzaHH, j + 1, this.mSize - j);
    }
    this.zzaHG[j] = paramInt;
    this.zzaHH[j] = paramzzwv;
    this.mSize = (1 + this.mSize);
  }

  public zzwv zziE(int paramInt)
  {
    int i = zziG(paramInt);
    if ((i < 0) || (this.zzaHH[i] == zzaHE))
      return null;
    return this.zzaHH[i];
  }

  public zzwv zziF(int paramInt)
  {
    if (this.zzaHF)
      gc();
    return this.zzaHH[paramInt];
  }

  public final zzwu zzvO()
  {
    int i = 0;
    int j = size();
    zzwu localzzwu = new zzwu(j);
    System.arraycopy(this.zzaHG, 0, localzzwu.zzaHG, 0, j);
    while (i < j)
    {
      if (this.zzaHH[i] != null)
        localzzwu.zzaHH[i] = this.zzaHH[i].zzvP();
      i++;
    }
    localzzwu.mSize = j;
    return localzzwu;
  }
}