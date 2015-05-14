package com.instabug.library.activity;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.TextView;

public final class a extends Dialog
  implements View.OnClickListener
{
  private final Activity a;
  private final a b;
  private com.instabug.library.network.toolbox.b c;
  private int d;
  private int e;
  private int f;
  private int g;
  private int h;
  private int i;

  public a(Activity paramActivity, com.instabug.library.network.toolbox.b paramb, a parama)
  {
    super(paramActivity, 16973840);
    this.a = paramActivity;
    this.b = parama;
    this.i = getContext().getResources().getIdentifier("instabug_lyt_invocation", "layout", getContext().getApplicationInfo().packageName);
    setContentView(this.i);
    this.c = paramb;
  }

  public final void cancel()
  {
    dismiss();
    this.b.a();
  }

  public final void dismiss()
  {
    Animation localAnimation = AnimationUtils.loadAnimation(this.a, getContext().getResources().getIdentifier("instabug_anim_options_sheet_dismiss", "anim", getContext().getApplicationInfo().packageName));
    localAnimation.setFillAfter(true);
    localAnimation.setAnimationListener(new b(this));
    findViewById(this.e).startAnimation(localAnimation);
  }

  public final void onClick(View paramView)
  {
    int j = paramView.getId();
    if (j == this.d)
      cancel();
    do
    {
      return;
      if (j == this.f)
      {
        this.b.b();
        return;
      }
    }
    while (j != this.g);
    this.b.c();
  }

  public final void show()
  {
    WindowManager.LayoutParams localLayoutParams = new WindowManager.LayoutParams();
    localLayoutParams.copyFrom(getWindow().getAttributes());
    localLayoutParams.width = -1;
    localLayoutParams.height = -1;
    super.show();
    getWindow().setAttributes(localLayoutParams);
    this.d = getContext().getResources().getIdentifier("instabug_main_invocation", "id", getContext().getApplicationInfo().packageName);
    this.e = getContext().getResources().getIdentifier("instabug_options_invocation", "id", getContext().getApplicationInfo().packageName);
    this.f = getContext().getResources().getIdentifier("instabug_option_report_bug", "id", getContext().getApplicationInfo().packageName);
    this.g = getContext().getResources().getIdentifier("instabug_option_send_feedback", "id", getContext().getApplicationInfo().packageName);
    this.h = getContext().getResources().getIdentifier("instabug_anim_options_sheet", "anim", getContext().getApplicationInfo().packageName);
    findViewById(this.d).setOnClickListener(this);
    findViewById(this.e).setOnClickListener(this);
    findViewById(this.f).setOnClickListener(this);
    findViewById(this.g).setOnClickListener(this);
    findViewById(this.e).startAnimation(AnimationUtils.loadAnimation(this.a, this.h));
    if (this.c != null)
    {
      findViewById(this.e).setBackgroundColor(this.c.a);
      ((TextView)findViewById(this.f)).setTextColor(this.c.b);
      ((TextView)findViewById(this.g)).setTextColor(this.c.b);
    }
    ((TextView)findViewById(this.f)).setText(com.instabug.library.Instabug.getInstance().getSettingsBundle().n()[0]);
    ((TextView)findViewById(this.g)).setText(com.instabug.library.Instabug.getInstance().getSettingsBundle().n()[1]);
  }

  public static abstract interface a
  {
    public abstract void a();

    public abstract void b();

    public abstract void c();
  }
}