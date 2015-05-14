package com.squareup.picasso;

import android.content.Context;
import android.graphics.Bitmap;
import java.io.IOException;

class ContentStreamBitmapHunter extends BitmapHunter
{
  final Context context;

  ContentStreamBitmapHunter(Context paramContext, Picasso paramPicasso, Dispatcher paramDispatcher, Cache paramCache, Stats paramStats, Action paramAction)
  {
    super(paramPicasso, paramDispatcher, paramCache, paramStats, paramAction);
    this.context = paramContext;
  }

  Bitmap decode(Request paramRequest)
    throws IOException
  {
    return decodeContentStream(paramRequest);
  }

  // ERROR //
  protected Bitmap decodeContentStream(Request paramRequest)
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 13\011com/squareup/picasso/ContentStreamBitmapHunter:context\011Landroid/content/Context;
    //   4: invokevirtual 26\011android/content/Context:getContentResolver\011()Landroid/content/ContentResolver;
    //   7: astore_2
    //   8: aload_1
    //   9: invokestatic 30\011com/squareup/picasso/ContentStreamBitmapHunter:createBitmapOptions\011(Lcom/squareup/picasso/Request;)Landroid/graphics/BitmapFactory$Options;
    //   12: astore_3
    //   13: aload_3
    //   14: invokestatic 34\011com/squareup/picasso/ContentStreamBitmapHunter:requiresInSampleSize\011(Landroid/graphics/BitmapFactory$Options;)Z
    //   17: ifeq +41 -> 58
    //   20: aconst_null
    //   21: astore 7
    //   23: aload_2
    //   24: aload_1
    //   25: getfield 40\011com/squareup/picasso/Request:uri\011Landroid/net/Uri;
    //   28: invokevirtual 46\011android/content/ContentResolver:openInputStream\011(Landroid/net/Uri;)Ljava/io/InputStream;
    //   31: astore 7
    //   33: aload 7
    //   35: aconst_null
    //   36: aload_3
    //   37: invokestatic 52\011android/graphics/BitmapFactory:decodeStream\011(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   40: pop
    //   41: aload 7
    //   43: invokestatic 58\011com/squareup/picasso/Utils:closeQuietly\011(Ljava/io/InputStream;)V
    //   46: aload_1
    //   47: getfield 62\011com/squareup/picasso/Request:targetWidth\011I
    //   50: aload_1
    //   51: getfield 65\011com/squareup/picasso/Request:targetHeight\011I
    //   54: aload_3
    //   55: invokestatic 69\011com/squareup/picasso/ContentStreamBitmapHunter:calculateInSampleSize\011(IILandroid/graphics/BitmapFactory$Options;)V
    //   58: aload_2
    //   59: aload_1
    //   60: getfield 40\011com/squareup/picasso/Request:uri\011Landroid/net/Uri;
    //   63: invokevirtual 46\011android/content/ContentResolver:openInputStream\011(Landroid/net/Uri;)Ljava/io/InputStream;
    //   66: astore 4
    //   68: aload 4
    //   70: aconst_null
    //   71: aload_3
    //   72: invokestatic 52\011android/graphics/BitmapFactory:decodeStream\011(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   75: astore 6
    //   77: aload 4
    //   79: invokestatic 58\011com/squareup/picasso/Utils:closeQuietly\011(Ljava/io/InputStream;)V
    //   82: aload 6
    //   84: areturn
    //   85: astore 8
    //   87: aload 7
    //   89: invokestatic 58\011com/squareup/picasso/Utils:closeQuietly\011(Ljava/io/InputStream;)V
    //   92: aload 8
    //   94: athrow
    //   95: astore 5
    //   97: aload 4
    //   99: invokestatic 58\011com/squareup/picasso/Utils:closeQuietly\011(Ljava/io/InputStream;)V
    //   102: aload 5
    //   104: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   23\01141\01185\011finally
    //   68\01177\01195\011finally
  }

  Picasso.LoadedFrom getLoadedFrom()
  {
    return Picasso.LoadedFrom.DISK;
  }
}