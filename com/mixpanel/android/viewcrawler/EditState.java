package com.mixpanel.android.viewcrawler;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

class EditState extends UIThreadSet<Activity>
{
  private static final String LOGTAG = "MixpanelAPI.EditState";
  private final Set<EditBinding> mCurrentEdits = new HashSet();
  private final Map<String, List<ViewVisitor>> mIntendedEdits = new HashMap();
  private final Handler mUiThreadHandler = new Handler(Looper.getMainLooper());

  private void applyChangesFromList(View paramView, List<ViewVisitor> paramList)
  {
    synchronized (this.mCurrentEdits)
    {
      int i = paramList.size();
      for (int j = 0; j < i; j++)
      {
        EditBinding localEditBinding = new EditBinding(paramView, (ViewVisitor)paramList.get(j), this.mUiThreadHandler);
        this.mCurrentEdits.add(localEditBinding);
      }
      return;
    }
  }

  private void applyEditsOnUiThread()
  {
    if (Thread.currentThread() == this.mUiThreadHandler.getLooper().getThread())
    {
      applyIntendedEdits();
      return;
    }
    this.mUiThreadHandler.post(new Runnable()
    {
      public void run()
      {
        EditState.this.applyIntendedEdits();
      }
    });
  }

  private void applyIntendedEdits()
  {
    Iterator localIterator = getAll().iterator();
    while (localIterator.hasNext())
    {
      Activity localActivity = (Activity)localIterator.next();
      String str = localActivity.getClass().getCanonicalName();
      View localView = localActivity.getWindow().getDecorView().getRootView();
      synchronized (this.mIntendedEdits)
      {
        List localList1 = (List)this.mIntendedEdits.get(str);
        List localList2 = (List)this.mIntendedEdits.get(null);
        if (localList1 != null)
          applyChangesFromList(localView, localList1);
        if (localList2 != null)
          applyChangesFromList(localView, localList2);
      }
    }
  }

  public void add(Activity paramActivity)
  {
    super.add(paramActivity);
    applyEditsOnUiThread();
  }

  public void remove(Activity paramActivity)
  {
    super.remove(paramActivity);
  }

  public void setEdits(Map<String, List<ViewVisitor>> paramMap)
  {
    synchronized (this.mCurrentEdits)
    {
      Iterator localIterator = this.mCurrentEdits.iterator();
      if (localIterator.hasNext())
        ((EditBinding)localIterator.next()).kill();
    }
    this.mCurrentEdits.clear();
    synchronized (this.mIntendedEdits)
    {
      this.mIntendedEdits.clear();
      this.mIntendedEdits.putAll(paramMap);
      applyEditsOnUiThread();
      return;
    }
  }

  private static class EditBinding
    implements ViewTreeObserver.OnGlobalLayoutListener, Runnable
  {
    private boolean mAlive;
    private volatile boolean mDying;
    private final ViewVisitor mEdit;
    private final Handler mHandler;
    private final WeakReference<View> mViewRoot;

    public EditBinding(View paramView, ViewVisitor paramViewVisitor, Handler paramHandler)
    {
      this.mEdit = paramViewVisitor;
      this.mViewRoot = new WeakReference(paramView);
      this.mHandler = paramHandler;
      this.mAlive = true;
      this.mDying = false;
      ViewTreeObserver localViewTreeObserver = paramView.getViewTreeObserver();
      if (localViewTreeObserver.isAlive())
        localViewTreeObserver.addOnGlobalLayoutListener(this);
      run();
    }

    private void cleanUp()
    {
      if (this.mAlive)
      {
        View localView = (View)this.mViewRoot.get();
        if (localView != null)
        {
          ViewTreeObserver localViewTreeObserver = localView.getViewTreeObserver();
          if (localViewTreeObserver.isAlive())
            localViewTreeObserver.removeGlobalOnLayoutListener(this);
        }
        this.mEdit.cleanup();
      }
      this.mAlive = false;
    }

    public void kill()
    {
      this.mDying = true;
      this.mHandler.post(this);
    }

    public void onGlobalLayout()
    {
      run();
    }

    public void run()
    {
      if (!this.mAlive)
        return;
      View localView = (View)this.mViewRoot.get();
      if ((localView == null) || (this.mDying))
      {
        cleanUp();
        return;
      }
      this.mEdit.visit(localView);
      this.mHandler.removeCallbacks(this);
      this.mHandler.postDelayed(this, 1000L);
    }
  }
}