package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.zzbf;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

public class zzvo
{
  private String zzaya = "https://www.google-analytics.com";

  private String zzdv(String paramString)
  {
    try
    {
      String str = URLEncoder.encode(paramString, "UTF-8").replaceAll("\\+", "%20");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      zzbf.zzZ("Cannot encode the string: " + paramString);
    }
    return "";
  }

  public void zzdx(String paramString)
  {
    this.zzaya = paramString;
    zzbf.zzaa("The Ctfe server endpoint was changed to: " + paramString);
  }

  public String zzv(List<zzve> paramList)
  {
    return this.zzaya + "/gtm/android?" + zzw(paramList);
  }

  String zzw(List<zzve> paramList)
  {
    int i = 1;
    if (paramList.size() <= i);
    while (true)
    {
      zzx.zzO(i);
      if (!paramList.isEmpty())
        break;
      return "";
      int j = 0;
    }
    zzve localzzve = (zzve)paramList.get(0);
    String str;
    StringBuilder localStringBuilder;
    if (!localzzve.zzul().trim().equals(""))
    {
      str = localzzve.zzul().trim();
      localStringBuilder = new StringBuilder();
      if (localzzve.zzui() == null)
        break label165;
      localStringBuilder.append(localzzve.zzui());
    }
    while (true)
    {
      localStringBuilder.append("=").append(zzdv(localzzve.getContainerId())).append("&").append("pv").append("=").append(zzdv(str));
      if (localzzve.zzuk())
        localStringBuilder.append("&gtm_debug=x");
      return localStringBuilder.toString();
      str = "-1";
      break;
      label165: localStringBuilder.append("id");
    }
  }
}