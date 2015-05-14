package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;

public class zzve
{
  private final Integer zzaBM;
  private final String zzaBN;
  private final boolean zzaBO;
  private final String zzaxw;
  private final String zzazP;

  public zzve(String paramString1, Integer paramInteger, String paramString2, boolean paramBoolean)
  {
    this(paramString1, paramInteger, paramString2, paramBoolean, "");
  }

  public zzve(String paramString1, Integer paramInteger, String paramString2, boolean paramBoolean, String paramString3)
  {
    zzx.zzl(paramString1);
    zzx.zzl(paramString3);
    this.zzaxw = paramString1;
    this.zzaBM = paramInteger;
    this.zzaBN = paramString2;
    this.zzaBO = paramBoolean;
    this.zzazP = paramString3;
  }

  public String getContainerId()
  {
    return this.zzaxw;
  }

  public Integer zzuh()
  {
    return this.zzaBM;
  }

  public String zzui()
  {
    return this.zzaBN;
  }

  public String zzuj()
  {
    if (this.zzaBN != null)
      return this.zzaBN + "_" + this.zzaxw;
    return this.zzaxw;
  }

  public boolean zzuk()
  {
    return this.zzaBO;
  }

  public String zzul()
  {
    return this.zzazP;
  }
}