package com.google.android.gms.internal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

class zzwv
  implements Cloneable
{
  private zzwt<?, ?> zzaHI;
  private Object zzaHJ;
  private List<zzxa> zzaHK = new ArrayList();

  private byte[] toByteArray()
    throws IOException
  {
    byte[] arrayOfByte = new byte[zzc()];
    zza(zzwr.zzu(arrayOfByte));
    return arrayOfByte;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool2;
    if (paramObject == this)
      bool2 = true;
    zzwv localzzwv;
    zzwt localzzwt1;
    zzwt localzzwt2;
    do
    {
      boolean bool1;
      do
      {
        return bool2;
        bool1 = paramObject instanceof zzwv;
        bool2 = false;
      }
      while (!bool1);
      localzzwv = (zzwv)paramObject;
      if ((this.zzaHJ == null) || (localzzwv.zzaHJ == null))
        break;
      localzzwt1 = this.zzaHI;
      localzzwt2 = localzzwv.zzaHI;
      bool2 = false;
    }
    while (localzzwt1 != localzzwt2);
    if (!this.zzaHI.zzaHC.isArray())
      return this.zzaHJ.equals(localzzwv.zzaHJ);
    if ((this.zzaHJ instanceof byte[]))
      return Arrays.equals((byte[])this.zzaHJ, (byte[])localzzwv.zzaHJ);
    if ((this.zzaHJ instanceof int[]))
      return Arrays.equals((int[])this.zzaHJ, (int[])localzzwv.zzaHJ);
    if ((this.zzaHJ instanceof long[]))
      return Arrays.equals((long[])this.zzaHJ, (long[])localzzwv.zzaHJ);
    if ((this.zzaHJ instanceof float[]))
      return Arrays.equals((float[])this.zzaHJ, (float[])localzzwv.zzaHJ);
    if ((this.zzaHJ instanceof double[]))
      return Arrays.equals((double[])this.zzaHJ, (double[])localzzwv.zzaHJ);
    if ((this.zzaHJ instanceof boolean[]))
      return Arrays.equals((boolean[])this.zzaHJ, (boolean[])localzzwv.zzaHJ);
    return Arrays.deepEquals((Object[])this.zzaHJ, (Object[])localzzwv.zzaHJ);
    if ((this.zzaHK != null) && (localzzwv.zzaHK != null))
      return this.zzaHK.equals(localzzwv.zzaHK);
    try
    {
      boolean bool3 = Arrays.equals(toByteArray(), localzzwv.toByteArray());
      return bool3;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }

  public int hashCode()
  {
    try
    {
      int i = Arrays.hashCode(toByteArray());
      return i + 527;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }

  void zza(zzwr paramzzwr)
    throws IOException
  {
    if (this.zzaHJ != null)
      this.zzaHI.zza(this.zzaHJ, paramzzwr);
    while (true)
    {
      return;
      Iterator localIterator = this.zzaHK.iterator();
      while (localIterator.hasNext())
        ((zzxa)localIterator.next()).zza(paramzzwr);
    }
  }

  void zza(zzxa paramzzxa)
  {
    this.zzaHK.add(paramzzxa);
  }

  <T> T zzb(zzwt<?, T> paramzzwt)
  {
    if (this.zzaHJ != null)
    {
      if (this.zzaHI != paramzzwt)
        throw new IllegalStateException("Tried to getExtension with a differernt Extension.");
    }
    else
    {
      this.zzaHI = paramzzwt;
      this.zzaHJ = paramzzwt.zzx(this.zzaHK);
      this.zzaHK = null;
    }
    return this.zzaHJ;
  }

  int zzc()
  {
    int i;
    if (this.zzaHJ != null)
      i = this.zzaHI.zzF(this.zzaHJ);
    while (true)
    {
      return i;
      Iterator localIterator = this.zzaHK.iterator();
      i = 0;
      while (localIterator.hasNext())
        i += ((zzxa)localIterator.next()).zzc();
    }
  }

  public final zzwv zzvP()
  {
    int i = 0;
    zzwv localzzwv = new zzwv();
    try
    {
      localzzwv.zzaHI = this.zzaHI;
      if (this.zzaHK == null)
        localzzwv.zzaHK = null;
      while (this.zzaHJ == null)
      {
        return localzzwv;
        localzzwv.zzaHK.addAll(this.zzaHK);
      }
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      throw new AssertionError(localCloneNotSupportedException);
    }
    if ((this.zzaHJ instanceof zzwy))
    {
      localzzwv.zzaHJ = ((zzwy)this.zzaHJ).zzvN();
      return localzzwv;
    }
    if ((this.zzaHJ instanceof byte[]))
    {
      localzzwv.zzaHJ = ((byte[])this.zzaHJ).clone();
      return localzzwv;
    }
    if ((this.zzaHJ instanceof byte[][]))
    {
      byte[][] arrayOfByte = (byte[][])this.zzaHJ;
      byte[][] arrayOfByte1 = new byte[arrayOfByte.length][];
      localzzwv.zzaHJ = arrayOfByte1;
      for (int j = 0; j < arrayOfByte.length; j++)
        arrayOfByte1[j] = ((byte[])arrayOfByte[j].clone());
    }
    if ((this.zzaHJ instanceof boolean[]))
    {
      localzzwv.zzaHJ = ((boolean[])this.zzaHJ).clone();
      return localzzwv;
    }
    if ((this.zzaHJ instanceof int[]))
    {
      localzzwv.zzaHJ = ((int[])this.zzaHJ).clone();
      return localzzwv;
    }
    if ((this.zzaHJ instanceof long[]))
    {
      localzzwv.zzaHJ = ((long[])this.zzaHJ).clone();
      return localzzwv;
    }
    if ((this.zzaHJ instanceof float[]))
    {
      localzzwv.zzaHJ = ((float[])this.zzaHJ).clone();
      return localzzwv;
    }
    if ((this.zzaHJ instanceof double[]))
    {
      localzzwv.zzaHJ = ((double[])this.zzaHJ).clone();
      return localzzwv;
    }
    if ((this.zzaHJ instanceof zzwy[]))
    {
      zzwy[] arrayOfzzwy1 = (zzwy[])this.zzaHJ;
      zzwy[] arrayOfzzwy2 = new zzwy[arrayOfzzwy1.length];
      localzzwv.zzaHJ = arrayOfzzwy2;
      while (i < arrayOfzzwy1.length)
      {
        arrayOfzzwy2[i] = arrayOfzzwy1[i].zzvN();
        i++;
      }
    }
    return localzzwv;
  }
}