package com.mixpanel.android.viewcrawler;

import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

class Pathfinder
{
  private static final String LOGTAG = "MixpanelAPI.PathFinder";
  private final IntStack mIndexStack = new IntStack();

  private View findPrefixedMatch(PathElement paramPathElement, View paramView, int paramInt)
  {
    int i = this.mIndexStack.read(paramInt);
    if (matches(paramPathElement, paramView))
    {
      this.mIndexStack.increment(paramInt);
      if ((paramPathElement.index == -1) || (paramPathElement.index == i))
        return paramView;
    }
    if ((paramPathElement.prefix == 1) && ((paramView instanceof ViewGroup)))
    {
      ViewGroup localViewGroup = (ViewGroup)paramView;
      int j = localViewGroup.getChildCount();
      for (int k = 0; k < j; k++)
      {
        View localView = findPrefixedMatch(paramPathElement, localViewGroup.getChildAt(k), paramInt);
        if (localView != null)
          return localView;
      }
    }
    return null;
  }

  private void findTargetsInMatchedView(View paramView, List<PathElement> paramList, Accumulator paramAccumulator)
  {
    if (paramList.isEmpty())
      paramAccumulator.accumulate(paramView);
    while (!(paramView instanceof ViewGroup))
      return;
    if (this.mIndexStack.full())
    {
      Log.v("MixpanelAPI.PathFinder", "Path is too deep, will not match");
      return;
    }
    ViewGroup localViewGroup = (ViewGroup)paramView;
    PathElement localPathElement = (PathElement)paramList.get(0);
    List localList = paramList.subList(1, paramList.size());
    int i = localViewGroup.getChildCount();
    int j = this.mIndexStack.alloc();
    for (int k = 0; ; k++)
      if (k < i)
      {
        View localView = findPrefixedMatch(localPathElement, localViewGroup.getChildAt(k), j);
        if (localView != null)
          findTargetsInMatchedView(localView, localList, paramAccumulator);
        if ((localPathElement.index < 0) || (this.mIndexStack.read(j) <= localPathElement.index));
      }
      else
      {
        this.mIndexStack.free();
        return;
      }
  }

  private static boolean hasClassName(Object paramObject, String paramString)
  {
    for (Class localClass = paramObject.getClass(); ; localClass = localClass.getSuperclass())
    {
      if (localClass.getCanonicalName().equals(paramString))
        return true;
      if (localClass == Object.class)
        return false;
    }
  }

  private boolean matches(PathElement paramPathElement, View paramView)
  {
    if ((paramPathElement.viewClassName != null) && (!hasClassName(paramView, paramPathElement.viewClassName)));
    String str;
    do
    {
      do
        return false;
      while (((-1 != paramPathElement.viewId) && (paramView.getId() != paramPathElement.viewId)) || ((paramPathElement.contentDescription != null) && (!paramPathElement.contentDescription.equals(paramView.getContentDescription()))));
      str = paramPathElement.tag;
    }
    while ((paramPathElement.tag != null) && ((paramView.getTag() == null) || (!str.equals(paramView.getTag().toString()))));
    return true;
  }

  public void findTargetsInRoot(View paramView, List<PathElement> paramList, Accumulator paramAccumulator)
  {
    if (paramList.isEmpty());
    List localList;
    View localView;
    do
    {
      return;
      if (this.mIndexStack.full())
      {
        Log.w("MixpanelAPI.PathFinder", "There appears to be a concurrency issue in the pathfinding code. Path will not be matched.");
        return;
      }
      PathElement localPathElement = (PathElement)paramList.get(0);
      localList = paramList.subList(1, paramList.size());
      localView = findPrefixedMatch(localPathElement, paramView, this.mIndexStack.alloc());
      this.mIndexStack.free();
    }
    while (localView == null);
    findTargetsInMatchedView(localView, localList, paramAccumulator);
  }

  public static abstract interface Accumulator
  {
    public abstract void accumulate(View paramView);
  }

  private static class IntStack
  {
    private static final int MAX_INDEX_STACK_SIZE = 256;
    private final int[] mStack = new int[256];
    private int mStackSize = 0;

    public int alloc()
    {
      int i = this.mStackSize;
      this.mStackSize = (1 + this.mStackSize);
      this.mStack[i] = 0;
      return i;
    }

    public void free()
    {
      this.mStackSize = (-1 + this.mStackSize);
      if (this.mStackSize < 0)
        throw new ArrayIndexOutOfBoundsException(this.mStackSize);
    }

    public boolean full()
    {
      return this.mStack.length == this.mStackSize;
    }

    public void increment(int paramInt)
    {
      int[] arrayOfInt = this.mStack;
      arrayOfInt[paramInt] = (1 + arrayOfInt[paramInt]);
    }

    public int read(int paramInt)
    {
      return this.mStack[paramInt];
    }
  }

  public static class PathElement
  {
    public static final int SHORTEST_PREFIX = 1;
    public static final int ZERO_LENGTH_PREFIX;
    public final String contentDescription;
    public final int index;
    public final int prefix;
    public final String tag;
    public final String viewClassName;
    public final int viewId;

    public PathElement(int paramInt1, String paramString1, int paramInt2, int paramInt3, String paramString2, String paramString3)
    {
      this.prefix = paramInt1;
      this.viewClassName = paramString1;
      this.index = paramInt2;
      this.viewId = paramInt3;
      this.contentDescription = paramString2;
      this.tag = paramString3;
    }

    public String toString()
    {
      try
      {
        JSONObject localJSONObject = new JSONObject();
        if (this.prefix == 1)
          localJSONObject.put("prefix", "shortest");
        if (this.viewClassName != null)
          localJSONObject.put("view_class", this.viewClassName);
        if (this.index > -1)
          localJSONObject.put("index", this.index);
        if (this.viewId > -1)
          localJSONObject.put("id", this.viewId);
        if (this.contentDescription != null)
          localJSONObject.put("contentDescription", this.contentDescription);
        if (this.tag != null)
          localJSONObject.put("tag", this.tag);
        String str = localJSONObject.toString();
        return str;
      }
      catch (JSONException localJSONException)
      {
        throw new RuntimeException("Can't serialize PathElement to String", localJSONException);
      }
    }
  }
}