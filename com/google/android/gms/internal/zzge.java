package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.PopupWindow;

@zzgi
public class zzge extends zzgd
{
  private Object zzvT = new Object();
  private PopupWindow zzvU;
  private boolean zzvV = false;

  zzge(Context paramContext, zzhe.zza paramzza, zzic paramzzic, zzgc.zza paramzza1)
  {
    super(paramContext, paramzza, paramzzic, paramzza1);
  }

  private void zzdH()
  {
    synchronized (this.zzvT)
    {
      this.zzvV = true;
      if (((this.mContext instanceof Activity)) && (((Activity)this.mContext).isDestroyed()))
        this.zzvU = null;
      if (this.zzvU != null)
      {
        if (this.zzvU.isShowing())
          this.zzvU.dismiss();
        this.zzvU = null;
      }
      return;
    }
  }

  public void onStop()
  {
    zzdH();
    super.onStop();
  }

  protected void zzdG()
  {
    if ((this.mContext instanceof Activity));
    for (Window localWindow = ((Activity)this.mContext).getWindow(); ; localWindow = null)
    {
      if ((localWindow == null) || (localWindow.getDecorView() == null));
      while (((Activity)this.mContext).isDestroyed())
        return;
      FrameLayout localFrameLayout = new FrameLayout(this.mContext);
      localFrameLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
      localFrameLayout.addView(this.zzmu.getWebView(), -1, -1);
      synchronized (this.zzvT)
      {
        if (this.zzvV)
          return;
      }
      this.zzvU = new PopupWindow(localFrameLayout, 1, 1, false);
      this.zzvU.setOutsideTouchable(true);
      this.zzvU.setClippingEnabled(false);
      zzhx.zzY("Displaying the 1x1 popup off the screen.");
      try
      {
        this.zzvU.showAtLocation(localWindow.getDecorView(), 0, -1, -1);
        return;
      }
      catch (Exception localException)
      {
        while (true)
          this.zzvU = null;
      }
    }
  }

  protected void zzh(zzhe paramzzhe)
  {
    zzdH();
    super.zzh(paramzzhe);
  }
}