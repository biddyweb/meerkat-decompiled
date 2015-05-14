package com.google.android.gms.common.images;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.net.Uri;
import android.widget.ImageView;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.internal.zzkj;
import com.google.android.gms.internal.zzkk;
import com.google.android.gms.internal.zzkl;
import com.google.android.gms.internal.zzkm;
import com.google.android.gms.internal.zzkm.zza;
import java.lang.ref.WeakReference;

public abstract class zza
{
  final zza zzOA;
  protected int zzOB = 0;
  protected int zzOC = 0;
  protected boolean zzOD = false;
  protected ImageManager.OnImageLoadedListener zzOE;
  private boolean zzOF = true;
  private boolean zzOG = false;
  private boolean zzOH = true;
  protected int zzOI;

  public zza(Uri paramUri, int paramInt)
  {
    this.zzOA = new zza(paramUri);
    this.zzOC = paramInt;
  }

  private Drawable zza(Context paramContext, zzkm paramzzkm, int paramInt)
  {
    Resources localResources = paramContext.getResources();
    if (this.zzOI > 0)
    {
      zzkm.zza localzza = new zzkm.zza(paramInt, this.zzOI);
      Drawable localDrawable = (Drawable)paramzzkm.get(localzza);
      if (localDrawable == null)
      {
        localDrawable = localResources.getDrawable(paramInt);
        if ((0x1 & this.zzOI) != 0)
          localDrawable = zza(localResources, localDrawable);
        paramzzkm.put(localzza, localDrawable);
      }
      return localDrawable;
    }
    return localResources.getDrawable(paramInt);
  }

  protected Drawable zza(Resources paramResources, Drawable paramDrawable)
  {
    return zzkk.zza(paramResources, paramDrawable);
  }

  protected zzkj zza(Drawable paramDrawable1, Drawable paramDrawable2)
  {
    if (paramDrawable1 != null)
      if (!(paramDrawable1 instanceof zzkj));
    for (paramDrawable1 = ((zzkj)paramDrawable1).zziI(); ; paramDrawable1 = null)
      return new zzkj(paramDrawable1, paramDrawable2);
  }

  void zza(Context paramContext, Bitmap paramBitmap, boolean paramBoolean)
  {
    zzb.zzh(paramBitmap);
    if ((0x1 & this.zzOI) != 0)
      paramBitmap = zzkk.zza(paramBitmap);
    BitmapDrawable localBitmapDrawable = new BitmapDrawable(paramContext.getResources(), paramBitmap);
    if (this.zzOE != null)
      this.zzOE.onImageLoaded(this.zzOA.uri, localBitmapDrawable, true);
    zza(localBitmapDrawable, paramBoolean, false, true);
  }

  void zza(Context paramContext, zzkm paramzzkm)
  {
    if (this.zzOH)
    {
      int i = this.zzOB;
      Drawable localDrawable = null;
      if (i != 0)
        localDrawable = zza(paramContext, paramzzkm, this.zzOB);
      zza(localDrawable, false, true, false);
    }
  }

  void zza(Context paramContext, zzkm paramzzkm, boolean paramBoolean)
  {
    int i = this.zzOC;
    Drawable localDrawable = null;
    if (i != 0)
      localDrawable = zza(paramContext, paramzzkm, this.zzOC);
    if (this.zzOE != null)
      this.zzOE.onImageLoaded(this.zzOA.uri, localDrawable, false);
    zza(localDrawable, paramBoolean, false, false);
  }

  protected abstract void zza(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3);

  public void zzaC(int paramInt)
  {
    this.zzOC = paramInt;
  }

  protected boolean zzc(boolean paramBoolean1, boolean paramBoolean2)
  {
    return (this.zzOF) && (!paramBoolean2) && ((!paramBoolean1) || (this.zzOG));
  }

  static final class zza
  {
    public final Uri uri;

    public zza(Uri paramUri)
    {
      this.uri = paramUri;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zza))
        return false;
      if (this == paramObject)
        return true;
      return zzw.equal(((zza)paramObject).uri, this.uri);
    }

    public int hashCode()
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.uri;
      return zzw.hashCode(arrayOfObject);
    }
  }

  public static final class zzb extends zza
  {
    private WeakReference<ImageView> zzOJ;

    public zzb(ImageView paramImageView, int paramInt)
    {
      super(paramInt);
      zzb.zzh(paramImageView);
      this.zzOJ = new WeakReference(paramImageView);
    }

    public zzb(ImageView paramImageView, Uri paramUri)
    {
      super(0);
      zzb.zzh(paramImageView);
      this.zzOJ = new WeakReference(paramImageView);
    }

    private void zza(ImageView paramImageView, Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      if ((!paramBoolean2) && (!paramBoolean3));
      for (int i = 1; (i != 0) && ((paramImageView instanceof zzkl)); i = 0)
      {
        int k = ((zzkl)paramImageView).zziK();
        if ((this.zzOC == 0) || (k != this.zzOC))
          break;
        return;
      }
      boolean bool = zzc(paramBoolean1, paramBoolean2);
      if ((this.zzOD) && (paramDrawable != null));
      for (Object localObject = paramDrawable.getConstantState().newDrawable(); ; localObject = paramDrawable)
      {
        if (bool)
          localObject = zza(paramImageView.getDrawable(), (Drawable)localObject);
        paramImageView.setImageDrawable((Drawable)localObject);
        zzkl localzzkl;
        Uri localUri;
        if ((paramImageView instanceof zzkl))
        {
          localzzkl = (zzkl)paramImageView;
          if (!paramBoolean3)
            break label178;
          localUri = this.zzOA.uri;
          label136: localzzkl.zzi(localUri);
          if (i == 0)
            break label184;
        }
        label178: label184: for (int j = this.zzOC; ; j = 0)
        {
          localzzkl.zzaE(j);
          if (!bool)
            break;
          ((zzkj)localObject).startTransition(250);
          return;
          localUri = null;
          break label136;
        }
      }
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzb))
        return false;
      if (this == paramObject)
        return true;
      zzb localzzb = (zzb)paramObject;
      ImageView localImageView1 = (ImageView)this.zzOJ.get();
      ImageView localImageView2 = (ImageView)localzzb.zzOJ.get();
      if ((localImageView2 != null) && (localImageView1 != null) && (zzw.equal(localImageView2, localImageView1)));
      for (boolean bool = true; ; bool = false)
        return bool;
    }

    public int hashCode()
    {
      return 0;
    }

    protected void zza(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      ImageView localImageView = (ImageView)this.zzOJ.get();
      if (localImageView != null)
        zza(localImageView, paramDrawable, paramBoolean1, paramBoolean2, paramBoolean3);
    }
  }

  public static final class zzc extends zza
  {
    private WeakReference<ImageManager.OnImageLoadedListener> zzOK;

    public zzc(ImageManager.OnImageLoadedListener paramOnImageLoadedListener, Uri paramUri)
    {
      super(0);
      zzb.zzh(paramOnImageLoadedListener);
      this.zzOK = new WeakReference(paramOnImageLoadedListener);
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof zzc))
        return false;
      if (this == paramObject)
        return true;
      zzc localzzc = (zzc)paramObject;
      ImageManager.OnImageLoadedListener localOnImageLoadedListener1 = (ImageManager.OnImageLoadedListener)this.zzOK.get();
      ImageManager.OnImageLoadedListener localOnImageLoadedListener2 = (ImageManager.OnImageLoadedListener)localzzc.zzOK.get();
      if ((localOnImageLoadedListener2 != null) && (localOnImageLoadedListener1 != null) && (zzw.equal(localOnImageLoadedListener2, localOnImageLoadedListener1)) && (zzw.equal(localzzc.zzOA, this.zzOA)));
      for (boolean bool = true; ; bool = false)
        return bool;
    }

    public int hashCode()
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.zzOA;
      return zzw.hashCode(arrayOfObject);
    }

    protected void zza(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      if (!paramBoolean2)
      {
        ImageManager.OnImageLoadedListener localOnImageLoadedListener = (ImageManager.OnImageLoadedListener)this.zzOK.get();
        if (localOnImageLoadedListener != null)
          localOnImageLoadedListener.onImageLoaded(this.zzOA.uri, paramDrawable, paramBoolean3);
      }
    }
  }
}