package com.instabug.library;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.util.Base64;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import android.widget.Toast;
import com.instabug.library.dialog.d.a;
import com.instabug.library.view.AnnotationView;
import java.io.File;

public final class b
  implements View.OnClickListener, TextView.OnEditorActionListener, com.instabug.library.view.a
{
  private String A = "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";
  private String B = "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";
  private TextView C;
  private ImageView D;
  private final InstabugFeedbackActivity a;
  private com.instabug.library.presenter.a b;
  private AnnotationView c;
  private LinearLayout d;
  private FrameLayout e;
  private FrameLayout f;
  private FrameLayout g;
  private FrameLayout h;
  private FrameLayout i;
  private FrameLayout j;
  private FrameLayout k;
  private FrameLayout l;
  private FrameLayout m;
  private ImageButton n;
  private ImageButton o;
  private ImageView p;
  private View q;
  private View r;
  private ProgressBar s;
  private EditText t;
  private EditText u;
  private int v;
  private ProgressDialog w;
  private Drawable x;
  private com.instabug.library.util.f y;
  private Drawable z;

  public b(InstabugFeedbackActivity paramInstabugFeedbackActivity)
  {
    this.a = paramInstabugFeedbackActivity;
  }

  private View b(int paramInt)
  {
    return this.a.findViewById(paramInt);
  }

  private Object i(String paramString)
  {
    return this.a.getSystemService(paramString);
  }

  private void k()
  {
    if (this.e.getVisibility() == 0)
    {
      TranslateAnimation localTranslateAnimation = new TranslateAnimation(1, 0.0F, 1, 0.0F, 1, 0.0F, 1, 1.0F);
      localTranslateAnimation.setDuration(350L);
      this.e.startAnimation(localTranslateAnimation);
      this.e.setVisibility(8);
      this.e.clearFocus();
      InputMethodManager localInputMethodManager = (InputMethodManager)i("input_method");
      if ((this.a != null) && (this.a.getCurrentFocus() != null))
        localInputMethodManager.hideSoftInputFromWindow(this.a.getCurrentFocus().getWindowToken(), 0);
      this.p.requestFocus();
    }
  }

  private void l()
  {
    if (this.e.getVisibility() == 8)
    {
      TranslateAnimation localTranslateAnimation = new TranslateAnimation(1, 0.0F, 1, 0.0F, 1, 1.0F, 1, 0.0F);
      localTranslateAnimation.setDuration(350L);
      localTranslateAnimation.setFillAfter(true);
      this.e.setVisibility(0);
      this.e.startAnimation(localTranslateAnimation);
      if (!Instabug.getInstance().isEmailEnabled())
        break label207;
      if (Instabug.getInstance().getDefaultEmail() == null)
      {
        this.t.requestFocus();
        this.t.performClick();
        ((InputMethodManager)i("input_method")).showSoftInput(this.t, 1);
      }
    }
    else
    {
      return;
    }
    if (!Instabug.getInstance().getDefaultEmail().trim().equals(this.t.getText().toString().trim()))
    {
      this.t.requestFocus();
      this.t.performClick();
      ((InputMethodManager)i("input_method")).showSoftInput(this.t, 1);
      return;
    }
    this.u.requestFocus();
    this.u.performClick();
    ((InputMethodManager)i("input_method")).showSoftInput(this.u, 1);
    return;
    label207: this.u.requestFocus();
    this.u.performClick();
    ((InputMethodManager)i("input_method")).showSoftInput(this.u, 1);
  }

  private void m()
  {
    if (this.d.getVisibility() == 0)
    {
      TranslateAnimation localTranslateAnimation = new TranslateAnimation(1, 0.0F, 1, 0.0F, 1, 0.0F, 1, 1.0F);
      localTranslateAnimation.setDuration(350L);
      this.d.startAnimation(localTranslateAnimation);
      this.d.setVisibility(8);
    }
  }

  private com.instabug.library.internal.theming.a n()
  {
    Instabug.access$000(Instabug.getInstance().iG().a);
    Instabug.SdkThemingMode localSdkThemingMode = h.c();
    if (localSdkThemingMode == Instabug.SdkThemingMode.MIN_SDK_14)
    {
      Instabug.a.a("Explicitly loading Native Theme");
      new com.instabug.library.internal.theming.d();
      return com.instabug.library.internal.theming.d.a(this.a);
    }
    if (localSdkThemingMode == Instabug.SdkThemingMode.APPCOMPAT_V7)
    {
      Instabug.a.a("Explicitly loading AppCompat Theme");
      new com.instabug.library.internal.theming.b();
      return com.instabug.library.internal.theming.b.a(this.a);
    }
    if (localSdkThemingMode == Instabug.SdkThemingMode.SHERLOCK)
    {
      Instabug.a.a("Explicitly loading ActionBarSherlock Material Theme");
      new com.instabug.library.internal.theming.e();
      return com.instabug.library.internal.theming.e.a(this.a);
    }
    if (localSdkThemingMode == Instabug.SdkThemingMode.APP_COMPAT_MATERIAL)
    {
      Instabug.a.a("Explicitly loading AppCompat Material Theme");
      new com.instabug.library.internal.theming.c();
      return com.instabug.library.internal.theming.c.a(this.a);
    }
    try
    {
      Class.forName("android.support.v7.widget.Toolbar");
      Instabug.a.a("AppCompat Material found, loading theme");
      new com.instabug.library.internal.theming.c();
      com.instabug.library.internal.theming.a locala3 = com.instabug.library.internal.theming.c.a(this.a);
      return locala3;
    }
    catch (ClassNotFoundException localClassNotFoundException1)
    {
      try
      {
        Class.forName("android.support.v7.app.ActionBarActivity");
        Instabug.a.a("AppCompat found, loading theme");
        new com.instabug.library.internal.theming.b();
        com.instabug.library.internal.theming.a locala2 = com.instabug.library.internal.theming.b.a(this.a);
        return locala2;
      }
      catch (ClassNotFoundException localClassNotFoundException2)
      {
        try
        {
          Class.forName("com.actionbarsherlock.app.SherlockActivity");
          Instabug.a.a("ActionBarSherlock found, loading theme");
          new com.instabug.library.internal.theming.b();
          com.instabug.library.internal.theming.a locala1 = com.instabug.library.internal.theming.b.a(this.a);
          return locala1;
        }
        catch (ClassNotFoundException localClassNotFoundException3)
        {
          if (Build.VERSION.SDK_INT >= 14)
          {
            Instabug.a.a("No ActionBar libraries found, loading native theme");
            new com.instabug.library.internal.theming.b();
            return com.instabug.library.internal.theming.b.a(this.a);
          }
        }
      }
    }
    return null;
  }

  public final void a()
  {
    this.y = new com.instabug.library.util.f(this.a);
    Instabug.a.b(this.a);
    this.a.setContentView(this.y.a("instabug_activity_annotation", "layout"));
    this.c = ((AnnotationView)b(this.y.a("annotation_view", "id")));
    this.d = ((LinearLayout)b(this.y.a("instabug_lyt_color_picker", "id")));
    this.e = ((FrameLayout)b(this.y.a("instabug_composer_layout", "id")));
    this.f = ((FrameLayout)b(this.y.a("color_blue_button", "id")));
    this.g = ((FrameLayout)b(this.y.a("color_red_button", "id")));
    this.h = ((FrameLayout)b(this.y.a("color_green_button", "id")));
    this.i = ((FrameLayout)b(this.y.a("color_yellow_button", "id")));
    this.j = ((FrameLayout)b(this.y.a("color_orange_button", "id")));
    this.k = ((FrameLayout)b(this.y.a("color_gray_button", "id")));
    this.l = ((FrameLayout)b(this.y.a("button_pick_color", "id")));
    this.n = ((ImageButton)b(this.y.a("button_add_message", "id")));
    this.o = ((ImageButton)b(this.y.a("button_clear_all", "id")));
    this.s = ((ProgressBar)b(this.y.a("progress_spinner", "id")));
    this.t = ((EditText)b(this.y.a("user_email", "id")));
    this.r = b(this.y.a("email_separator", "id"));
    this.u = ((EditText)b(this.y.a("text_composer", "id")));
    this.u.setHint(Instabug.getInstance().getCommentHint());
    this.q = b(this.y.a("brush_stroke", "id"));
    this.p = ((ImageView)b(this.y.a("brush_icon", "id")));
    this.m = ((FrameLayout)b(this.y.a("annotation_view_holder", "id")));
    this.t.setOnEditorActionListener(this);
    this.u.setOnEditorActionListener(this);
    this.o.setOnClickListener(new c(this));
    this.e.setOnClickListener(new d(this));
    this.l.setOnClickListener(new e(this));
    this.q.setBackgroundColor(this.a.getResources().getColor(this.y.a("instabug_annotation_color_blue", "color")));
    this.n.setOnClickListener(new f(this));
    this.f.setOnClickListener(this);
    this.g.setOnClickListener(this);
    this.h.setOnClickListener(this);
    this.j.setOnClickListener(this);
    this.i.setOnClickListener(this);
    this.k.setOnClickListener(this);
    com.instabug.library.interactor.c localc = new com.instabug.library.interactor.c(Instabug.access$000(Instabug.getInstance().iG().a).d());
    com.instabug.library.internal.device.a locala = new com.instabug.library.internal.device.a(this.a.getApplication());
    com.instabug.library.model.b localb = com.instabug.library.model.b.a(Instabug.getInstance().getSettingsBundle(), Instabug.access$000(Instabug.getInstance().iG().a).u(), locala);
    com.instabug.library.internal.storage.a locala1 = new com.instabug.library.internal.storage.a(this.a.getApplicationContext());
    this.b = new com.instabug.library.presenter.a(this, localc, Instabug.getInstance().getSettingsBundle(), localb, locala1);
    b(this.y.a("instabug_btn_send", "id")).setOnClickListener(this);
    b(this.y.a("instabug_btn_back", "id")).setOnClickListener(this);
    Object localObject;
    if (this.a.getIntent().getBooleanExtra("com.instabug.load_own_theme", true))
      localObject = n();
    while (true)
    {
      b(this.y.a("instabug_titlebar", "id")).setBackgroundDrawable(((com.instabug.library.internal.theming.a)localObject).a);
      b(this.y.a("instabug_toolbar", "id")).setBackgroundDrawable(((com.instabug.library.internal.theming.a)localObject).b);
      this.d.setBackgroundDrawable(((com.instabug.library.internal.theming.a)localObject).b);
      TextView localTextView = (TextView)b(this.y.a("instabug_txt_title", "id"));
      label945: String str1;
      int i2;
      if (((com.instabug.library.internal.theming.a)localObject).d != 0)
      {
        localTextView.setTextAppearance(this.a, ((com.instabug.library.internal.theming.a)localObject).d);
        ((com.instabug.library.internal.theming.a)localObject).c = localTextView.getTextColors().getDefaultColor();
        this.v = ((com.instabug.library.internal.theming.a)localObject).c;
        this.p.setColorFilter(this.v, PorterDuff.Mode.SRC_ATOP);
        this.n.setColorFilter(this.v, PorterDuff.Mode.SRC_ATOP);
        this.o.setColorFilter(this.v, PorterDuff.Mode.SRC_ATOP);
        ((ImageView)b(this.y.a("instabug_btn_back", "id"))).setColorFilter(((com.instabug.library.internal.theming.a)localObject).c, PorterDuff.Mode.SRC_ATOP);
        ((ImageView)b(this.y.a("instabug_btn_send", "id"))).setColorFilter(((com.instabug.library.internal.theming.a)localObject).c, PorterDuff.Mode.SRC_ATOP);
        d.a locala4 = Instabug.getInstance().getFeedbackPopupColors();
        str1 = this.A;
        this.D = ((ImageView)b(this.y.a("instabug_logo", "id")));
        if (locala4 == null)
          break label1629;
        b(this.y.a("instabug_composer_internal_layout", "id")).setBackgroundColor(locala4.a);
        this.r.setBackgroundColor(locala4.c);
        this.u.setTextColor(locala4.b);
        this.u.setHintTextColor(locala4.c);
        this.t.setHintTextColor(locala4.c);
        this.t.setTextColor(locala4.b);
        int i1 = locala4.a;
        if (1.0D - (0.299D * Color.red(i1) + 0.587D * Color.green(i1) + 0.114D * Color.blue(i1)) / 255.0D >= 0.5D)
          break label1603;
        i2 = 0;
        label1241: if (i2 == 0)
          break label1629;
      }
      label1405: com.instabug.library.internal.theming.a locala2;
      label1603: label1617: label1629: for (String str2 = this.B; ; str2 = str1)
      {
        byte[] arrayOfByte = Base64.decode(str2.getBytes(), 0);
        Bitmap localBitmap = BitmapFactory.decodeByteArray(arrayOfByte, 0, arrayOfByte.length);
        this.D.setImageBitmap(localBitmap);
        this.C = ((TextView)b(this.y.a("instabug_pbi_text", "id")));
        String str3 = this.C.getText().toString();
        String str4;
        if (str3.contains("&name&"))
        {
          str4 = str3.replace("&name&", "Instabug");
          if ((str4.contains("&")) || (str4.contains(",")) || (str4.contains("  ")) || (str4.contains("_")) || (str4.contains("-")))
            str4 = "Feedback Powered by Instabug";
          this.C.setText(str4);
          if (Instabug.getInstance().getSettingsBundle().o())
          {
            Instabug.getInstance().getSettingsBundle().p();
            Instabug.getInstance().showAnimatedTutorial(this.a);
          }
          if (this.a.getExternalCacheDir() == null)
            break label1617;
        }
        for (File localFile1 = this.a.getExternalCacheDir(); ; localFile1 = this.a.getCacheDir())
        {
          File localFile2 = new File(localFile1, "com.instabug.library.settings");
          new b.a((byte)0).execute(new Object[] { localFile2, this });
          return;
          Instabug.access$000(Instabug.getInstance().iG().a);
          locala2 = h.b();
          if (locala2 != null)
            break label1636;
          com.instabug.library.internal.theming.a locala3 = new com.instabug.library.internal.theming.a();
          new ColorDrawable(-3355444);
          locala3.c = -1;
          locala3.a = new ColorDrawable(-16733521);
          locala3.b = new ColorDrawable(-16733521);
          localObject = locala3;
          break;
          localTextView.setTextColor(((com.instabug.library.internal.theming.a)localObject).c);
          break label945;
          i2 = 1;
          break label1241;
          str4 = "Feedback Powered by Instabug";
          break label1405;
        }
      }
      label1636: localObject = locala2;
    }
  }

  public final void a(int paramInt)
  {
    this.q.setBackgroundColor(this.a.getResources().getColor(paramInt));
    this.c.a(paramInt);
  }

  public final void a(Bitmap paramBitmap)
  {
    this.c.setImageBitmap(paramBitmap);
    this.c.setVisibility(0);
    this.s.setVisibility(8);
    this.c.post(new g(this));
  }

  public final void a(String paramString)
  {
    ((TextView)b(this.y.a("instabug_txt_title", "id"))).setText(paramString);
  }

  public final void a(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.t.setVisibility(0);
      this.r.setVisibility(0);
      return;
    }
    this.t.setVisibility(8);
    this.r.setVisibility(8);
  }

  public final void b()
  {
    this.b.b();
    if ((this.w != null) && (this.w.isShowing()))
      this.w.dismiss();
    try
    {
      this.c.getDrawable().setCallback(null);
      this.c.setDrawingCacheEnabled(false);
      this.c = null;
      this.d = null;
      this.e = null;
    }
    catch (Exception localException9)
    {
      try
      {
        this.f.getBackground().setCallback(null);
        this.f = null;
        this.g.getBackground().setCallback(null);
        this.g = null;
        this.h.getBackground().setCallback(null);
        this.h = null;
        this.i.getBackground().setCallback(null);
        this.i = null;
        this.j.getBackground().setCallback(null);
        this.j = null;
        this.k.getBackground().setCallback(null);
        this.k = null;
        this.l = null;
      }
      catch (Exception localException9)
      {
        try
        {
          this.n.getDrawable().setCallback(null);
          this.n = null;
        }
        catch (Exception localException9)
        {
          try
          {
            this.o.getDrawable().setCallback(null);
            this.o = null;
          }
          catch (Exception localException9)
          {
            try
            {
              this.s.getProgressDrawable().setCallback(null);
              this.s.getIndeterminateDrawable().setCallback(null);
              this.s = null;
              this.t = null;
            }
            catch (Exception localException9)
            {
              try
              {
                this.r.getBackground().setCallback(null);
                this.r = null;
                this.u = null;
              }
              catch (Exception localException9)
              {
                try
                {
                  this.q.getBackground().setCallback(null);
                  this.q = null;
                }
                catch (Exception localException9)
                {
                  try
                  {
                    this.p.getDrawable().setCallback(null);
                    this.p = null;
                  }
                  catch (Exception localException9)
                  {
                    try
                    {
                      this.m.getBackground().setCallback(null);
                      this.m = null;
                    }
                    catch (Exception localException9)
                    {
                      try
                      {
                        while (true)
                        {
                          null.setCallback(null);
                          null.setCallback(null);
                          this.y = null;
                          return;
                          localException1 = localException1;
                          this.c = null;
                          continue;
                          localException2 = localException2;
                          this.f = null;
                          this.g = null;
                          this.k = null;
                          this.h = null;
                          this.i = null;
                          this.j = null;
                          continue;
                          localException3 = localException3;
                          this.n = null;
                          continue;
                          localException4 = localException4;
                          this.o = null;
                          continue;
                          localException5 = localException5;
                          this.s = null;
                          continue;
                          localException6 = localException6;
                          this.r = null;
                          continue;
                          localException7 = localException7;
                          this.q = null;
                          continue;
                          localException8 = localException8;
                          this.p = null;
                          continue;
                          localException9 = localException9;
                          this.m = null;
                        }
                      }
                      catch (Exception localException10)
                      {
                        while (true)
                        {
                          this.x = null;
                          this.z = null;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  public final void b(String paramString)
  {
    this.t.setText(paramString);
  }

  public final String c()
  {
    return this.a.getIntent().getExtras().getString("com.instabug.snapshot_file_path");
  }

  public final void c(String paramString)
  {
    this.t.setHint(paramString);
  }

  public final Bitmap d()
  {
    this.c.setDrawingCacheEnabled(true);
    return this.c.getDrawingCache();
  }

  public final void d(String paramString)
  {
    this.u.setHint(paramString);
  }

  public final String e()
  {
    return this.t.getText().toString();
  }

  public final void e(String paramString)
  {
    l();
    Toast localToast = Toast.makeText(this.a, paramString, 1);
    localToast.setGravity(17, 0, 0);
    localToast.show();
    this.t.requestFocus();
  }

  public final String f()
  {
    return this.u.getText().toString();
  }

  public final void f(String paramString)
  {
    l();
    Toast localToast = Toast.makeText(this.a, paramString, 1);
    localToast.setGravity(17, 0, 0);
    localToast.show();
    this.u.requestFocus();
  }

  public final void g()
  {
    if ((this.w != null) && (this.w.isShowing()))
      this.w.dismiss();
    this.a.finish();
  }

  public final void g(String paramString)
  {
    this.w = ProgressDialog.show(this.a, null, paramString, false, false);
  }

  public final void h()
  {
    this.c.a();
  }

  public final void h(String paramString)
  {
    if ((this.w != null) && (this.w.isShowing()))
      this.w.dismiss();
    Toast localToast = Toast.makeText(this.a, paramString, 1);
    localToast.setGravity(17, 0, 0);
    localToast.show();
    this.a.finish();
  }

  public final void i()
  {
    this.b.a();
  }

  public final void j()
  {
    if (this.e.getVisibility() == 0)
    {
      k();
      return;
    }
    this.b.d();
  }

  public final void onClick(View paramView)
  {
    int i1 = paramView.getId();
    if (i1 == this.y.a("instabug_btn_back", "id"))
    {
      this.b.d();
      return;
    }
    if (i1 == this.y.a("instabug_btn_send", "id"))
    {
      this.b.c();
      return;
    }
    m();
    int i2 = this.y.a("instabug_annotation_color_blue", "color");
    if (paramView.equals(this.f))
      i2 = this.y.a("instabug_annotation_color_blue", "color");
    while (true)
    {
      this.b.a(i2);
      return;
      if (paramView.equals(this.g))
        i2 = this.y.a("instabug_annotation_color_red", "color");
      else if (paramView.equals(this.h))
        i2 = this.y.a("instabug_annotation_color_green", "color");
      else if (paramView.equals(this.k))
        i2 = this.y.a("instabug_annotation_color_gray", "color");
      else if (paramView.equals(this.i))
        i2 = this.y.a("instabug_annotation_color_yellow", "color");
      else if (paramView.equals(this.j))
        i2 = this.y.a("instabug_annotation_color_orange", "color");
    }
  }

  public final boolean onEditorAction(TextView paramTextView, int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramKeyEvent != null);
    try
    {
      paramKeyEvent.getKeyCode();
      if (paramInt == 6)
        this.b.c();
      return false;
    }
    catch (Exception localException)
    {
      while (true)
        localException.printStackTrace();
    }
  }
}