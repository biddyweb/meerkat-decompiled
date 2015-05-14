package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.internal.zztr;
import com.google.android.gms.internal.zztt;
import java.util.HashSet;
import java.util.Set;

public abstract interface Moment extends Freezable<Moment>
{
  public abstract String getId();

  public abstract ItemScope getResult();

  public abstract String getStartDate();

  public abstract ItemScope getTarget();

  public abstract String getType();

  public abstract boolean hasId();

  public abstract boolean hasResult();

  public abstract boolean hasStartDate();

  public abstract boolean hasTarget();

  public abstract boolean hasType();

  public static class Builder
  {
    private String zzFA;
    private final Set<Integer> zzauX = new HashSet();
    private String zzavK;
    private zztr zzavS;
    private zztr zzavT;
    private String zzxV;

    public Moment build()
    {
      return new zztt(this.zzauX, this.zzFA, this.zzavS, this.zzavK, this.zzavT, this.zzxV);
    }

    public Builder setId(String paramString)
    {
      this.zzFA = paramString;
      this.zzauX.add(Integer.valueOf(2));
      return this;
    }

    public Builder setResult(ItemScope paramItemScope)
    {
      this.zzavS = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(4));
      return this;
    }

    public Builder setStartDate(String paramString)
    {
      this.zzavK = paramString;
      this.zzauX.add(Integer.valueOf(5));
      return this;
    }

    public Builder setTarget(ItemScope paramItemScope)
    {
      this.zzavT = ((zztr)paramItemScope);
      this.zzauX.add(Integer.valueOf(6));
      return this;
    }

    public Builder setType(String paramString)
    {
      this.zzxV = paramString;
      this.zzauX.add(Integer.valueOf(7));
      return this;
    }
  }
}