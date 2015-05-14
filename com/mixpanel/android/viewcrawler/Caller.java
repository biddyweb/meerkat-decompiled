package com.mixpanel.android.viewcrawler;

import android.util.Log;
import android.view.View;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class Caller
{
  private static final String LOGTAG = "MixpanelABTest.Caller";
  private final Object[] mMethodArgs;
  private final String mMethodName;
  private final Class<?> mMethodResultType;
  private final Class<?>[] mMethodTypes;
  private final Class<?> mTargetClass;
  private final Method mTargetMethod;

  public Caller(Class<?> paramClass1, String paramString, Object[] paramArrayOfObject, Class<?> paramClass2)
    throws NoSuchMethodException
  {
    this.mMethodName = paramString;
    this.mMethodArgs = paramArrayOfObject;
    this.mMethodResultType = paramClass2;
    this.mMethodTypes = new Class[this.mMethodArgs.length];
    for (int i = 0; i < this.mMethodArgs.length; i++)
      this.mMethodTypes[i] = this.mMethodArgs[i].getClass();
    this.mTargetMethod = pickMethod(paramClass1);
    if (this.mTargetMethod == null)
      throw new NoSuchMethodException("Method " + paramClass1.getName() + "." + this.mMethodName + " doesn't exit");
    this.mTargetClass = this.mTargetMethod.getDeclaringClass();
  }

  private static Class<?> assignableArgType(Class<?> paramClass)
  {
    if (paramClass == Integer.class)
      paramClass = Integer.TYPE;
    do
    {
      return paramClass;
      if (paramClass == Float.class)
        return Float.TYPE;
      if (paramClass == Double.class)
        return Double.TYPE;
    }
    while (paramClass != Boolean.class);
    return Boolean.TYPE;
  }

  private Method pickMethod(Class<?> paramClass)
  {
    Method[] arrayOfMethod = paramClass.getMethods();
    int i = arrayOfMethod.length;
    int j = 0;
    if (j < i)
    {
      Method localMethod = arrayOfMethod[j];
      String str = localMethod.getName();
      Class[] arrayOfClass = localMethod.getParameterTypes();
      if ((!str.equals(this.mMethodName)) || (arrayOfClass.length != this.mMethodArgs.length));
      boolean bool;
      do
      {
        do
        {
          j++;
          break;
        }
        while (!assignableArgType(this.mMethodResultType).isAssignableFrom(assignableArgType(localMethod.getReturnType())));
        bool = true;
        for (int k = 0; (k < arrayOfClass.length) && (bool); k++)
        {
          Class localClass = assignableArgType(this.mMethodTypes[k]);
          bool = assignableArgType(arrayOfClass[k]).isAssignableFrom(localClass);
        }
      }
      while (!bool);
      return localMethod;
    }
    return null;
  }

  public Object applyMethod(View paramView)
  {
    Class localClass = paramView.getClass();
    if (this.mTargetClass.isAssignableFrom(localClass));
    try
    {
      Object localObject = this.mTargetMethod.invoke(paramView, this.mMethodArgs);
      return localObject;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      Log.e("MixpanelABTest.Caller", "Method " + this.mTargetMethod.getName() + " appears not to be public", localIllegalAccessException);
      return null;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      while (true)
        Log.e("MixpanelABTest.Caller", "Method " + this.mTargetMethod.getName() + " threw an exception", localInvocationTargetException);
    }
  }

  public Object[] getArgs()
  {
    return this.mMethodArgs;
  }

  public String toString()
  {
    return "[Caller " + this.mMethodName + "(" + this.mMethodArgs + ")" + "]";
  }
}