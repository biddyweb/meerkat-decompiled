package com.google.android.gms.tagmanager;

import android.text.TextUtils;

class zzap
{
  private String zzEB;
  private final long zzEy;
  private final long zzEz;
  private final long zzayJ;

  zzap(long paramLong1, long paramLong2, long paramLong3)
  {
    this.zzEy = paramLong1;
    this.zzEz = paramLong2;
    this.zzayJ = paramLong3;
  }

  void zzaq(String paramString)
  {
    if ((paramString == null) || (TextUtils.isEmpty(paramString.trim())))
      return;
    this.zzEB = paramString;
  }

  long zzgs()
  {
    return this.zzEy;
  }

  long zztj()
  {
    return this.zzayJ;
  }

  String zztk()
  {
    return this.zzEB;
  }
}