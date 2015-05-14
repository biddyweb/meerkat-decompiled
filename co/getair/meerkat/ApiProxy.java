package co.getair.meerkat;

import android.content.Context;
import co.getair.meerkat.utilities.JSONObjectParser;
import co.getair.meerkat.utilities.MLog;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.Callable;
import org.json.JSONObject;
import org.puremvc.java.multicore.interfaces.IProxy;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class ApiProxy extends Proxy
{
  private static ApiProxy mInstance;
  private String LOG_TAG = "ApiProxy";
  private Context context;
  private HashMap<String, String> followupActions;
  private HashMap<String, IProxy> proxyHashMap;

  private ApiProxy(String paramString, Context paramContext)
  {
    super(paramString);
    loadPreviousState(paramContext);
    this.context = paramContext;
  }

  public static ApiProxy getInstance(Context paramContext)
  {
    try
    {
      if (mInstance == null)
        mInstance = new ApiProxy("apiProxy", paramContext);
      ApiProxy localApiProxy = mInstance;
      return localApiProxy;
    }
    finally
    {
    }
  }

  private void loadPreviousState(Context paramContext)
  {
    try
    {
      ObjectInputStream localObjectInputStream = new ObjectInputStream(paramContext.openFileInput(getProxyName() + "followupActions"));
      HashMap localHashMap = (HashMap)localObjectInputStream.readObject();
      localObjectInputStream.close();
      if (localHashMap != null)
      {
        this.followupActions = localHashMap;
        return;
      }
      this.followupActions = new HashMap();
      return;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      MLog.e(this.LOG_TAG, "FileNotFoundException");
      localFileNotFoundException.printStackTrace();
      return;
    }
    catch (IOException localIOException)
    {
      MLog.e(this.LOG_TAG, "IOException");
      localIOException.printStackTrace();
      return;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      MLog.e(this.LOG_TAG, "ClassNotFoundException");
      localClassNotFoundException.printStackTrace();
    }
  }

  private boolean saveFollowupActions(Context paramContext)
  {
    try
    {
      ObjectOutputStream localObjectOutputStream = new ObjectOutputStream(paramContext.openFileOutput(getProxyName() + "followupActions", 0));
      localObjectOutputStream.writeObject(this.followupActions);
      localObjectOutputStream.close();
      return true;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      MLog.e(this.LOG_TAG, "FileNotFoundException");
      localFileNotFoundException.printStackTrace();
      return false;
    }
    catch (IOException localIOException)
    {
      MLog.e(this.LOG_TAG, "IOException");
      localIOException.printStackTrace();
    }
    return false;
  }

  public String getUrlForFollowupActionKey(String paramString)
  {
    HashMap localHashMap = this.followupActions;
    String str = null;
    if (localHashMap != null)
      str = (String)this.followupActions.get(paramString);
    return str;
  }

  public void registerProxy(IProxy paramIProxy)
  {
    if (paramIProxy == null)
      return;
    if (this.proxyHashMap == null)
      this.proxyHashMap = new HashMap();
    this.proxyHashMap.put(paramIProxy.getProxyName(), paramIProxy);
  }

  public IProxy retrieveProxy(String paramString)
  {
    return retrieveProxy(paramString, null);
  }

  public IProxy retrieveProxy(String paramString, Callable paramCallable)
  {
    if ((this.proxyHashMap == null) || (!this.proxyHashMap.keySet().contains(paramString)))
      try
      {
        IProxy localIProxy = (IProxy)paramCallable.call();
        if (localIProxy != null)
          registerProxy(localIProxy);
        return localIProxy;
      }
      catch (Exception localException)
      {
        return null;
      }
    return (IProxy)this.proxyHashMap.get(paramString);
  }

  public void setFollowupActions(HashMap<String, String> paramHashMap)
  {
    this.followupActions = paramHashMap;
    saveFollowupActions(this.context);
  }

  public void setFollowupActionsFromJson(JSONObject paramJSONObject)
  {
    try
    {
      setFollowupActions(JSONObjectParser.toMap(paramJSONObject.getJSONObject("followupActions")));
      return;
    }
    catch (Exception localException)
    {
      MLog.e("Failed parsing FollowUpActions from given object");
    }
  }
}