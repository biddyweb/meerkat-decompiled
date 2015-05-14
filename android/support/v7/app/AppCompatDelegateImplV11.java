package android.support.v7.app;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.v7.internal.view.SupportActionModeWrapper;
import android.support.v7.internal.view.SupportActionModeWrapper.CallbackWrapper;
import android.support.v7.internal.widget.NativeActionModeAwareLayout;
import android.support.v7.internal.widget.NativeActionModeAwareLayout.OnActionModeForChildListener;
import android.util.AttributeSet;
import android.view.ActionMode.Callback;
import android.view.LayoutInflater.Factory2;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;

@TargetApi(11)
class AppCompatDelegateImplV11 extends AppCompatDelegateImplV7
  implements NativeActionModeAwareLayout.OnActionModeForChildListener
{
  private NativeActionModeAwareLayout mNativeActionModeAwareLayout;

  AppCompatDelegateImplV11(Context paramContext, Window paramWindow, AppCompatCallback paramAppCompatCallback)
  {
    super(paramContext, paramWindow, paramAppCompatCallback);
  }

  View callActivityOnCreateView(View paramView, String paramString, Context paramContext, AttributeSet paramAttributeSet)
  {
    View localView = super.callActivityOnCreateView(paramView, paramString, paramContext, paramAttributeSet);
    if (localView != null)
      return localView;
    if ((this.mOriginalWindowCallback instanceof LayoutInflater.Factory2))
      return ((LayoutInflater.Factory2)this.mOriginalWindowCallback).onCreateView(paramView, paramString, paramContext, paramAttributeSet);
    return null;
  }

  void onSubDecorInstalled(ViewGroup paramViewGroup)
  {
    this.mNativeActionModeAwareLayout = ((NativeActionModeAwareLayout)paramViewGroup.findViewById(16908290));
    if (this.mNativeActionModeAwareLayout != null)
      this.mNativeActionModeAwareLayout.setActionModeForChildListener(this);
  }

  public android.view.ActionMode startActionModeForChild(View paramView, ActionMode.Callback paramCallback)
  {
    android.support.v7.view.ActionMode localActionMode = startSupportActionMode(new SupportActionModeWrapper.CallbackWrapper(paramView.getContext(), paramCallback));
    if (localActionMode != null)
      return new SupportActionModeWrapper(this.mContext, localActionMode);
    return null;
  }
}