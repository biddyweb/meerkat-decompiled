package com.squareup.picasso;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.net.Uri;
import java.io.IOException;

class AssetBitmapHunter extends BitmapHunter
{
  protected static final String ANDROID_ASSET = "android_asset";
  private static final int ASSET_PREFIX_LENGTH = "file:///android_asset/".length();
  private final AssetManager assetManager;

  public AssetBitmapHunter(Context paramContext, Picasso paramPicasso, Dispatcher paramDispatcher, Cache paramCache, Stats paramStats, Action paramAction)
  {
    super(paramPicasso, paramDispatcher, paramCache, paramStats, paramAction);
    this.assetManager = paramContext.getAssets();
  }

  Bitmap decode(Request paramRequest)
    throws IOException
  {
    return decodeAsset(paramRequest.uri.toString().substring(ASSET_PREFIX_LENGTH));
  }

  // ERROR //
  Bitmap decodeAsset(String paramString)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 65\011com/squareup/picasso/AssetBitmapHunter:data\011Lcom/squareup/picasso/Request;
    //   4: invokestatic 69\011com/squareup/picasso/AssetBitmapHunter:createBitmapOptions\011(Lcom/squareup/picasso/Request;)Landroid/graphics/BitmapFactory$Options;
    //   7: astore_2
    //   8: aload_2
    //   9: invokestatic 73\011com/squareup/picasso/AssetBitmapHunter:requiresInSampleSize\011(Landroid/graphics/BitmapFactory$Options;)Z
    //   12: ifeq +47 -> 59
    //   15: aconst_null
    //   16: astore 6
    //   18: aload_0
    //   19: getfield 37\011com/squareup/picasso/AssetBitmapHunter:assetManager\011Landroid/content/res/AssetManager;
    //   22: aload_1
    //   23: invokevirtual 79\011android/content/res/AssetManager:open\011(Ljava/lang/String;)Ljava/io/InputStream;
    //   26: astore 6
    //   28: aload 6
    //   30: aconst_null
    //   31: aload_2
    //   32: invokestatic 85\011android/graphics/BitmapFactory:decodeStream\011(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   35: pop
    //   36: aload 6
    //   38: invokestatic 91\011com/squareup/picasso/Utils:closeQuietly\011(Ljava/io/InputStream;)V
    //   41: aload_0
    //   42: getfield 65\011com/squareup/picasso/AssetBitmapHunter:data\011Lcom/squareup/picasso/Request;
    //   45: getfield 94\011com/squareup/picasso/Request:targetWidth\011I
    //   48: aload_0
    //   49: getfield 65\011com/squareup/picasso/AssetBitmapHunter:data\011Lcom/squareup/picasso/Request;
    //   52: getfield 97\011com/squareup/picasso/Request:targetHeight\011I
    //   55: aload_2
    //   56: invokestatic 101\011com/squareup/picasso/AssetBitmapHunter:calculateInSampleSize\011(IILandroid/graphics/BitmapFactory$Options;)V
    //   59: aload_0
    //   60: getfield 37\011com/squareup/picasso/AssetBitmapHunter:assetManager\011Landroid/content/res/AssetManager;
    //   63: aload_1
    //   64: invokevirtual 79\011android/content/res/AssetManager:open\011(Ljava/lang/String;)Ljava/io/InputStream;
    //   67: astore_3
    //   68: aload_3
    //   69: aconst_null
    //   70: aload_2
    //   71: invokestatic 85\011android/graphics/BitmapFactory:decodeStream\011(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   74: astore 5
    //   76: aload_3
    //   77: invokestatic 91\011com/squareup/picasso/Utils:closeQuietly\011(Ljava/io/InputStream;)V
    //   80: aload 5
    //   82: areturn
    //   83: astore 7
    //   85: aload 6
    //   87: invokestatic 91\011com/squareup/picasso/Utils:closeQuietly\011(Ljava/io/InputStream;)V
    //   90: aload 7
    //   92: athrow
    //   93: astore 4
    //   95: aload_3
    //   96: invokestatic 91\011com/squareup/picasso/Utils:closeQuietly\011(Ljava/io/InputStream;)V
    //   99: aload 4
    //   101: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   18\01136\01183\011finally
    //   68\01176\01193\011finally
  }

  Picasso.LoadedFrom getLoadedFrom()
  {
    return Picasso.LoadedFrom.DISK;
  }
}