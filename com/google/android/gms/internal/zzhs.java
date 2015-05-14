package com.google.android.gms.internal;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@zzgi
public class zzhs
{
  private final Context mContext;
  private int mState = 0;
  private final float zztH;
  private String zzzv;
  private float zzzw;
  private float zzzx;
  private float zzzy;

  public zzhs(Context paramContext)
  {
    this.mContext = paramContext;
    this.zztH = paramContext.getResources().getDisplayMetrics().density;
  }

  public zzhs(Context paramContext, String paramString)
  {
    this(paramContext);
    this.zzzv = paramString;
  }

  private void showDialog()
  {
    if (!(this.mContext instanceof Activity))
    {
      zzhx.zzaa("Can not create dialog without Activity Context");
      return;
    }
    String str1;
    if (!TextUtils.isEmpty(this.zzzv))
    {
      Uri localUri = new Uri.Builder().encodedQuery(this.zzzv).build();
      StringBuilder localStringBuilder = new StringBuilder();
      Map localMap = zzab.zzaM().zzd(localUri);
      Iterator localIterator = localMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str2 = (String)localIterator.next();
        localStringBuilder.append(str2).append(" = ").append((String)localMap.get(str2)).append("\n\n");
      }
      str1 = localStringBuilder.toString().trim();
      if (TextUtils.isEmpty(str1));
    }
    while (true)
    {
      AlertDialog.Builder localBuilder = new AlertDialog.Builder(this.mContext);
      localBuilder.setMessage(str1);
      localBuilder.setTitle("Ad Information");
      localBuilder.setPositiveButton("Share", new zzhs.1(this, str1));
      localBuilder.setNegativeButton("Close", new zzhs.2(this));
      localBuilder.create().show();
      return;
      str1 = "No debug information";
      continue;
      str1 = "No debug information";
    }
  }

  public void zzV(String paramString)
  {
    this.zzzv = paramString;
  }

  void zza(int paramInt, float paramFloat1, float paramFloat2)
  {
    if (paramInt == 0)
    {
      this.mState = 0;
      this.zzzw = paramFloat1;
      this.zzzx = paramFloat2;
      this.zzzy = paramFloat2;
    }
    label24: label224: 
    do
    {
      do
      {
        break label24;
        do
          return;
        while (this.mState == -1);
        if (paramInt != 2)
          break;
        if (paramFloat2 > this.zzzx)
          this.zzzx = paramFloat2;
        while (this.zzzx - this.zzzy > 30.0F * this.zztH)
        {
          this.mState = -1;
          return;
          if (paramFloat2 < this.zzzy)
            this.zzzy = paramFloat2;
        }
        if ((this.mState == 0) || (this.mState == 2))
          if (paramFloat1 - this.zzzw >= 50.0F * this.zztH)
            this.zzzw = paramFloat1;
        for (this.mState = (1 + this.mState); ; this.mState = (1 + this.mState))
        {
          do
          {
            if ((this.mState != 1) && (this.mState != 3))
              break label224;
            if (paramFloat1 <= this.zzzw)
              break;
            this.zzzw = paramFloat1;
            return;
          }
          while (((this.mState != 1) && (this.mState != 3)) || (paramFloat1 - this.zzzw > -50.0F * this.zztH));
          this.zzzw = paramFloat1;
        }
      }
      while ((this.mState != 2) || (paramFloat1 >= this.zzzw));
      this.zzzw = paramFloat1;
      return;
    }
    while ((paramInt != 1) || (this.mState != 4));
    showDialog();
  }

  public void zzc(MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getHistorySize();
    for (int j = 0; j < i; j++)
      zza(paramMotionEvent.getActionMasked(), paramMotionEvent.getHistoricalX(0, j), paramMotionEvent.getHistoricalY(0, j));
    zza(paramMotionEvent.getActionMasked(), paramMotionEvent.getX(), paramMotionEvent.getY());
  }
}