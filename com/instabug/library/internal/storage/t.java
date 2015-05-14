package com.instabug.library.internal.storage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.os.AsyncTask;
import android.os.Environment;
import com.instabug.library.Instabug.a;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ref.WeakReference;

public class t extends AsyncTask
{
  private final WeakReference a;
  private String b;

  public t(Context paramContext, String paramString)
  {
    this.b = paramString;
    this.a = new WeakReference(paramContext);
  }

  private File a(Bitmap[] paramArrayOfBitmap)
  {
    String str = this.b;
    File localFile2;
    if (this.a.get() != null)
    {
      File localFile1 = new File(((Context)this.a.get()).getExternalFilesDir(Environment.DIRECTORY_PICTURES) + "/instabug/");
      localFile1.mkdirs();
      localFile2 = new File(localFile1, "bug_" + System.currentTimeMillis() + "_" + str + ".png");
    }
    try
    {
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile2);
      Instabug.a.a("Image Path: " + localFile2.getAbsolutePath());
      paramArrayOfBitmap[0].compress(Bitmap.CompressFormat.PNG, 100, localFileOutputStream);
      localFileOutputStream.close();
      return localFile2;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      Instabug.a.d("File not found: " + localFileNotFoundException.getMessage());
      return null;
    }
    catch (IOException localIOException)
    {
      while (true)
        Instabug.a.d("Error accessing file: " + localIOException.getMessage());
    }
  }
}