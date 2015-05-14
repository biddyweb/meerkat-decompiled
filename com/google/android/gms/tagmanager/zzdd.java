package com.google.android.gms.tagmanager;

class zzdd extends Number
  implements Comparable<zzdd>
{
  private double zzaBi;
  private long zzaBj;
  private boolean zzaBk;

  private zzdd(double paramDouble)
  {
    this.zzaBi = paramDouble;
    this.zzaBk = false;
  }

  private zzdd(long paramLong)
  {
    this.zzaBj = paramLong;
    this.zzaBk = true;
  }

  public static zzdd zzI(long paramLong)
  {
    return new zzdd(paramLong);
  }

  public static zzdd zza(Double paramDouble)
  {
    return new zzdd(paramDouble.doubleValue());
  }

  public static zzdd zzdn(String paramString)
    throws NumberFormatException
  {
    try
    {
      zzdd localzzdd1 = new zzdd(Long.parseLong(paramString));
      return localzzdd1;
    }
    catch (NumberFormatException localNumberFormatException1)
    {
      try
      {
        zzdd localzzdd2 = new zzdd(Double.parseDouble(paramString));
        return localzzdd2;
      }
      catch (NumberFormatException localNumberFormatException2)
      {
      }
    }
    throw new NumberFormatException(paramString + " is not a valid TypedNumber");
  }

  public byte byteValue()
  {
    return (byte)(int)longValue();
  }

  public double doubleValue()
  {
    if (zztV())
      return this.zzaBj;
    return this.zzaBi;
  }

  public boolean equals(Object paramObject)
  {
    return ((paramObject instanceof zzdd)) && (zza((zzdd)paramObject) == 0);
  }

  public float floatValue()
  {
    return (float)doubleValue();
  }

  public int hashCode()
  {
    return new Long(longValue()).hashCode();
  }

  public int intValue()
  {
    return zztX();
  }

  public long longValue()
  {
    return zztW();
  }

  public short shortValue()
  {
    return zztY();
  }

  public String toString()
  {
    if (zztV())
      return Long.toString(this.zzaBj);
    return Double.toString(this.zzaBi);
  }

  public int zza(zzdd paramzzdd)
  {
    if ((zztV()) && (paramzzdd.zztV()))
      return new Long(this.zzaBj).compareTo(Long.valueOf(paramzzdd.zzaBj));
    return Double.compare(doubleValue(), paramzzdd.doubleValue());
  }

  public boolean zztU()
  {
    return !zztV();
  }

  public boolean zztV()
  {
    return this.zzaBk;
  }

  public long zztW()
  {
    if (zztV())
      return this.zzaBj;
    return ()this.zzaBi;
  }

  public int zztX()
  {
    return (int)longValue();
  }

  public short zztY()
  {
    return (short)(int)longValue();
  }
}