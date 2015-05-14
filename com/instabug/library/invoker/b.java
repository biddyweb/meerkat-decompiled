package com.instabug.library.invoker;

import android.graphics.RadialGradient;
import android.graphics.Shader;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.ShapeDrawable.ShaderFactory;

final class b extends ShapeDrawable.ShaderFactory
{
  b(a parama)
  {
  }

  public final Shader resize(int paramInt1, int paramInt2)
  {
    return new RadialGradient(paramInt1 / 2.0F, paramInt1 / 2.0F, paramInt1, a.a(this.a).b, a.a(this.a).a, Shader.TileMode.CLAMP);
  }
}