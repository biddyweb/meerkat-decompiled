package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;

public class zziz
  implements SafeParcelable
{
  public static final zzja CREATOR = new zzja();
  public final String name;
  public final int weight;
  final int zzFG;
  public final String zzGh;
  public final boolean zzGi;
  public final boolean zzGj;
  public final String zzGk;
  public final zzit[] zzGl;
  final int[] zzGm;
  public final String zzGn;

  zziz(int paramInt1, String paramString1, String paramString2, boolean paramBoolean1, int paramInt2, boolean paramBoolean2, String paramString3, zzit[] paramArrayOfzzit, int[] paramArrayOfInt, String paramString4)
  {
    this.zzFG = paramInt1;
    this.name = paramString1;
    this.zzGh = paramString2;
    this.zzGi = paramBoolean1;
    this.weight = paramInt2;
    this.zzGj = paramBoolean2;
    this.zzGk = paramString3;
    this.zzGl = paramArrayOfzzit;
    this.zzGm = paramArrayOfInt;
    this.zzGn = paramString4;
  }

  zziz(String paramString1, String paramString2, boolean paramBoolean1, int paramInt, boolean paramBoolean2, String paramString3, zzit[] paramArrayOfzzit, int[] paramArrayOfInt, String paramString4)
  {
    this(2, paramString1, paramString2, paramBoolean1, paramInt, paramBoolean2, paramString3, paramArrayOfzzit, paramArrayOfInt, paramString4);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1 = paramObject instanceof zziz;
    boolean bool2 = false;
    if (bool1)
    {
      zziz localzziz = (zziz)paramObject;
      boolean bool3 = this.name.equals(localzziz.name);
      bool2 = false;
      if (bool3)
      {
        boolean bool4 = this.zzGh.equals(localzziz.zzGh);
        bool2 = false;
        if (bool4)
        {
          boolean bool5 = this.zzGi;
          boolean bool6 = localzziz.zzGi;
          bool2 = false;
          if (bool5 == bool6)
            bool2 = true;
        }
      }
    }
    return bool2;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzja.zza(this, paramParcel, paramInt);
  }

  public static final class zza
  {
    private final String mName;
    private String zzGo;
    private boolean zzGp;
    private int zzGq;
    private boolean zzGr;
    private String zzGs;
    private final List<zzit> zzGt;
    private BitSet zzGu;
    private String zzGv;

    public zza(String paramString)
    {
      this.mName = paramString;
      this.zzGq = 1;
      this.zzGt = new ArrayList();
    }

    public zza zzI(boolean paramBoolean)
    {
      this.zzGp = paramBoolean;
      return this;
    }

    public zza zzJ(boolean paramBoolean)
    {
      this.zzGr = paramBoolean;
      return this;
    }

    public zza zzW(int paramInt)
    {
      if (this.zzGu == null)
        this.zzGu = new BitSet();
      this.zzGu.set(paramInt);
      return this;
    }

    public zza zzaA(String paramString)
    {
      this.zzGv = paramString;
      return this;
    }

    public zza zzaz(String paramString)
    {
      this.zzGo = paramString;
      return this;
    }

    public zziz zzgX()
    {
      int i = 0;
      BitSet localBitSet = this.zzGu;
      int[] arrayOfInt = null;
      if (localBitSet != null)
      {
        arrayOfInt = new int[this.zzGu.cardinality()];
        int j = this.zzGu.nextSetBit(0);
        while (j >= 0)
        {
          int k = i + 1;
          arrayOfInt[i] = j;
          j = this.zzGu.nextSetBit(j + 1);
          i = k;
        }
      }
      return new zziz(this.mName, this.zzGo, this.zzGp, this.zzGq, this.zzGr, this.zzGs, (zzit[])this.zzGt.toArray(new zzit[this.zzGt.size()]), arrayOfInt, this.zzGv);
    }
  }
}