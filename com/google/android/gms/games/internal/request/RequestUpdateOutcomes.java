package com.google.android.gms.games.internal.request;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.games.internal.constants.RequestUpdateResultOutcome;
import java.util.HashMap;
import java.util.Set;

public final class RequestUpdateOutcomes
{
  private static final String[] zzaiP = { "requestId", "outcome" };
  private final int zzLs;
  private final HashMap<String, Integer> zzaiQ;

  private RequestUpdateOutcomes(int paramInt, HashMap<String, Integer> paramHashMap)
  {
    this.zzLs = paramInt;
    this.zzaiQ = paramHashMap;
  }

  public static RequestUpdateOutcomes zzW(DataHolder paramDataHolder)
  {
    Builder localBuilder = new Builder();
    localBuilder.zzeU(paramDataHolder.getStatusCode());
    int i = paramDataHolder.getCount();
    for (int j = 0; j < i; j++)
    {
      int k = paramDataHolder.zzax(j);
      localBuilder.zzA(paramDataHolder.zzc("requestId", j, k), paramDataHolder.zzb("outcome", j, k));
    }
    return localBuilder.zzoO();
  }

  public Set<String> getRequestIds()
  {
    return this.zzaiQ.keySet();
  }

  public int getRequestOutcome(String paramString)
  {
    zzx.zzb(this.zzaiQ.containsKey(paramString), "Request " + paramString + " was not part of the update operation!");
    return ((Integer)this.zzaiQ.get(paramString)).intValue();
  }

  public static final class Builder
  {
    private int zzLs = 0;
    private HashMap<String, Integer> zzaiQ = new HashMap();

    public Builder zzA(String paramString, int paramInt)
    {
      if (RequestUpdateResultOutcome.isValid(paramInt))
        this.zzaiQ.put(paramString, Integer.valueOf(paramInt));
      return this;
    }

    public Builder zzeU(int paramInt)
    {
      this.zzLs = paramInt;
      return this;
    }

    public RequestUpdateOutcomes zzoO()
    {
      return new RequestUpdateOutcomes(this.zzLs, this.zzaiQ, null);
    }
  }
}