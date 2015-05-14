package com.instabug.library.dialog;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;

public final class a extends Dialog
{
  private ImageView a;
  private TextView b;

  public a(Context paramContext)
  {
    super(paramContext, paramContext.getResources().getIdentifier("InstabugBorderlessDialog", "style", paramContext.getPackageName()));
    requestWindowFeature(1);
    Resources localResources = paramContext.getResources();
    setContentView(localResources.getIdentifier("instabug_lyt_dialog_animation", "layout", paramContext.getPackageName()));
    this.a = ((ImageView)findViewById(localResources.getIdentifier("animation_frame", "id", paramContext.getPackageName())));
    this.b = ((TextView)findViewById(localResources.getIdentifier("animation_description", "id", paramContext.getPackageName())));
    this.a.setImageResource(localResources.getIdentifier("instabug_img_shake", "drawable", paramContext.getPackageName()));
    Animation localAnimation = AnimationUtils.loadAnimation(getContext(), localResources.getIdentifier("instabug_anim_shake", "anim", paramContext.getPackageName()));
    localAnimation.setAnimationListener(new b(this));
    this.a.startAnimation(localAnimation);
    this.b.setText(getContext().getResources().getString(localResources.getIdentifier("shakestartalerttext", "string", paramContext.getPackageName())));
  }

  public final void dismiss()
  {
    super.dismiss();
    try
    {
      this.a.getDrawable().setCallback(null);
      this.a = null;
      return;
    }
    catch (Exception localException)
    {
      this.a = null;
    }
  }

  public final void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
  }
}