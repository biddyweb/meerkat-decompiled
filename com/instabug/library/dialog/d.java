package com.instabug.library.dialog;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.instabug.library.Instabug;
import com.instabug.library.Instabug.a;
import com.instabug.library.interactor.c;
import com.instabug.library.x;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.lang.ref.WeakReference;
import org.json.JSONObject;

public final class d extends Dialog
  implements com.instabug.library.view.b
{
  private EditText a;
  private EditText b;
  private TextView c;
  private View d;
  private com.instabug.library.presenter.e e;
  private a f;
  private String g = "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";
  private String h = "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";
  private TextView i;
  private ImageView j;

  public d(Context paramContext, a parama, c paramc, com.instabug.library.model.b paramb)
  {
    super(paramContext);
    this.f = parama;
    requestWindowFeature(1);
    Resources localResources = paramContext.getResources();
    setContentView(LayoutInflater.from(paramContext).inflate(localResources.getIdentifier("instabug_lyt_dialog_composer_standalone", "layout", paramContext.getPackageName()), null, false));
    this.d = findViewById(localResources.getIdentifier("email_separator", "id", paramContext.getPackageName()));
    this.b = ((EditText)findViewById(localResources.getIdentifier("user_email", "id", paramContext.getPackageName())));
    this.a = ((EditText)findViewById(localResources.getIdentifier("text_composer", "id", paramContext.getPackageName())));
    this.c = ((TextView)findViewById(localResources.getIdentifier("send_message", "id", paramContext.getPackageName())));
    this.i = ((TextView)findViewById(localResources.getIdentifier("instabug_pbi_text", "id", paramContext.getPackageName())));
    String str1 = this.i.getText().toString();
    String str2;
    String str3;
    int m;
    if (str1.contains("&name&"))
    {
      str2 = str1.replace("&name&", "Instabug");
      if ((str2.contains("&")) || (str2.contains(",")) || (str2.contains("  ")) || (str2.contains("_")) || (str2.contains("-")))
        str2 = "Feedback Powered by Instabug";
      this.i.setText(str2);
      str3 = this.g;
      this.j = ((ImageView)findViewById(localResources.getIdentifier("instabug_logo", "id", paramContext.getPackageName())));
      if (this.f == null)
        break label694;
      this.d.setBackgroundColor(this.f.c);
      this.a.setTextColor(this.f.b);
      this.a.setHintTextColor(this.f.c);
      this.b.setHintTextColor(this.f.c);
      this.b.setTextColor(this.f.b);
      this.c.setTextColor(this.f.b);
      if (Build.VERSION.SDK_INT >= 11)
        this.c.getBackground().setColorFilter(this.f.a, PorterDuff.Mode.OVERLAY);
      int k = this.f.a;
      if (1.0D - (0.299D * Color.red(k) + 0.587D * Color.green(k) + 0.114D * Color.blue(k)) / 255.0D >= 0.5D)
        break label679;
      m = 0;
      label481: if (m == 0)
        break label694;
    }
    label679: label694: for (String str4 = this.h; ; str4 = str3)
    {
      byte[] arrayOfByte = Base64.decode(str4.getBytes(), 0);
      Bitmap localBitmap = BitmapFactory.decodeByteArray(arrayOfByte, 0, arrayOfByte.length);
      this.j.setImageBitmap(localBitmap);
      String str5 = Instabug.getInstance().getSettingsBundle().c();
      if (str5 != null)
        this.c.setText(str5);
      this.c.setOnClickListener(new f(this));
      setOnCancelListener(new g(this));
      this.e = new com.instabug.library.presenter.e(this, paramc, Instabug.getInstance().getSettingsBundle(), paramb);
      setOwnerActivity((Activity)paramContext);
      ((Activity)paramContext).runOnUiThread(new e(this));
      if (paramContext.getExternalCacheDir() != null);
      for (File localFile1 = paramContext.getExternalCacheDir(); ; localFile1 = paramContext.getCacheDir())
      {
        File localFile2 = new File(localFile1, "com.instabug.library.settings");
        new b((byte)0).execute(new Object[] { localFile2, this });
        return;
        str2 = "Feedback Powered by Instabug";
        break;
        m = 1;
        break label481;
      }
    }
  }

  public final String a()
  {
    return this.b.getText().toString().trim();
  }

  public final void a(String paramString)
  {
    this.b.setText(paramString);
  }

  public final void a(boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      this.b.setVisibility(8);
      this.d.setVisibility(8);
      return;
    }
    this.b.setVisibility(0);
    this.d.setVisibility(0);
  }

  public final String b()
  {
    return this.a.getText().toString().trim();
  }

  public final void b(String paramString)
  {
    this.b.setHint(paramString);
  }

  public final void c()
  {
    Instabug.a.a(getOwnerActivity());
    dismiss();
  }

  public final void c(String paramString)
  {
    this.a.setHint(paramString);
  }

  public final void d(String paramString)
  {
    Toast localToast = Toast.makeText(getContext(), paramString, 1);
    localToast.setGravity(17, 0, 0);
    localToast.show();
    this.b.requestFocus();
  }

  public final void e(String paramString)
  {
    Toast localToast = Toast.makeText(getContext(), paramString, 1);
    localToast.setGravity(17, 0, 0);
    localToast.show();
    this.a.requestFocus();
  }

  public final void f(String paramString)
  {
    Instabug.a.a(getOwnerActivity());
    Toast localToast = Toast.makeText(getContext(), paramString, 1);
    localToast.setGravity(17, 0, 0);
    localToast.show();
    dismiss();
  }

  public static final class a
  {
    public int a;
    public int b;
    public int c;
  }

  static final class b extends AsyncTask
  {
    private WeakReference a;

    private JSONObject a(Object[] paramArrayOfObject)
    {
      try
      {
        this.a = new WeakReference((d)paramArrayOfObject[1]);
        JSONObject localJSONObject = new JSONObject(new BufferedReader(new FileReader((File)paramArrayOfObject[0])).readLine());
        return localJSONObject;
      }
      catch (Exception localException)
      {
      }
      return null;
    }
  }
}