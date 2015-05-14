package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.activities.FeedActivity;
import co.getair.meerkat.facades.FeedActivityFacade;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.DiskWriter;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class InboxProxy extends Proxy
  implements Serializable
{
  private static ExecutorService executorService = Executors.newSingleThreadExecutor();
  private String GET_INBOX_URL_KEY = "inbox";
  private String ID_KEY = "id";
  private String INBOX_KEY = "inboxKey";
  private String LOG_TAG = "InboxProxy";
  private String ORDER_KEY = "o";
  private Context context;
  private HashMap<String, ArrayList> inbox;

  public InboxProxy(String paramString, Context paramContext)
  {
    super(paramString);
    HashMap localHashMap = loadInbox(paramContext);
    if (localHashMap != null);
    while (true)
    {
      this.inbox = localHashMap;
      this.context = paramContext;
      return;
      localHashMap = new HashMap();
    }
  }

  private HashMap<String, ArrayList> _addItem(HashMap<String, Object> paramHashMap, String paramString, HashMap<String, ArrayList> paramHashMap1)
  {
    HashMap localHashMap = new HashMap(paramHashMap1);
    ArrayList localArrayList;
    int i;
    if (localHashMap.get(paramString) != null)
    {
      localArrayList = (ArrayList)localHashMap.get(paramString);
      i = 0;
      label33: int j = localArrayList.size();
      int k = 0;
      int m = 0;
      if (i < j)
      {
        if (!((HashMap)localArrayList.get(i)).get(this.ID_KEY).equals(paramHashMap.get(this.ID_KEY)))
          break label139;
        k = i;
        m = 1;
      }
      if ((localArrayList.size() <= k) || (m == 0))
        break label145;
      localArrayList.set(k, paramHashMap);
    }
    while (true)
    {
      localHashMap.put(paramString, localArrayList);
      return localHashMap;
      localArrayList = new ArrayList();
      break;
      label139: i++;
      break label33;
      label145: localArrayList.add(paramHashMap);
    }
  }

  private HashMap<String, ArrayList> _clearBucketFromInbox(String paramString, HashMap<String, ArrayList> paramHashMap)
  {
    HashMap localHashMap = new HashMap(paramHashMap);
    localHashMap.remove(paramString);
    return localHashMap;
  }

  private HashMap<String, ArrayList> _removeItem(HashMap<String, Object> paramHashMap, String paramString, HashMap<String, ArrayList> paramHashMap1)
  {
    HashMap localHashMap = new HashMap(paramHashMap1);
    ArrayList localArrayList;
    int i;
    if (localHashMap.get(paramString) != null)
    {
      localArrayList = (ArrayList)localHashMap.get(paramString);
      i = -1;
    }
    for (int j = 0; ; j++)
      if (j < localArrayList.size())
      {
        if (((HashMap)localArrayList.get(j)).get(this.ID_KEY).equals(paramHashMap.get(this.ID_KEY)))
          i = j;
      }
      else
      {
        if (i >= 0)
          localArrayList.remove(i);
        localHashMap.put(paramString, localArrayList);
        return localHashMap;
        localArrayList = new ArrayList();
        break;
      }
  }

  private HashMap<String, ArrayList> getInbox()
  {
    return this.inbox;
  }

  private HashMap<String, ArrayList> loadInbox(Context paramContext)
  {
    return (HashMap)DiskWriter.getInstance().loadObject(paramContext, this.INBOX_KEY);
  }

  private void saveChanges(Context paramContext, HashMap<String, ArrayList> paramHashMap)
  {
    this.inbox = paramHashMap;
    DiskWriter.getInstance().saveObject(paramContext, paramHashMap, this.INBOX_KEY);
  }

  private void setInbox(HashMap<String, ArrayList> paramHashMap)
  {
    this.inbox = paramHashMap;
  }

  public void addItem(final String paramString, final HashMap paramHashMap)
  {
    executorService.submit(new Callable()
    {
      public Object call()
        throws Exception
      {
        HashMap localHashMap = InboxProxy.this._addItem(paramHashMap, paramString, InboxProxy.this.inbox);
        InboxProxy.this.saveChanges(InboxProxy.this.context, localHashMap);
        return null;
      }
    });
  }

  public void clearBucket(final String paramString)
  {
    executorService.submit(new Callable()
    {
      public Object call()
        throws Exception
      {
        HashMap localHashMap = InboxProxy.this._clearBucketFromInbox(paramString, InboxProxy.this.inbox);
        InboxProxy.this.saveChanges(InboxProxy.this.context, localHashMap);
        return null;
      }
    });
  }

  public void clearInbox()
  {
    executorService.submit(new Callable()
    {
      public Object call()
        throws Exception
      {
        InboxProxy.this.saveChanges(InboxProxy.this.context, new HashMap());
        return null;
      }
    });
  }

  public void fetchInbox()
  {
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(0, ApiProxy.getInstance(this.context.getApplicationContext()).getUrlForFollowupActionKey(this.GET_INBOX_URL_KEY), "", new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        try
        {
          MLog.i(InboxProxy.this.LOG_TAG, paramAnonymousJSONObject.toString());
          String str = paramAnonymousJSONObject.getString("result");
          InboxProxy.this.updateInbox(str);
          return;
        }
        catch (JSONException localJSONException)
        {
          MLog.e(InboxProxy.this.LOG_TAG, localJSONException.toString());
        }
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        MLog.e(InboxProxy.this.LOG_TAG, paramAnonymousVolleyError.toString());
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public ArrayList getBucket(String paramString)
  {
    if (this.inbox.get(paramString) != null)
      return (ArrayList)this.inbox.get(paramString);
    return new ArrayList();
  }

  public void removeItem(final String paramString, final HashMap paramHashMap)
  {
    executorService.submit(new Callable()
    {
      public Object call()
        throws Exception
      {
        HashMap localHashMap = InboxProxy.this._removeItem(paramHashMap, paramString, InboxProxy.this.inbox);
        InboxProxy.this.saveChanges(InboxProxy.this.context, localHashMap);
        return null;
      }
    });
  }

  public void setBucket(final String paramString, final ArrayList paramArrayList)
  {
    executorService.submit(new Callable()
    {
      public Object call()
        throws Exception
      {
        InboxProxy.this.inbox.put(paramString, paramArrayList);
        return null;
      }
    });
  }

  public void updateInbox(String paramString)
  {
    if (paramString == null)
      return;
    String[] arrayOfString = paramString.split("\\|");
    Pattern localPattern = Pattern.compile("(\\w+)(.)(.*)");
    HashMap localHashMap1 = new HashMap(this.inbox);
    final HashMap localHashMap2 = new HashMap();
    int i = arrayOfString.length;
    int j = 0;
    if (j < i)
    {
      String str1 = arrayOfString[j];
      if (str1.equals(""));
      while (true)
      {
        j++;
        break;
        Matcher localMatcher = localPattern.matcher(str1);
        if ((localMatcher.matches()) && (localMatcher.groupCount() == 3))
        {
          String str2 = localMatcher.group(1);
          String str3 = localMatcher.group(2);
          String str4 = localMatcher.group(3);
          Gson localGson = new Gson();
          TypeToken local3 = new TypeToken()
          {
          };
          HashMap localHashMap4 = (HashMap)localGson.fromJson(str4, local3.getType());
          int k = -1;
          switch (str3.hashCode())
          {
          default:
          case 33:
          case 43:
          case 45:
          }
          while (true)
            switch (k)
            {
            default:
              break;
            case 0:
              localHashMap1 = _clearBucketFromInbox(str2, localHashMap1);
              break;
              if (str3.equals("!"))
              {
                k = 0;
                continue;
                if (str3.equals("+"))
                {
                  k = 1;
                  continue;
                  if (str3.equals("-"))
                    k = 2;
                }
              }
              break;
            case 1:
            case 2:
            }
          Integer localInteger = Integer.valueOf(0);
          if (localHashMap2.get(str2) != null)
            localInteger = Integer.valueOf(((Integer)localHashMap2.get(str2)).intValue());
          localHashMap2.put(str2, Integer.valueOf(1 + localInteger.intValue()));
          localHashMap1 = _addItem(localHashMap4, str2, localHashMap1);
          continue;
          localHashMap1 = _removeItem(localHashMap4, str2, localHashMap1);
        }
      }
    }
    final HashMap localHashMap3 = localHashMap1;
    ExecutorService localExecutorService = executorService;
    Callable local4 = new Callable()
    {
      public Object call()
        throws Exception
      {
        InboxProxy.this.saveChanges(InboxProxy.this.context, localHashMap3);
        Iterator localIterator = localHashMap2.keySet().iterator();
        while (localIterator.hasNext())
        {
          String str1 = (String)localIterator.next();
          String str2 = str1 + "InboxItemsArrived";
          InboxProxy.this.getFacade().sendNotification(str2, null, null);
          if (str1.equals("score"))
            FeedActivityFacade.getInstance(FeedActivity.class.getName()).sendNotification(str2, null, null);
        }
        return null;
      }
    };
    localExecutorService.submit(local4);
  }
}