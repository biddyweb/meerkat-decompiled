package com.google.android.gms.games.snapshot;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.games.internal.GamesLog;
import com.google.android.gms.internal.zzlz;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.channels.FileChannel;

public final class SnapshotContentsEntity
  implements SafeParcelable, SnapshotContents
{
  public static final SnapshotContentsEntityCreator CREATOR = new SnapshotContentsEntityCreator();
  private static final Object zzakB = new Object();
  private final int zzFG;
  private Contents zzTO;

  SnapshotContentsEntity(int paramInt, Contents paramContents)
  {
    this.zzFG = paramInt;
    this.zzTO = paramContents;
  }

  public SnapshotContentsEntity(Contents paramContents)
  {
    this(1, paramContents);
  }

  private boolean zza(int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    if (!isClosed());
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Must provide a previously opened SnapshotContents");
      synchronized (zzakB)
      {
        FileOutputStream localFileOutputStream = new FileOutputStream(this.zzTO.getParcelFileDescriptor().getFileDescriptor());
        BufferedOutputStream localBufferedOutputStream = new BufferedOutputStream(localFileOutputStream);
        try
        {
          FileChannel localFileChannel = localFileOutputStream.getChannel();
          localFileChannel.position(paramInt1);
          localBufferedOutputStream.write(paramArrayOfByte, paramInt2, paramInt3);
          if (paramBoolean)
            localFileChannel.truncate(paramArrayOfByte.length);
          localBufferedOutputStream.flush();
          return true;
        }
        catch (IOException localIOException)
        {
          GamesLog.zza("SnapshotContentsEntity", "Failed to write snapshot data", localIOException);
          return false;
        }
      }
    }
  }

  public void close()
  {
    this.zzTO = null;
  }

  public int describeContents()
  {
    return 0;
  }

  public ParcelFileDescriptor getParcelFileDescriptor()
  {
    if (!isClosed());
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Cannot mutate closed contents!");
      return this.zzTO.getParcelFileDescriptor();
    }
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean isClosed()
  {
    return this.zzTO == null;
  }

  public boolean modifyBytes(int paramInt1, byte[] paramArrayOfByte, int paramInt2, int paramInt3)
  {
    return zza(paramInt1, paramArrayOfByte, paramInt2, paramArrayOfByte.length, false);
  }

  public byte[] readFully()
    throws IOException
  {
    boolean bool1 = isClosed();
    boolean bool2 = false;
    if (!bool1)
      bool2 = true;
    zzx.zza(bool2, "Must provide a previously opened Snapshot");
    synchronized (zzakB)
    {
      FileInputStream localFileInputStream = new FileInputStream(this.zzTO.getParcelFileDescriptor().getFileDescriptor());
      BufferedInputStream localBufferedInputStream = new BufferedInputStream(localFileInputStream);
      try
      {
        localFileInputStream.getChannel().position(0L);
        byte[] arrayOfByte = zzlz.zza(localBufferedInputStream, false);
        localFileInputStream.getChannel().position(0L);
        return arrayOfByte;
      }
      catch (IOException localIOException)
      {
        GamesLog.zzb("SnapshotContentsEntity", "Failed to read snapshot data", localIOException);
        throw localIOException;
      }
    }
  }

  public boolean writeBytes(byte[] paramArrayOfByte)
  {
    return zza(0, paramArrayOfByte, 0, paramArrayOfByte.length, true);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    SnapshotContentsEntityCreator.zza(this, paramParcel, paramInt);
  }

  public Contents zzkq()
  {
    return this.zzTO;
  }
}