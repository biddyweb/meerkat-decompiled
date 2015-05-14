package com.mixpanel.android.mpmetrics;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Tweaks
{
  private final Map<String, List<TweakChangeCallback>> mBindings = new HashMap();
  private final Map<String, Object> mTweaks = new HashMap();
  private final Handler mUiHandler = new Handler(Looper.getMainLooper());

  private void runCallback(final TweakChangeCallback paramTweakChangeCallback, final Object paramObject)
  {
    this.mUiHandler.post(new Runnable()
    {
      public void run()
      {
        paramTweakChangeCallback.onChange(paramObject);
      }
    });
  }

  private void set(String paramString, Object paramObject, boolean paramBoolean)
  {
    try
    {
      this.mTweaks.put(paramString, paramObject);
      if ((!paramBoolean) && (this.mBindings.containsKey(paramString)))
      {
        Iterator localIterator = ((List)this.mBindings.get(paramString)).iterator();
        while (localIterator.hasNext())
          runCallback((TweakChangeCallback)localIterator.next(), paramObject);
      }
    }
    finally
    {
    }
  }

  public void bind(String paramString, Object paramObject, TweakChangeCallback paramTweakChangeCallback)
  {
    try
    {
      if (!this.mBindings.containsKey(paramString))
        this.mBindings.put(paramString, new ArrayList());
      ((List)this.mBindings.get(paramString)).add(paramTweakChangeCallback);
      runCallback(paramTweakChangeCallback, get(paramString, paramObject));
      return;
    }
    finally
    {
    }
  }

  public Object get(String paramString, Object paramObject)
  {
    try
    {
      if (!this.mTweaks.containsKey(paramString))
        set(paramString, paramObject, true);
      Object localObject2 = this.mTweaks.get(paramString);
      return localObject2;
    }
    finally
    {
    }
  }

  public Map<String, Object> getAll()
  {
    try
    {
      HashMap localHashMap = new HashMap(this.mTweaks);
      return localHashMap;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Double getDouble(String paramString, Double paramDouble)
  {
    try
    {
      Double localDouble = (Double)get(paramString, paramDouble);
      return localDouble;
    }
    catch (ClassCastException localClassCastException)
    {
    }
    return paramDouble;
  }

  public Float getFloat(String paramString, Float paramFloat)
  {
    try
    {
      Float localFloat = (Float)get(paramString, paramFloat);
      return localFloat;
    }
    catch (ClassCastException localClassCastException)
    {
    }
    return paramFloat;
  }

  public Integer getInteger(String paramString, Integer paramInteger)
  {
    try
    {
      Integer localInteger = (Integer)get(paramString, paramInteger);
      return localInteger;
    }
    catch (ClassCastException localClassCastException)
    {
    }
    return paramInteger;
  }

  public Long getLong(String paramString, Long paramLong)
  {
    try
    {
      Long localLong = (Long)get(paramString, paramLong);
      return localLong;
    }
    catch (ClassCastException localClassCastException)
    {
    }
    return paramLong;
  }

  public String getString(String paramString1, String paramString2)
  {
    try
    {
      String str = (String)get(paramString1, paramString2);
      return str;
    }
    catch (ClassCastException localClassCastException)
    {
    }
    return paramString2;
  }

  public void set(String paramString, Object paramObject)
  {
    set(paramString, paramObject, false);
  }

  public void set(Map<String, Object> paramMap)
  {
    Iterator localIterator = paramMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      set(str, paramMap.get(str));
    }
  }

  static abstract interface TweakChangeCallback
  {
    public abstract void onChange(Object paramObject);
  }
}