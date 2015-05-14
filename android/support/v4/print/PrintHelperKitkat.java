package android.support.v4.print;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.CancellationSignal.OnCancelListener;
import android.print.PrintAttributes;
import android.print.PrintAttributes.Builder;
import android.print.PrintAttributes.MediaSize;
import android.print.PrintDocumentAdapter;
import android.print.PrintDocumentAdapter.LayoutResultCallback;
import android.print.PrintDocumentInfo;
import android.print.PrintDocumentInfo.Builder;
import android.print.PrintManager;
import android.util.Log;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

class PrintHelperKitkat
{
  public static final int COLOR_MODE_COLOR = 2;
  public static final int COLOR_MODE_MONOCHROME = 1;
  private static final String LOG_TAG = "PrintHelperKitkat";
  private static final int MAX_PRINT_SIZE = 3500;
  public static final int ORIENTATION_LANDSCAPE = 1;
  public static final int ORIENTATION_PORTRAIT = 2;
  public static final int SCALE_MODE_FILL = 2;
  public static final int SCALE_MODE_FIT = 1;
  int mColorMode = 2;
  final Context mContext;
  BitmapFactory.Options mDecodeOptions = null;
  private final Object mLock = new Object();
  int mOrientation = 1;
  int mScaleMode = 2;

  PrintHelperKitkat(Context paramContext)
  {
    this.mContext = paramContext;
  }

  private Matrix getMatrix(int paramInt1, int paramInt2, RectF paramRectF, int paramInt3)
  {
    Matrix localMatrix = new Matrix();
    float f1 = paramRectF.width() / paramInt1;
    if (paramInt3 == 2);
    for (float f2 = Math.max(f1, paramRectF.height() / paramInt2); ; f2 = Math.min(f1, paramRectF.height() / paramInt2))
    {
      localMatrix.postScale(f2, f2);
      localMatrix.postTranslate((paramRectF.width() - f2 * paramInt1) / 2.0F, (paramRectF.height() - f2 * paramInt2) / 2.0F);
      return localMatrix;
    }
  }

  private Bitmap loadBitmap(Uri paramUri, BitmapFactory.Options paramOptions)
    throws FileNotFoundException
  {
    if ((paramUri == null) || (this.mContext == null))
      throw new IllegalArgumentException("bad argument to loadBitmap");
    InputStream localInputStream = null;
    try
    {
      localInputStream = this.mContext.getContentResolver().openInputStream(paramUri);
      Bitmap localBitmap = BitmapFactory.decodeStream(localInputStream, null, paramOptions);
      if (localInputStream != null);
      try
      {
        localInputStream.close();
        return localBitmap;
      }
      catch (IOException localIOException2)
      {
        Log.w("PrintHelperKitkat", "close fail ", localIOException2);
        return localBitmap;
      }
    }
    finally
    {
      if (localInputStream == null);
    }
    try
    {
      localInputStream.close();
      throw localObject;
    }
    catch (IOException localIOException1)
    {
      while (true)
        Log.w("PrintHelperKitkat", "close fail ", localIOException1);
    }
  }

  // ERROR //
  private Bitmap loadConstrainedBitmap(Uri paramUri, int paramInt)
    throws FileNotFoundException
  {
    // Byte code:
    //   0: iload_2
    //   1: ifle +14 -> 15
    //   4: aload_1
    //   5: ifnull +10 -> 15
    //   8: aload_0
    //   9: getfield 45\011android/support/v4/print/PrintHelperKitkat:mContext\011Landroid/content/Context;
    //   12: ifnonnull +13 -> 25
    //   15: new 95\011java/lang/IllegalArgumentException
    //   18: dup
    //   19: ldc 133
    //   21: invokespecial 100\011java/lang/IllegalArgumentException:<init>\011(Ljava/lang/String;)V
    //   24: athrow
    //   25: new 135\011android/graphics/BitmapFactory$Options
    //   28: dup
    //   29: invokespecial 136\011android/graphics/BitmapFactory$Options:<init>\011()V
    //   32: astore_3
    //   33: aload_3
    //   34: iconst_1
    //   35: putfield 140\011android/graphics/BitmapFactory$Options:inJustDecodeBounds\011Z
    //   38: aload_0
    //   39: aload_1
    //   40: aload_3
    //   41: invokespecial 142\011android/support/v4/print/PrintHelperKitkat:loadBitmap\011(Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   44: pop
    //   45: aload_3
    //   46: getfield 145\011android/graphics/BitmapFactory$Options:outWidth\011I
    //   49: istore 5
    //   51: aload_3
    //   52: getfield 148\011android/graphics/BitmapFactory$Options:outHeight\011I
    //   55: istore 6
    //   57: iload 5
    //   59: ifle +8 -> 67
    //   62: iload 6
    //   64: ifgt +5 -> 69
    //   67: aconst_null
    //   68: areturn
    //   69: iload 5
    //   71: iload 6
    //   73: invokestatic 151\011java/lang/Math:max\011(II)I
    //   76: istore 7
    //   78: iconst_1
    //   79: istore 8
    //   81: iload 7
    //   83: iload_2
    //   84: if_icmple +18 -> 102
    //   87: iload 7
    //   89: iconst_1
    //   90: iushr
    //   91: istore 7
    //   93: iload 8
    //   95: iconst_1
    //   96: ishl
    //   97: istore 8
    //   99: goto -18 -> 81
    //   102: iload 8
    //   104: ifle -37 -> 67
    //   107: iload 5
    //   109: iload 6
    //   111: invokestatic 153\011java/lang/Math:min\011(II)I
    //   114: iload 8
    //   116: idiv
    //   117: ifle -50 -> 67
    //   120: aload_0
    //   121: getfield 37\011android/support/v4/print/PrintHelperKitkat:mLock\011Ljava/lang/Object;
    //   124: astore 9
    //   126: aload 9
    //   128: monitorenter
    //   129: aload_0
    //   130: new 135\011android/graphics/BitmapFactory$Options
    //   133: dup
    //   134: invokespecial 136\011android/graphics/BitmapFactory$Options:<init>\011()V
    //   137: putfield 35\011android/support/v4/print/PrintHelperKitkat:mDecodeOptions\011Landroid/graphics/BitmapFactory$Options;
    //   140: aload_0
    //   141: getfield 35\011android/support/v4/print/PrintHelperKitkat:mDecodeOptions\011Landroid/graphics/BitmapFactory$Options;
    //   144: iconst_1
    //   145: putfield 156\011android/graphics/BitmapFactory$Options:inMutable\011Z
    //   148: aload_0
    //   149: getfield 35\011android/support/v4/print/PrintHelperKitkat:mDecodeOptions\011Landroid/graphics/BitmapFactory$Options;
    //   152: iload 8
    //   154: putfield 159\011android/graphics/BitmapFactory$Options:inSampleSize\011I
    //   157: aload_0
    //   158: getfield 35\011android/support/v4/print/PrintHelperKitkat:mDecodeOptions\011Landroid/graphics/BitmapFactory$Options;
    //   161: astore 11
    //   163: aload 9
    //   165: monitorexit
    //   166: aload_0
    //   167: aload_1
    //   168: aload 11
    //   170: invokespecial 142\011android/support/v4/print/PrintHelperKitkat:loadBitmap\011(Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   173: astore 15
    //   175: aload_0
    //   176: getfield 37\011android/support/v4/print/PrintHelperKitkat:mLock\011Ljava/lang/Object;
    //   179: astore 16
    //   181: aload 16
    //   183: monitorenter
    //   184: aload_0
    //   185: aconst_null
    //   186: putfield 35\011android/support/v4/print/PrintHelperKitkat:mDecodeOptions\011Landroid/graphics/BitmapFactory$Options;
    //   189: aload 16
    //   191: monitorexit
    //   192: aload 15
    //   194: areturn
    //   195: astore 17
    //   197: aload 16
    //   199: monitorexit
    //   200: aload 17
    //   202: athrow
    //   203: astore 10
    //   205: aload 9
    //   207: monitorexit
    //   208: aload 10
    //   210: athrow
    //   211: astore 12
    //   213: aload_0
    //   214: getfield 37\011android/support/v4/print/PrintHelperKitkat:mLock\011Ljava/lang/Object;
    //   217: astore 13
    //   219: aload 13
    //   221: monitorenter
    //   222: aload_0
    //   223: aconst_null
    //   224: putfield 35\011android/support/v4/print/PrintHelperKitkat:mDecodeOptions\011Landroid/graphics/BitmapFactory$Options;
    //   227: aload 13
    //   229: monitorexit
    //   230: aload 12
    //   232: athrow
    //   233: astore 14
    //   235: aload 13
    //   237: monitorexit
    //   238: aload 14
    //   240: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   184\011192\011195\011finally
    //   197\011200\011195\011finally
    //   129\011166\011203\011finally
    //   205\011208\011203\011finally
    //   166\011175\011211\011finally
    //   222\011230\011233\011finally
    //   235\011238\011233\011finally
  }

  public int getColorMode()
  {
    return this.mColorMode;
  }

  public int getOrientation()
  {
    return this.mOrientation;
  }

  public int getScaleMode()
  {
    return this.mScaleMode;
  }

  public void printBitmap(final String paramString, final Bitmap paramBitmap, final OnPrintFinishCallback paramOnPrintFinishCallback)
  {
    if (paramBitmap == null)
      return;
    final int i = this.mScaleMode;
    PrintManager localPrintManager = (PrintManager)this.mContext.getSystemService("print");
    PrintAttributes.MediaSize localMediaSize = PrintAttributes.MediaSize.UNKNOWN_PORTRAIT;
    if (paramBitmap.getWidth() > paramBitmap.getHeight())
      localMediaSize = PrintAttributes.MediaSize.UNKNOWN_LANDSCAPE;
    PrintAttributes localPrintAttributes = new PrintAttributes.Builder().setMediaSize(localMediaSize).setColorMode(this.mColorMode).build();
    localPrintManager.print(paramString, new PrintDocumentAdapter()
    {
      private PrintAttributes mAttributes;

      public void onFinish()
      {
        if (paramOnPrintFinishCallback != null)
          paramOnPrintFinishCallback.onFinish();
      }

      public void onLayout(PrintAttributes paramAnonymousPrintAttributes1, PrintAttributes paramAnonymousPrintAttributes2, CancellationSignal paramAnonymousCancellationSignal, PrintDocumentAdapter.LayoutResultCallback paramAnonymousLayoutResultCallback, Bundle paramAnonymousBundle)
      {
        int i = 1;
        this.mAttributes = paramAnonymousPrintAttributes2;
        PrintDocumentInfo localPrintDocumentInfo = new PrintDocumentInfo.Builder(paramString).setContentType(i).setPageCount(i).build();
        if (!paramAnonymousPrintAttributes2.equals(paramAnonymousPrintAttributes1));
        while (true)
        {
          paramAnonymousLayoutResultCallback.onLayoutFinished(localPrintDocumentInfo, i);
          return;
          int j = 0;
        }
      }

      // ERROR //
      public void onWrite(android.print.PageRange[] paramAnonymousArrayOfPageRange, android.os.ParcelFileDescriptor paramAnonymousParcelFileDescriptor, CancellationSignal paramAnonymousCancellationSignal, android.print.PrintDocumentAdapter.WriteResultCallback paramAnonymousWriteResultCallback)
      {
        // Byte code:
        //   0: new 79\011android/print/pdf/PrintedPdfDocument
        //   3: dup
        //   4: aload_0
        //   5: getfield 25\011android/support/v4/print/PrintHelperKitkat$1:this$0\011Landroid/support/v4/print/PrintHelperKitkat;
        //   8: getfield 83\011android/support/v4/print/PrintHelperKitkat:mContext\011Landroid/content/Context;
        //   11: aload_0
        //   12: getfield 45\011android/support/v4/print/PrintHelperKitkat$1:mAttributes\011Landroid/print/PrintAttributes;
        //   15: invokespecial 86\011android/print/pdf/PrintedPdfDocument:<init>\011(Landroid/content/Context;Landroid/print/PrintAttributes;)V
        //   18: astore 5
        //   20: aload 5
        //   22: iconst_1
        //   23: invokevirtual 90\011android/print/pdf/PrintedPdfDocument:startPage\011(I)Landroid/graphics/pdf/PdfDocument$Page;
        //   26: astore 8
        //   28: new 92\011android/graphics/RectF
        //   31: dup
        //   32: aload 8
        //   34: invokevirtual 98\011android/graphics/pdf/PdfDocument$Page:getInfo\011()Landroid/graphics/pdf/PdfDocument$PageInfo;
        //   37: invokevirtual 104\011android/graphics/pdf/PdfDocument$PageInfo:getContentRect\011()Landroid/graphics/Rect;
        //   40: invokespecial 107\011android/graphics/RectF:<init>\011(Landroid/graphics/Rect;)V
        //   43: astore 9
        //   45: aload_0
        //   46: getfield 25\011android/support/v4/print/PrintHelperKitkat$1:this$0\011Landroid/support/v4/print/PrintHelperKitkat;
        //   49: aload_0
        //   50: getfield 29\011android/support/v4/print/PrintHelperKitkat$1:val$bitmap\011Landroid/graphics/Bitmap;
        //   53: invokevirtual 113\011android/graphics/Bitmap:getWidth\011()I
        //   56: aload_0
        //   57: getfield 29\011android/support/v4/print/PrintHelperKitkat$1:val$bitmap\011Landroid/graphics/Bitmap;
        //   60: invokevirtual 116\011android/graphics/Bitmap:getHeight\011()I
        //   63: aload 9
        //   65: aload_0
        //   66: getfield 31\011android/support/v4/print/PrintHelperKitkat$1:val$fittingMode\011I
        //   69: invokestatic 120\011android/support/v4/print/PrintHelperKitkat:access$000\011(Landroid/support/v4/print/PrintHelperKitkat;IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;
        //   72: astore 10
        //   74: aload 8
        //   76: invokevirtual 124\011android/graphics/pdf/PdfDocument$Page:getCanvas\011()Landroid/graphics/Canvas;
        //   79: aload_0
        //   80: getfield 29\011android/support/v4/print/PrintHelperKitkat$1:val$bitmap\011Landroid/graphics/Bitmap;
        //   83: aload 10
        //   85: aconst_null
        //   86: invokevirtual 130\011android/graphics/Canvas:drawBitmap\011(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
        //   89: aload 5
        //   91: aload 8
        //   93: invokevirtual 134\011android/print/pdf/PrintedPdfDocument:finishPage\011(Landroid/graphics/pdf/PdfDocument$Page;)V
        //   96: aload 5
        //   98: new 136\011java/io/FileOutputStream
        //   101: dup
        //   102: aload_2
        //   103: invokevirtual 142\011android/os/ParcelFileDescriptor:getFileDescriptor\011()Ljava/io/FileDescriptor;
        //   106: invokespecial 145\011java/io/FileOutputStream:<init>\011(Ljava/io/FileDescriptor;)V
        //   109: invokevirtual 149\011android/print/pdf/PrintedPdfDocument:writeTo\011(Ljava/io/OutputStream;)V
        //   112: iconst_1
        //   113: anewarray 151\011android/print/PageRange
        //   116: astore 14
        //   118: aload 14
        //   120: iconst_0
        //   121: getstatic 155\011android/print/PageRange:ALL_PAGES\011Landroid/print/PageRange;
        //   124: aastore
        //   125: aload 4
        //   127: aload 14
        //   129: invokevirtual 161\011android/print/PrintDocumentAdapter$WriteResultCallback:onWriteFinished\011([Landroid/print/PageRange;)V
        //   132: aload 5
        //   134: ifnull +8 -> 142
        //   137: aload 5
        //   139: invokevirtual 164\011android/print/pdf/PrintedPdfDocument:close\011()V
        //   142: aload_2
        //   143: ifnull +7 -> 150
        //   146: aload_2
        //   147: invokevirtual 165\011android/os/ParcelFileDescriptor:close\011()V
        //   150: return
        //   151: astore 11
        //   153: ldc 167
        //   155: ldc 169
        //   157: aload 11
        //   159: invokestatic 175\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
        //   162: pop
        //   163: aload 4
        //   165: aconst_null
        //   166: invokevirtual 179\011android/print/PrintDocumentAdapter$WriteResultCallback:onWriteFailed\011(Ljava/lang/CharSequence;)V
        //   169: goto -37 -> 132
        //   172: astore 6
        //   174: aload 5
        //   176: ifnull +8 -> 184
        //   179: aload 5
        //   181: invokevirtual 164\011android/print/pdf/PrintedPdfDocument:close\011()V
        //   184: aload_2
        //   185: ifnull +7 -> 192
        //   188: aload_2
        //   189: invokevirtual 165\011android/os/ParcelFileDescriptor:close\011()V
        //   192: aload 6
        //   194: athrow
        //   195: astore 13
        //   197: return
        //   198: astore 7
        //   200: goto -8 -> 192
        //
        // Exception table:
        //   from\011to\011target\011type
        //   96\011132\011151\011java/io/IOException
        //   20\01196\011172\011finally
        //   96\011132\011172\011finally
        //   153\011169\011172\011finally
        //   146\011150\011195\011java/io/IOException
        //   188\011192\011198\011java/io/IOException
      }
    }
    , localPrintAttributes);
  }

  public void printBitmap(final String paramString, final Uri paramUri, final OnPrintFinishCallback paramOnPrintFinishCallback)
    throws FileNotFoundException
  {
    PrintDocumentAdapter local2 = new PrintDocumentAdapter()
    {
      private PrintAttributes mAttributes;
      Bitmap mBitmap = null;
      AsyncTask<Uri, Boolean, Bitmap> mLoadBitmap;

      private void cancelLoad()
      {
        synchronized (PrintHelperKitkat.this.mLock)
        {
          if (PrintHelperKitkat.this.mDecodeOptions != null)
          {
            PrintHelperKitkat.this.mDecodeOptions.requestCancelDecode();
            PrintHelperKitkat.this.mDecodeOptions = null;
          }
          return;
        }
      }

      public void onFinish()
      {
        super.onFinish();
        cancelLoad();
        if (this.mLoadBitmap != null)
          this.mLoadBitmap.cancel(true);
        if (paramOnPrintFinishCallback != null)
          paramOnPrintFinishCallback.onFinish();
      }

      public void onLayout(final PrintAttributes paramAnonymousPrintAttributes1, final PrintAttributes paramAnonymousPrintAttributes2, final CancellationSignal paramAnonymousCancellationSignal, final PrintDocumentAdapter.LayoutResultCallback paramAnonymousLayoutResultCallback, Bundle paramAnonymousBundle)
      {
        int i = 1;
        this.mAttributes = paramAnonymousPrintAttributes2;
        if (paramAnonymousCancellationSignal.isCanceled())
        {
          paramAnonymousLayoutResultCallback.onLayoutCancelled();
          return;
        }
        if (this.mBitmap != null)
        {
          PrintDocumentInfo localPrintDocumentInfo = new PrintDocumentInfo.Builder(paramString).setContentType(i).setPageCount(i).build();
          if (!paramAnonymousPrintAttributes2.equals(paramAnonymousPrintAttributes1));
          while (true)
          {
            paramAnonymousLayoutResultCallback.onLayoutFinished(localPrintDocumentInfo, i);
            return;
            int j = 0;
          }
        }
        this.mLoadBitmap = new AsyncTask()
        {
          protected Bitmap doInBackground(Uri[] paramAnonymous2ArrayOfUri)
          {
            try
            {
              Bitmap localBitmap = PrintHelperKitkat.this.loadConstrainedBitmap(PrintHelperKitkat.2.this.val$imageFile, 3500);
              return localBitmap;
            }
            catch (FileNotFoundException localFileNotFoundException)
            {
            }
            return null;
          }

          protected void onCancelled(Bitmap paramAnonymous2Bitmap)
          {
            paramAnonymousLayoutResultCallback.onLayoutCancelled();
            PrintHelperKitkat.2.this.mLoadBitmap = null;
          }

          protected void onPostExecute(Bitmap paramAnonymous2Bitmap)
          {
            int i = 1;
            super.onPostExecute(paramAnonymous2Bitmap);
            PrintHelperKitkat.2.this.mBitmap = paramAnonymous2Bitmap;
            if (paramAnonymous2Bitmap != null)
            {
              PrintDocumentInfo localPrintDocumentInfo = new PrintDocumentInfo.Builder(PrintHelperKitkat.2.this.val$jobName).setContentType(i).setPageCount(i).build();
              if (!paramAnonymousPrintAttributes2.equals(paramAnonymousPrintAttributes1))
                paramAnonymousLayoutResultCallback.onLayoutFinished(localPrintDocumentInfo, i);
            }
            while (true)
            {
              PrintHelperKitkat.2.this.mLoadBitmap = null;
              return;
              int j = 0;
              break;
              paramAnonymousLayoutResultCallback.onLayoutFailed(null);
            }
          }

          protected void onPreExecute()
          {
            paramAnonymousCancellationSignal.setOnCancelListener(new CancellationSignal.OnCancelListener()
            {
              public void onCancel()
              {
                PrintHelperKitkat.2.this.cancelLoad();
                PrintHelperKitkat.2.1.this.cancel(false);
              }
            });
          }
        }
        .execute(new Uri[0]);
      }

      // ERROR //
      public void onWrite(android.print.PageRange[] paramAnonymousArrayOfPageRange, android.os.ParcelFileDescriptor paramAnonymousParcelFileDescriptor, CancellationSignal paramAnonymousCancellationSignal, android.print.PrintDocumentAdapter.WriteResultCallback paramAnonymousWriteResultCallback)
      {
        // Byte code:
        //   0: new 133\011android/print/pdf/PrintedPdfDocument
        //   3: dup
        //   4: aload_0
        //   5: getfield 30\011android/support/v4/print/PrintHelperKitkat$2:this$0\011Landroid/support/v4/print/PrintHelperKitkat;
        //   8: getfield 137\011android/support/v4/print/PrintHelperKitkat:mContext\011Landroid/content/Context;
        //   11: aload_0
        //   12: getfield 79\011android/support/v4/print/PrintHelperKitkat$2:mAttributes\011Landroid/print/PrintAttributes;
        //   15: invokespecial 140\011android/print/pdf/PrintedPdfDocument:<init>\011(Landroid/content/Context;Landroid/print/PrintAttributes;)V
        //   18: astore 5
        //   20: aload 5
        //   22: iconst_1
        //   23: invokevirtual 144\011android/print/pdf/PrintedPdfDocument:startPage\011(I)Landroid/graphics/pdf/PdfDocument$Page;
        //   26: astore 8
        //   28: new 146\011android/graphics/RectF
        //   31: dup
        //   32: aload 8
        //   34: invokevirtual 152\011android/graphics/pdf/PdfDocument$Page:getInfo\011()Landroid/graphics/pdf/PdfDocument$PageInfo;
        //   37: invokevirtual 158\011android/graphics/pdf/PdfDocument$PageInfo:getContentRect\011()Landroid/graphics/Rect;
        //   40: invokespecial 161\011android/graphics/RectF:<init>\011(Landroid/graphics/Rect;)V
        //   43: astore 9
        //   45: aload_0
        //   46: getfield 30\011android/support/v4/print/PrintHelperKitkat$2:this$0\011Landroid/support/v4/print/PrintHelperKitkat;
        //   49: aload_0
        //   50: getfield 43\011android/support/v4/print/PrintHelperKitkat$2:mBitmap\011Landroid/graphics/Bitmap;
        //   53: invokevirtual 167\011android/graphics/Bitmap:getWidth\011()I
        //   56: aload_0
        //   57: getfield 43\011android/support/v4/print/PrintHelperKitkat$2:mBitmap\011Landroid/graphics/Bitmap;
        //   60: invokevirtual 170\011android/graphics/Bitmap:getHeight\011()I
        //   63: aload 9
        //   65: aload_0
        //   66: getfield 38\011android/support/v4/print/PrintHelperKitkat$2:val$fittingMode\011I
        //   69: invokestatic 174\011android/support/v4/print/PrintHelperKitkat:access$000\011(Landroid/support/v4/print/PrintHelperKitkat;IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;
        //   72: astore 10
        //   74: aload 8
        //   76: invokevirtual 178\011android/graphics/pdf/PdfDocument$Page:getCanvas\011()Landroid/graphics/Canvas;
        //   79: aload_0
        //   80: getfield 43\011android/support/v4/print/PrintHelperKitkat$2:mBitmap\011Landroid/graphics/Bitmap;
        //   83: aload 10
        //   85: aconst_null
        //   86: invokevirtual 184\011android/graphics/Canvas:drawBitmap\011(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
        //   89: aload 5
        //   91: aload 8
        //   93: invokevirtual 188\011android/print/pdf/PrintedPdfDocument:finishPage\011(Landroid/graphics/pdf/PdfDocument$Page;)V
        //   96: aload 5
        //   98: new 190\011java/io/FileOutputStream
        //   101: dup
        //   102: aload_2
        //   103: invokevirtual 196\011android/os/ParcelFileDescriptor:getFileDescriptor\011()Ljava/io/FileDescriptor;
        //   106: invokespecial 199\011java/io/FileOutputStream:<init>\011(Ljava/io/FileDescriptor;)V
        //   109: invokevirtual 203\011android/print/pdf/PrintedPdfDocument:writeTo\011(Ljava/io/OutputStream;)V
        //   112: iconst_1
        //   113: anewarray 205\011android/print/PageRange
        //   116: astore 14
        //   118: aload 14
        //   120: iconst_0
        //   121: getstatic 209\011android/print/PageRange:ALL_PAGES\011Landroid/print/PageRange;
        //   124: aastore
        //   125: aload 4
        //   127: aload 14
        //   129: invokevirtual 215\011android/print/PrintDocumentAdapter$WriteResultCallback:onWriteFinished\011([Landroid/print/PageRange;)V
        //   132: aload 5
        //   134: ifnull +8 -> 142
        //   137: aload 5
        //   139: invokevirtual 218\011android/print/pdf/PrintedPdfDocument:close\011()V
        //   142: aload_2
        //   143: ifnull +7 -> 150
        //   146: aload_2
        //   147: invokevirtual 219\011android/os/ParcelFileDescriptor:close\011()V
        //   150: return
        //   151: astore 11
        //   153: ldc 221
        //   155: ldc 223
        //   157: aload 11
        //   159: invokestatic 229\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
        //   162: pop
        //   163: aload 4
        //   165: aconst_null
        //   166: invokevirtual 233\011android/print/PrintDocumentAdapter$WriteResultCallback:onWriteFailed\011(Ljava/lang/CharSequence;)V
        //   169: goto -37 -> 132
        //   172: astore 6
        //   174: aload 5
        //   176: ifnull +8 -> 184
        //   179: aload 5
        //   181: invokevirtual 218\011android/print/pdf/PrintedPdfDocument:close\011()V
        //   184: aload_2
        //   185: ifnull +7 -> 192
        //   188: aload_2
        //   189: invokevirtual 219\011android/os/ParcelFileDescriptor:close\011()V
        //   192: aload 6
        //   194: athrow
        //   195: astore 13
        //   197: return
        //   198: astore 7
        //   200: goto -8 -> 192
        //
        // Exception table:
        //   from\011to\011target\011type
        //   96\011132\011151\011java/io/IOException
        //   20\01196\011172\011finally
        //   96\011132\011172\011finally
        //   153\011169\011172\011finally
        //   146\011150\011195\011java/io/IOException
        //   188\011192\011198\011java/io/IOException
      }
    };
    PrintManager localPrintManager = (PrintManager)this.mContext.getSystemService("print");
    PrintAttributes.Builder localBuilder = new PrintAttributes.Builder();
    localBuilder.setColorMode(this.mColorMode);
    if (this.mOrientation == 1)
      localBuilder.setMediaSize(PrintAttributes.MediaSize.UNKNOWN_LANDSCAPE);
    while (true)
    {
      localPrintManager.print(paramString, local2, localBuilder.build());
      return;
      if (this.mOrientation == 2)
        localBuilder.setMediaSize(PrintAttributes.MediaSize.UNKNOWN_PORTRAIT);
    }
  }

  public void setColorMode(int paramInt)
  {
    this.mColorMode = paramInt;
  }

  public void setOrientation(int paramInt)
  {
    this.mOrientation = paramInt;
  }

  public void setScaleMode(int paramInt)
  {
    this.mScaleMode = paramInt;
  }

  public static abstract interface OnPrintFinishCallback
  {
    public abstract void onFinish();
  }
}