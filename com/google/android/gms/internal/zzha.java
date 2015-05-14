package com.google.android.gms.internal;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@zzgi
class zzha
{
  private int zzvR;
  private final List<String> zzxQ;
  private final List<String> zzxR;
  private final String zzxS;
  private final String zzxT;
  private final String zzxU;
  private final String zzxV;
  private final boolean zzxW;
  private String zzxX;
  private final String zzxv;

  public zzha(int paramInt, Map<String, String> paramMap)
  {
    this.zzxX = ((String)paramMap.get("url"));
    this.zzxT = ((String)paramMap.get("base_uri"));
    this.zzxU = ((String)paramMap.get("post_parameters"));
    this.zzxW = parseBoolean((String)paramMap.get("drt_include"));
    this.zzxS = ((String)paramMap.get("activation_overlay_url"));
    this.zzxR = zzQ((String)paramMap.get("check_packages"));
    this.zzxv = ((String)paramMap.get("request_id"));
    this.zzxV = ((String)paramMap.get("type"));
    this.zzxQ = zzQ((String)paramMap.get("errors"));
    this.zzvR = paramInt;
  }

  private static boolean parseBoolean(String paramString)
  {
    return (paramString != null) && ((paramString.equals("1")) || (paramString.equals("true")));
  }

  private List<String> zzQ(String paramString)
  {
    if (paramString == null)
      return null;
    return Arrays.asList(paramString.split(","));
  }

  public int getErrorCode()
  {
    return this.zzvR;
  }

  public String getRequestId()
  {
    return this.zzxv;
  }

  public String getType()
  {
    return this.zzxV;
  }

  public String getUrl()
  {
    return this.zzxX;
  }

  public void setUrl(String paramString)
  {
    this.zzxX = paramString;
  }

  public List<String> zzdU()
  {
    return this.zzxQ;
  }

  public String zzdV()
  {
    return this.zzxU;
  }

  public boolean zzdW()
  {
    return this.zzxW;
  }
}