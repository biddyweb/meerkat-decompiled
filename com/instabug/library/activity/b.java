package com.instabug.library.activity;

import android.os.Handler;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;

final class b
  implements Animation.AnimationListener
{
  b(a parama)
  {
  }

  public final void onAnimationEnd(Animation paramAnimation)
  {
    new Handler().post(new c(this));
  }

  public final void onAnimationRepeat(Animation paramAnimation)
  {
  }

  public final void onAnimationStart(Animation paramAnimation)
  {
  }
}