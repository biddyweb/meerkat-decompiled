package com.google.android.gms.common.data;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.ParcelFileDescriptor.AutoCloseInputStream;
import android.os.Parcelable.Creator;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.io.Closeable;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;

public class zza
  implements SafeParcelable
{
  public static final Parcelable.Creator<zza> CREATOR = new zzb();
  final int zzFG;
  final int zzJp;
  ParcelFileDescriptor zzNJ;
  private Bitmap zzNK;
  private boolean zzNL;
  private File zzNM;

  zza(int paramInt1, ParcelFileDescriptor paramParcelFileDescriptor, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzNJ = paramParcelFileDescriptor;
    this.zzJp = paramInt2;
    this.zzNK = null;
    this.zzNL = false;
  }

  public zza(Bitmap paramBitmap)
  {
    this.zzFG = 1;
    this.zzNJ = null;
    this.zzJp = 0;
    this.zzNK = paramBitmap;
    this.zzNL = true;
  }

  private void zza(Closeable paramCloseable)
  {
    try
    {
      paramCloseable.close();
      return;
    }
    catch (IOException localIOException)
    {
      Log.w("BitmapTeleporter", "Could not close stream", localIOException);
    }
  }

  // ERROR //
  private java.io.FileOutputStream zziw()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 67\011com/google/android/gms/common/data/zza:zzNM\011Ljava/io/File;
    //   4: ifnonnull +13 -> 17
    //   7: new 69\011java/lang/IllegalStateException
    //   10: dup
    //   11: ldc 71
    //   13: invokespecial 74\011java/lang/IllegalStateException:<init>\011(Ljava/lang/String;)V
    //   16: athrow
    //   17: ldc 76
    //   19: ldc 78
    //   21: aload_0
    //   22: getfield 67\011com/google/android/gms/common/data/zza:zzNM\011Ljava/io/File;
    //   25: invokestatic 84\011java/io/File:createTempFile\011(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    //   28: astore_2
    //   29: new 86\011java/io/FileOutputStream
    //   32: dup
    //   33: aload_2
    //   34: invokespecial 89\011java/io/FileOutputStream:<init>\011(Ljava/io/File;)V
    //   37: astore_3
    //   38: aload_0
    //   39: aload_2
    //   40: ldc 90
    //   42: invokestatic 96\011android/os/ParcelFileDescriptor:open\011(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;
    //   45: putfield 35\011com/google/android/gms/common/data/zza:zzNJ\011Landroid/os/ParcelFileDescriptor;
    //   48: aload_2
    //   49: invokevirtual 100\011java/io/File:delete\011()Z
    //   52: pop
    //   53: aload_3
    //   54: areturn
    //   55: astore_1
    //   56: new 69\011java/lang/IllegalStateException
    //   59: dup
    //   60: ldc 102
    //   62: aload_1
    //   63: invokespecial 105\011java/lang/IllegalStateException:<init>\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   66: athrow
    //   67: astore 4
    //   69: new 69\011java/lang/IllegalStateException
    //   72: dup
    //   73: ldc 107
    //   75: invokespecial 74\011java/lang/IllegalStateException:<init>\011(Ljava/lang/String;)V
    //   78: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   17\01129\01155\011java/io/IOException
    //   29\01148\01167\011java/io/FileNotFoundException
  }

  public int describeContents()
  {
    return 0;
  }

  public void release()
  {
    if (!this.zzNL)
      zza(this.zzNJ);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    Bitmap localBitmap;
    byte[] arrayOfByte;
    DataOutputStream localDataOutputStream;
    if (this.zzNJ == null)
    {
      localBitmap = this.zzNK;
      ByteBuffer localByteBuffer = ByteBuffer.allocate(localBitmap.getRowBytes() * localBitmap.getHeight());
      localBitmap.copyPixelsToBuffer(localByteBuffer);
      arrayOfByte = localByteBuffer.array();
      localDataOutputStream = new DataOutputStream(zziw());
    }
    try
    {
      localDataOutputStream.writeInt(arrayOfByte.length);
      localDataOutputStream.writeInt(localBitmap.getWidth());
      localDataOutputStream.writeInt(localBitmap.getHeight());
      localDataOutputStream.writeUTF(localBitmap.getConfig().toString());
      localDataOutputStream.write(arrayOfByte);
      zza(localDataOutputStream);
      zzb.zza(this, paramParcel, paramInt | 0x1);
      this.zzNJ = null;
      return;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException("Could not write into unlinked file", localIOException);
    }
    finally
    {
      zza(localDataOutputStream);
    }
  }

  public void zza(File paramFile)
  {
    if (paramFile == null)
      throw new NullPointerException("Cannot set null temp directory");
    this.zzNM = paramFile;
  }

  public Bitmap zziv()
  {
    DataInputStream localDataInputStream;
    if (!this.zzNL)
      localDataInputStream = new DataInputStream(new ParcelFileDescriptor.AutoCloseInputStream(this.zzNJ));
    try
    {
      byte[] arrayOfByte = new byte[localDataInputStream.readInt()];
      int i = localDataInputStream.readInt();
      int j = localDataInputStream.readInt();
      Bitmap.Config localConfig = Bitmap.Config.valueOf(localDataInputStream.readUTF());
      localDataInputStream.read(arrayOfByte);
      zza(localDataInputStream);
      ByteBuffer localByteBuffer = ByteBuffer.wrap(arrayOfByte);
      Bitmap localBitmap = Bitmap.createBitmap(i, j, localConfig);
      localBitmap.copyPixelsFromBuffer(localByteBuffer);
      this.zzNK = localBitmap;
      this.zzNL = true;
      return this.zzNK;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException("Could not read from parcel file descriptor", localIOException);
    }
    finally
    {
      zza(localDataInputStream);
    }
  }
}