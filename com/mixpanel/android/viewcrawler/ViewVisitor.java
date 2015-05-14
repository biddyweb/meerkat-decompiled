package com.mixpanel.android.viewcrawler;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.view.View.AccessibilityDelegate;
import android.widget.TextView;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.WeakHashMap;

@TargetApi(16)
abstract class ViewVisitor
  implements Pathfinder.Accumulator
{
  private static final String LOGTAG = "MixpanelAPI.ViewVisitor";
  private final List<Pathfinder.PathElement> mPath;
  private final Pathfinder mPathfinder;

  protected ViewVisitor(List<Pathfinder.PathElement> paramList)
  {
    this.mPath = paramList;
    this.mPathfinder = new Pathfinder();
  }

  public abstract void cleanup();

  protected abstract String name();

  public void visit(View paramView)
  {
    this.mPathfinder.findTargetsInRoot(paramView, this.mPath, this);
  }

  public static class AddAccessibilityEventVisitor extends ViewVisitor.EventTriggeringVisitor
  {
    private final int mEventType;
    private final WeakHashMap<View, TrackingAccessibilityDelegate> mWatching;

    public AddAccessibilityEventVisitor(List<Pathfinder.PathElement> paramList, int paramInt, String paramString, ViewVisitor.OnEventListener paramOnEventListener)
    {
      super(paramString, paramOnEventListener, false);
      this.mEventType = paramInt;
      this.mWatching = new WeakHashMap();
    }

    private View.AccessibilityDelegate getOldDelegate(View paramView)
    {
      try
      {
        View.AccessibilityDelegate localAccessibilityDelegate = (View.AccessibilityDelegate)paramView.getClass().getMethod("getAccessibilityDelegate", new Class[0]).invoke(paramView, new Object[0]);
        return localAccessibilityDelegate;
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        Log.w("MixpanelAPI.ViewVisitor", "getAccessibilityDelegate threw an exception when called.", localInvocationTargetException);
        return null;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        return null;
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
      }
      return null;
    }

    public void accumulate(View paramView)
    {
      View.AccessibilityDelegate localAccessibilityDelegate = getOldDelegate(paramView);
      if (((localAccessibilityDelegate instanceof TrackingAccessibilityDelegate)) && (((TrackingAccessibilityDelegate)localAccessibilityDelegate).willFireEvent(getEventName())))
        return;
      TrackingAccessibilityDelegate localTrackingAccessibilityDelegate = new TrackingAccessibilityDelegate(localAccessibilityDelegate);
      paramView.setAccessibilityDelegate(localTrackingAccessibilityDelegate);
      this.mWatching.put(paramView, localTrackingAccessibilityDelegate);
    }

    public void cleanup()
    {
      Iterator localIterator = this.mWatching.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        View localView = (View)localEntry.getKey();
        TrackingAccessibilityDelegate localTrackingAccessibilityDelegate = (TrackingAccessibilityDelegate)localEntry.getValue();
        View.AccessibilityDelegate localAccessibilityDelegate = getOldDelegate(localView);
        if (localAccessibilityDelegate == localTrackingAccessibilityDelegate)
          localView.setAccessibilityDelegate(localTrackingAccessibilityDelegate.getRealDelegate());
        else if ((localAccessibilityDelegate instanceof TrackingAccessibilityDelegate))
          ((TrackingAccessibilityDelegate)localAccessibilityDelegate).removeFromDelegateChain(localTrackingAccessibilityDelegate);
      }
      this.mWatching.clear();
    }

    protected String name()
    {
      return getEventName() + " event when (" + this.mEventType + ")";
    }

    private class TrackingAccessibilityDelegate extends View.AccessibilityDelegate
    {
      private View.AccessibilityDelegate mRealDelegate;

      public TrackingAccessibilityDelegate(View.AccessibilityDelegate arg2)
      {
        Object localObject;
        this.mRealDelegate = localObject;
      }

      public View.AccessibilityDelegate getRealDelegate()
      {
        return this.mRealDelegate;
      }

      public void removeFromDelegateChain(TrackingAccessibilityDelegate paramTrackingAccessibilityDelegate)
      {
        if (this.mRealDelegate == paramTrackingAccessibilityDelegate)
          this.mRealDelegate = paramTrackingAccessibilityDelegate.getRealDelegate();
        while (!(this.mRealDelegate instanceof TrackingAccessibilityDelegate))
          return;
        ((TrackingAccessibilityDelegate)this.mRealDelegate).removeFromDelegateChain(paramTrackingAccessibilityDelegate);
      }

      public void sendAccessibilityEvent(View paramView, int paramInt)
      {
        if (paramInt == ViewVisitor.AddAccessibilityEventVisitor.this.mEventType)
          ViewVisitor.AddAccessibilityEventVisitor.this.fireEvent(paramView);
        if (this.mRealDelegate != null)
          this.mRealDelegate.sendAccessibilityEvent(paramView, paramInt);
      }

      public boolean willFireEvent(String paramString)
      {
        if (ViewVisitor.AddAccessibilityEventVisitor.this.getEventName() == paramString)
          return true;
        if ((this.mRealDelegate instanceof TrackingAccessibilityDelegate))
          return ((TrackingAccessibilityDelegate)this.mRealDelegate).willFireEvent(paramString);
        return false;
      }
    }
  }

  public static class AddTextChangeListener extends ViewVisitor.EventTriggeringVisitor
  {
    private final Map<TextView, TextWatcher> mWatching = new HashMap();

    public AddTextChangeListener(List<Pathfinder.PathElement> paramList, String paramString, ViewVisitor.OnEventListener paramOnEventListener)
    {
      super(paramString, paramOnEventListener, true);
    }

    public void accumulate(View paramView)
    {
      if ((paramView instanceof TextView))
      {
        TextView localTextView = (TextView)paramView;
        TrackingTextWatcher localTrackingTextWatcher = new TrackingTextWatcher(localTextView);
        TextWatcher localTextWatcher = (TextWatcher)this.mWatching.get(localTextView);
        if (localTextWatcher != null)
          localTextView.removeTextChangedListener(localTextWatcher);
        localTextView.addTextChangedListener(localTrackingTextWatcher);
        this.mWatching.put(localTextView, localTrackingTextWatcher);
      }
    }

    public void cleanup()
    {
      Iterator localIterator = this.mWatching.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        ((TextView)localEntry.getKey()).removeTextChangedListener((TextWatcher)localEntry.getValue());
      }
      this.mWatching.clear();
    }

    protected String name()
    {
      return getEventName() + " on Text Change";
    }

    private class TrackingTextWatcher
      implements TextWatcher
    {
      private final View mBoundTo;

      public TrackingTextWatcher(View arg2)
      {
        Object localObject;
        this.mBoundTo = localObject;
      }

      public void afterTextChanged(Editable paramEditable)
      {
        ViewVisitor.AddTextChangeListener.this.fireEvent(this.mBoundTo);
      }

      public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
      {
      }

      public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
      {
      }
    }
  }

  private static abstract class EventTriggeringVisitor extends ViewVisitor
  {
    private final boolean mDebounce;
    private final String mEventName;
    private final ViewVisitor.OnEventListener mListener;

    public EventTriggeringVisitor(List<Pathfinder.PathElement> paramList, String paramString, ViewVisitor.OnEventListener paramOnEventListener, boolean paramBoolean)
    {
      super();
      this.mListener = paramOnEventListener;
      this.mEventName = paramString;
      this.mDebounce = paramBoolean;
    }

    protected void fireEvent(View paramView)
    {
      this.mListener.OnEvent(paramView, this.mEventName, this.mDebounce);
    }

    protected String getEventName()
    {
      return this.mEventName;
    }
  }

  public static abstract interface OnEventListener
  {
    public abstract void OnEvent(View paramView, String paramString, boolean paramBoolean);
  }

  public static class PropertySetVisitor extends ViewVisitor
  {
    private final Caller mAccessor;
    private final Caller mMutator;

    public PropertySetVisitor(List<Pathfinder.PathElement> paramList, Caller paramCaller1, Caller paramCaller2)
    {
      super();
      this.mMutator = paramCaller1;
      this.mAccessor = paramCaller2;
    }

    public void accumulate(View paramView)
    {
      Object localObject1;
      Object localObject2;
      if (this.mAccessor != null)
      {
        Object[] arrayOfObject = this.mMutator.getArgs();
        if (1 == arrayOfObject.length)
        {
          localObject1 = arrayOfObject[0];
          localObject2 = this.mAccessor.applyMethod(paramView);
          if (localObject1 == localObject2);
          do
          {
            return;
            if (localObject1 == null)
              break;
            if ((!(localObject1 instanceof Bitmap)) || (!(localObject2 instanceof Bitmap)))
              break label91;
          }
          while (((Bitmap)localObject1).sameAs((Bitmap)localObject2));
        }
      }
      label91: 
      while (!localObject1.equals(localObject2))
      {
        this.mMutator.applyMethod(paramView);
        return;
      }
    }

    public void cleanup()
    {
    }

    protected String name()
    {
      return "Property Mutator";
    }
  }

  public static class ViewDetectorVisitor extends ViewVisitor.EventTriggeringVisitor
  {
    private boolean mSeen = false;

    public ViewDetectorVisitor(List<Pathfinder.PathElement> paramList, String paramString, ViewVisitor.OnEventListener paramOnEventListener)
    {
      super(paramString, paramOnEventListener, false);
    }

    public void accumulate(View paramView)
    {
      if ((paramView != null) && (!this.mSeen))
        fireEvent(paramView);
      if (paramView != null);
      for (boolean bool = true; ; bool = false)
      {
        this.mSeen = bool;
        return;
      }
    }

    public void cleanup()
    {
    }

    protected String name()
    {
      return getEventName() + " when Detected";
    }
  }
}