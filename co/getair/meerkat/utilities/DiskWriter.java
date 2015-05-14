package co.getair.meerkat.utilities;

import android.content.Context;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class DiskWriter
{
  private static final String LOG_TAG = "DiskWritter";
  private static DiskWriter _instance = null;

  public static DiskWriter getInstance()
  {
    try
    {
      if (_instance == null)
        _instance = new DiskWriter();
      DiskWriter localDiskWriter = _instance;
      return localDiskWriter;
    }
    finally
    {
    }
  }

  public void deleteObject(Context paramContext, String paramString)
  {
    paramContext.deleteFile(paramString);
  }

  public Object loadObject(Context paramContext, String paramString)
  {
    try
    {
      ObjectInputStream localObjectInputStream = new ObjectInputStream(paramContext.openFileInput(paramString));
      Object localObject = localObjectInputStream.readObject();
      localObjectInputStream.close();
      return localObject;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      MLog.e("DiskWritter", "FileNotFoundException");
      localFileNotFoundException.printStackTrace();
      return null;
    }
    catch (IOException localIOException)
    {
      MLog.e("DiskWritter", "IOException");
      localIOException.printStackTrace();
      return null;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      MLog.e("DiskWritter", "ClassNotFoundException");
      localClassNotFoundException.printStackTrace();
    }
    return null;
  }

  public void saveObject(Context paramContext, Object paramObject, String paramString)
  {
    MLog.d("DiskWritter", "saveChanges");
    try
    {
      ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(paramContext.openFileOutput(paramString, 0));
      localObjectOutputStream.writeObject(paramObject);
      localObjectOutputStream.close();
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      MLog.e("DiskWritter", "FileNotFoundException");
      localFileNotFoundException.printStackTrace();
      return;
    }
    catch (IOException localIOException)
    {
      MLog.e("DiskWritter", "IOException");
      localIOException.printStackTrace();
    }
  }
}