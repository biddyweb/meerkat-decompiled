package com.google.android.gms.internal;

import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageButton;

@zzgi
public class zzer extends FrameLayout
  implements View.OnClickListener
{
  private final ImageButton zzuJ;
  private final zzet zzuK;

  public zzer(Context paramContext, int paramInt, zzet paramzzet)
  {
    super(paramContext);
    this.zzuK = paramzzet;
    setOnClickListener(this);
    this.zzuJ = new ImageButton(paramContext);
    this.zzuJ.setImageResource(17301527);
    this.zzuJ.setBackgroundColor(0);
    this.zzuJ.setOnClickListener(this);
    this.zzuJ.setPadding(0, 0, 0, 0);
    this.zzuJ.setContentDescription("Interstitial close button");
    int i = zzbe.zzbD().zzb(paramContext, paramInt);
    addView(this.zzuJ, new FrameLayout.LayoutParams(i, i, 17));
  }

  public void onClick(View paramView)
  {
    if (this.zzuK != null)
      this.zzuK.zzdd();
  }

  public void zza(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean2)
    {
      if (paramBoolean1)
      {
        this.zzuJ.setVisibility(4);
        return;
      }
      this.zzuJ.setVisibility(8);
      return;
    }
    this.zzuJ.setVisibility(0);
  }
}