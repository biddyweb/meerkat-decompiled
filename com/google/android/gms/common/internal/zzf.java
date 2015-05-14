package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.view.View;
import com.google.android.gms.internal.zzus;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public final class zzf
{
  private final Account zzFN;
  private final List<String> zzMM;
  private final int zzMf;
  private final View zzMg;
  private final String zzMh;
  private final String zzMi;
  private final zzus zzPr;
  private Integer zzPs;

  public zzf(Account paramAccount, Collection<String> paramCollection, int paramInt, View paramView, String paramString1, String paramString2, zzus paramzzus)
  {
    this.zzFN = paramAccount;
    if (paramCollection == null);
    for (List localList = Collections.EMPTY_LIST; ; localList = Collections.unmodifiableList(new ArrayList(paramCollection)))
    {
      this.zzMM = localList;
      this.zzMg = paramView;
      this.zzMf = paramInt;
      this.zzMh = paramString1;
      this.zzMi = paramString2;
      this.zzPr = paramzzus;
      return;
    }
  }

  public Account getAccount()
  {
    return this.zzFN;
  }

  @Deprecated
  public String getAccountName()
  {
    if (this.zzFN != null)
      return this.zzFN.name;
    return null;
  }

  public void zza(Integer paramInteger)
  {
    this.zzPs = paramInteger;
  }

  @Deprecated
  public String zziM()
  {
    return zziN().name;
  }

  public Account zziN()
  {
    if (this.zzFN != null)
      return this.zzFN;
    return new Account("<<default account>>", "com.google");
  }

  public int zziO()
  {
    return this.zzMf;
  }

  public List<String> zziP()
  {
    return this.zzMM;
  }

  public String[] zziQ()
  {
    return (String[])this.zzMM.toArray(new String[this.zzMM.size()]);
  }

  public String zziR()
  {
    return this.zzMh;
  }

  public String zziS()
  {
    return this.zzMi;
  }

  public View zziT()
  {
    return this.zzMg;
  }

  public zzus zziU()
  {
    return this.zzPr;
  }

  public Integer zziV()
  {
    return this.zzPs;
  }
}