package android.support.multidex;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.ApplicationInfo;
import android.os.Build.VERSION;
import android.util.Log;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

final class MultiDexExtractor
{
  private static final int BUFFER_SIZE = 16384;
  private static final String DEX_PREFIX = "classes";
  private static final String DEX_SUFFIX = ".dex";
  private static final String EXTRACTED_NAME_EXT = ".classes";
  private static final String EXTRACTED_SUFFIX = ".zip";
  private static final String KEY_CRC = "crc";
  private static final String KEY_DEX_NUMBER = "dex.number";
  private static final String KEY_TIME_STAMP = "timestamp";
  private static final int MAX_EXTRACT_ATTEMPTS = 3;
  private static final long NO_VALUE = -1L;
  private static final String PREFS_FILE = "multidex.version";
  private static final String TAG = "MultiDex";
  private static Method sApplyMethod;

  static
  {
    try
    {
      sApplyMethod = SharedPreferences.Editor.class.getMethod("apply", new Class[0]);
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      sApplyMethod = null;
    }
  }

  private static void apply(SharedPreferences.Editor paramEditor)
  {
    if (sApplyMethod != null);
    try
    {
      sApplyMethod.invoke(paramEditor, new Object[0]);
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      paramEditor.commit();
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      label20: break label20;
    }
  }

  private static void closeQuietly(Closeable paramCloseable)
  {
    try
    {
      paramCloseable.close();
      return;
    }
    catch (IOException localIOException)
    {
      Log.w("MultiDex", "Failed to close resource", localIOException);
    }
  }

  private static void extract(ZipFile paramZipFile, ZipEntry paramZipEntry, File paramFile, String paramString)
    throws IOException, FileNotFoundException
  {
    InputStream localInputStream = paramZipFile.getInputStream(paramZipEntry);
    File localFile = File.createTempFile(paramString, ".zip", paramFile.getParentFile());
    Log.i("MultiDex", "Extracting " + localFile.getPath());
    try
    {
      ZipOutputStream localZipOutputStream = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(localFile)));
      try
      {
        ZipEntry localZipEntry = new ZipEntry("classes.dex");
        localZipEntry.setTime(paramZipEntry.getTime());
        localZipOutputStream.putNextEntry(localZipEntry);
        byte[] arrayOfByte = new byte[16384];
        for (int i = localInputStream.read(arrayOfByte); i != -1; i = localInputStream.read(arrayOfByte))
          localZipOutputStream.write(arrayOfByte, 0, i);
        localZipOutputStream.closeEntry();
        try
        {
          localZipOutputStream.close();
          Log.i("MultiDex", "Renaming to " + paramFile.getPath());
          if (localFile.renameTo(paramFile))
            break label265;
          throw new IOException("Failed to rename \"" + localFile.getAbsolutePath() + "\" to \"" + paramFile.getAbsolutePath() + "\"");
        }
        finally
        {
        }
        label241: closeQuietly(localInputStream);
        localFile.delete();
        throw localObject2;
      }
      finally
      {
        localZipOutputStream.close();
      }
      label265: closeQuietly(localInputStream);
      localFile.delete();
      return;
    }
    finally
    {
      break label241;
    }
  }

  private static SharedPreferences getMultiDexPreferences(Context paramContext)
  {
    if (Build.VERSION.SDK_INT < 11);
    for (int i = 0; ; i = 4)
      return paramContext.getSharedPreferences("multidex.version", i);
  }

  private static long getTimeStamp(File paramFile)
  {
    long l = paramFile.lastModified();
    if (l == -1L)
      l -= 1L;
    return l;
  }

  private static long getZipCrc(File paramFile)
    throws IOException
  {
    long l = ZipUtil.getZipCrc(paramFile);
    if (l == -1L)
      l -= 1L;
    return l;
  }

  private static boolean isModified(Context paramContext, File paramFile, long paramLong)
  {
    SharedPreferences localSharedPreferences = getMultiDexPreferences(paramContext);
    return (localSharedPreferences.getLong("timestamp", -1L) != getTimeStamp(paramFile)) || (localSharedPreferences.getLong("crc", -1L) != paramLong);
  }

  static List<File> load(Context paramContext, ApplicationInfo paramApplicationInfo, File paramFile, boolean paramBoolean)
    throws IOException
  {
    Log.i("MultiDex", "MultiDexExtractor.load(" + paramApplicationInfo.sourceDir + ", " + paramBoolean + ")");
    File localFile = new File(paramApplicationInfo.sourceDir);
    long l = getZipCrc(localFile);
    if ((!paramBoolean) && (!isModified(paramContext, localFile, l)));
    while (true)
    {
      try
      {
        List localList2 = loadExistingExtractions(paramContext, localFile, paramFile);
        localList1 = localList2;
        Log.i("MultiDex", "load found " + localList1.size() + " secondary dex files");
        return localList1;
      }
      catch (IOException localIOException)
      {
        Log.w("MultiDex", "Failed to reload existing extracted secondary dex files, falling back to fresh extraction", localIOException);
        localList1 = performExtractions(localFile, paramFile);
        putStoredApkInfo(paramContext, getTimeStamp(localFile), l, 1 + localList1.size());
        continue;
      }
      Log.i("MultiDex", "Detected that extraction must be performed.");
      List localList1 = performExtractions(localFile, paramFile);
      putStoredApkInfo(paramContext, getTimeStamp(localFile), l, 1 + localList1.size());
    }
  }

  private static List<File> loadExistingExtractions(Context paramContext, File paramFile1, File paramFile2)
    throws IOException
  {
    Log.i("MultiDex", "loading existing secondary dex files");
    String str = paramFile1.getName() + ".classes";
    int i = getMultiDexPreferences(paramContext).getInt("dex.number", 1);
    ArrayList localArrayList = new ArrayList(i);
    for (int j = 2; j <= i; j++)
    {
      File localFile = new File(paramFile2, str + j + ".zip");
      if (localFile.isFile())
      {
        localArrayList.add(localFile);
        if (!verifyZipFile(localFile))
        {
          Log.i("MultiDex", "Invalid zip file: " + localFile);
          throw new IOException("Invalid ZIP file.");
        }
      }
      else
      {
        throw new IOException("Missing extracted secondary dex file '" + localFile.getPath() + "'");
      }
    }
    return localArrayList;
  }

  private static List<File> performExtractions(File paramFile1, File paramFile2)
    throws IOException
  {
    String str1 = paramFile1.getName() + ".classes";
    prepareDexDir(paramFile2, str1);
    ArrayList localArrayList = new ArrayList();
    ZipFile localZipFile = new ZipFile(paramFile1);
    int i = 2;
    while (true)
    {
      Object localObject2;
      File localFile;
      boolean bool;
      String str2;
      try
      {
        localObject2 = localZipFile.getEntry("classes" + i + ".dex");
        if (localObject2 != null)
        {
          localFile = new File(paramFile2, str1 + i + ".zip");
          localArrayList.add(localFile);
          Log.i("MultiDex", "Extraction is needed for file " + localFile);
          int j = 0;
          bool = false;
          if ((j < 3) && (!bool))
          {
            j++;
            extract(localZipFile, (ZipEntry)localObject2, localFile, str1);
            bool = verifyZipFile(localFile);
            StringBuilder localStringBuilder = new StringBuilder().append("Extraction ");
            if (bool)
            {
              str2 = "success";
              Log.i("MultiDex", str2 + " - length " + localFile.getAbsolutePath() + ": " + localFile.length());
              if (bool)
                continue;
              localFile.delete();
              if (!localFile.exists())
                continue;
              Log.w("MultiDex", "Failed to delete corrupted secondary dex '" + localFile.getPath() + "'");
              continue;
            }
          }
        }
      }
      finally
      {
      }
      try
      {
        localZipFile.close();
        throw localObject1;
        str2 = "failed";
        continue;
        if (!bool)
          throw new IOException("Could not create zip file " + localFile.getAbsolutePath() + " for secondary dex (" + i + ")");
        i++;
        ZipEntry localZipEntry = localZipFile.getEntry("classes" + i + ".dex");
        localObject2 = localZipEntry;
        continue;
        try
        {
          localZipFile.close();
          return localArrayList;
        }
        catch (IOException localIOException2)
        {
          Log.w("MultiDex", "Failed to close resource", localIOException2);
          return localArrayList;
        }
      }
      catch (IOException localIOException1)
      {
        while (true)
          Log.w("MultiDex", "Failed to close resource", localIOException1);
      }
    }
  }

  private static void prepareDexDir(File paramFile, String paramString)
    throws IOException
  {
    paramFile.mkdirs();
    if (!paramFile.isDirectory())
      throw new IOException("Failed to create dex directory " + paramFile.getPath());
    File[] arrayOfFile = paramFile.listFiles(new FileFilter()
    {
      public boolean accept(File paramAnonymousFile)
      {
        return !paramAnonymousFile.getName().startsWith(this.val$extractedFilePrefix);
      }
    });
    if (arrayOfFile == null)
    {
      Log.w("MultiDex", "Failed to list secondary dex dir content (" + paramFile.getPath() + ").");
      return;
    }
    int i = arrayOfFile.length;
    int j = 0;
    label103: File localFile;
    if (j < i)
    {
      localFile = arrayOfFile[j];
      Log.i("MultiDex", "Trying to delete old file " + localFile.getPath() + " of size " + localFile.length());
      if (localFile.delete())
        break label204;
      Log.w("MultiDex", "Failed to delete old file " + localFile.getPath());
    }
    while (true)
    {
      j++;
      break label103;
      break;
      label204: Log.i("MultiDex", "Deleted old file " + localFile.getPath());
    }
  }

  private static void putStoredApkInfo(Context paramContext, long paramLong1, long paramLong2, int paramInt)
  {
    SharedPreferences.Editor localEditor = getMultiDexPreferences(paramContext).edit();
    localEditor.putLong("timestamp", paramLong1);
    localEditor.putLong("crc", paramLong2);
    localEditor.putInt("dex.number", paramInt);
    apply(localEditor);
  }

  static boolean verifyZipFile(File paramFile)
  {
    try
    {
      ZipFile localZipFile = new ZipFile(paramFile);
      try
      {
        localZipFile.close();
        return true;
      }
      catch (IOException localIOException1)
      {
        Log.w("MultiDex", "Failed to close zip file: " + paramFile.getAbsolutePath());
      }
      return false;
    }
    catch (ZipException localZipException)
    {
      while (true)
        Log.w("MultiDex", "File " + paramFile.getAbsolutePath() + " is not a valid zip file.", localZipException);
    }
    catch (IOException localIOException2)
    {
      while (true)
        Log.w("MultiDex", "Got an IOException trying to open zip file: " + paramFile.getAbsolutePath(), localIOException2);
    }
  }
}