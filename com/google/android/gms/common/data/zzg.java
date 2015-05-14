package com.google.android.gms.common.data;

import java.util.ArrayList;

public abstract class zzg<T> extends AbstractDataBuffer<T>
{
  private boolean zzOi = false;
  private ArrayList<Integer> zzOj;

  protected zzg(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  private void zziC()
  {
    while (true)
    {
      int k;
      Object localObject3;
      try
      {
        if (this.zzOi)
          break label198;
        int i = this.zzMd.getCount();
        this.zzOj = new ArrayList();
        if (i <= 0)
          break label193;
        this.zzOj.add(Integer.valueOf(0));
        String str = zziB();
        int j = this.zzMd.zzax(0);
        localObject2 = this.zzMd.zzc(str, 0, j);
        k = 1;
        if (k >= i)
          break label193;
        int m = this.zzMd.zzax(k);
        localObject3 = this.zzMd.zzc(str, k, m);
        if (localObject3 == null)
          throw new NullPointerException("Missing value for markerColumn: " + str + ", at row: " + k + ", for window: " + m);
      }
      finally
      {
      }
      if (!((String)localObject3).equals(localObject2))
      {
        this.zzOj.add(Integer.valueOf(k));
        break label205;
        label193: this.zzOi = true;
      }
      else
      {
        label198: localObject3 = localObject2;
      }
      label205: k++;
      Object localObject2 = localObject3;
    }
  }

  public final T get(int paramInt)
  {
    zziC();
    return zzj(zzaA(paramInt), zzaB(paramInt));
  }

  public int getCount()
  {
    zziC();
    return this.zzOj.size();
  }

  int zzaA(int paramInt)
  {
    if ((paramInt < 0) || (paramInt >= this.zzOj.size()))
      throw new IllegalArgumentException("Position " + paramInt + " is out of bounds for this buffer");
    return ((Integer)this.zzOj.get(paramInt)).intValue();
  }

  protected int zzaB(int paramInt)
  {
    int i;
    if ((paramInt < 0) || (paramInt == this.zzOj.size()))
      i = 0;
    label137: 
    while (true)
    {
      return i;
      if (paramInt == -1 + this.zzOj.size());
      for (i = this.zzMd.getCount() - ((Integer)this.zzOj.get(paramInt)).intValue(); ; i = ((Integer)this.zzOj.get(paramInt + 1)).intValue() - ((Integer)this.zzOj.get(paramInt)).intValue())
      {
        if (i != 1)
          break label137;
        int j = zzaA(paramInt);
        int k = this.zzMd.zzax(j);
        String str = zziD();
        if ((str == null) || (this.zzMd.zzc(str, j, k) != null))
          break;
        return 0;
      }
    }
  }

  protected abstract String zziB();

  protected String zziD()
  {
    return null;
  }

  protected abstract T zzj(int paramInt1, int paramInt2);
}