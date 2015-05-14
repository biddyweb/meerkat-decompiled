package com.instabug.library.dialog;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnShowListener;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.widget.TextView;
import com.instabug.library.internal.view.AnimatedImageView;
import com.instabug.library.internal.view.AnimatedImageView.a;

public abstract class h extends Dialog
  implements DialogInterface.OnShowListener
{
  private AnimatedImageView a;
  private TextView b;
  private int c;

  public h(Context paramContext, int paramInt)
  {
    super(paramContext, paramContext.getResources().getIdentifier("InstabugBorderlessDialog", "style", paramContext.getPackageName()));
    this.c = paramInt;
    requestWindowFeature(1);
    Resources localResources1 = getContext().getResources();
    setContentView(localResources1.getIdentifier("instabug_lyt_dialog_animation", "layout", getContext().getPackageName()));
    setOnShowListener(this);
    Resources localResources2 = getContext().getResources();
    String str = getContext().getPackageName();
    this.a = ((AnimatedImageView)findViewById(localResources1.getIdentifier("animation_frame", "id", getContext().getPackageName())));
    this.a.a(a(localResources2, str));
    this.b = ((TextView)findViewById(localResources1.getIdentifier("animation_description", "id", getContext().getPackageName())));
    this.b.setText(getContext().getResources().getString(this.c));
  }

  public abstract AnimatedImageView.a[] a(Resources paramResources, String paramString);

  public void dismiss()
  {
    super.dismiss();
    try
    {
      this.a.b();
      this.a.getDrawable().setCallback(null);
      this.a = null;
      return;
    }
    catch (Exception localException)
    {
      this.a = null;
    }
  }

  public void onShow(DialogInterface paramDialogInterface)
  {
    this.a.a();
  }

  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
  }
}