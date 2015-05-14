package com.google.android.gms.drive.widget;

import android.content.Context;
import android.database.CursorIndexOutOfBoundsException;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.drive.internal.zzw;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class DataBufferAdapter<T> extends BaseAdapter
{
  private final Context mContext;
  private final int zzXH;
  private int zzXI;
  private final int zzXJ;
  private final List<DataBuffer<T>> zzXK;
  private final LayoutInflater zzXL;
  private boolean zzXM = true;

  public DataBufferAdapter(Context paramContext, int paramInt)
  {
    this(paramContext, paramInt, 0, new ArrayList());
  }

  public DataBufferAdapter(Context paramContext, int paramInt1, int paramInt2)
  {
    this(paramContext, paramInt1, paramInt2, new ArrayList());
  }

  public DataBufferAdapter(Context paramContext, int paramInt1, int paramInt2, List<DataBuffer<T>> paramList)
  {
    this.mContext = paramContext;
    this.zzXI = paramInt1;
    this.zzXH = paramInt1;
    this.zzXJ = paramInt2;
    this.zzXK = paramList;
    this.zzXL = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
  }

  public DataBufferAdapter(Context paramContext, int paramInt1, int paramInt2, DataBuffer<T>[] paramArrayOfDataBuffer)
  {
    this(paramContext, paramInt1, paramInt2, Arrays.asList(paramArrayOfDataBuffer));
  }

  public DataBufferAdapter(Context paramContext, int paramInt, List<DataBuffer<T>> paramList)
  {
    this(paramContext, paramInt, 0, paramList);
  }

  public DataBufferAdapter(Context paramContext, int paramInt, DataBuffer<T>[] paramArrayOfDataBuffer)
  {
    this(paramContext, paramInt, 0, Arrays.asList(paramArrayOfDataBuffer));
  }

  private View zza(int paramInt1, View paramView, ViewGroup paramViewGroup, int paramInt2)
  {
    View localView;
    if (paramView == null)
      localView = this.zzXL.inflate(paramInt2, paramViewGroup, false);
    Object localObject1;
    Object localObject2;
    try
    {
      TextView localTextView2;
      if (this.zzXJ == 0)
        localTextView2 = (TextView)localView;
      TextView localTextView1;
      for (localObject1 = localTextView2; ; localObject1 = localTextView1)
      {
        localObject2 = getItem(paramInt1);
        if (!(localObject2 instanceof CharSequence))
          break label113;
        ((TextView)localObject1).setText((CharSequence)localObject2);
        return localView;
        localView = paramView;
        break;
        localTextView1 = (TextView)localView.findViewById(this.zzXJ);
      }
    }
    catch (ClassCastException localClassCastException)
    {
      zzw.zza("DataBufferAdapter", localClassCastException, "You must supply a resource ID for a TextView");
      throw new IllegalStateException("DataBufferAdapter requires the resource ID to be a TextView", localClassCastException);
    }
    label113: ((TextView)localObject1).setText(localObject2.toString());
    return localView;
  }

  public void append(DataBuffer<T> paramDataBuffer)
  {
    this.zzXK.add(paramDataBuffer);
    if (this.zzXM)
      notifyDataSetChanged();
  }

  public void clear()
  {
    Iterator localIterator = this.zzXK.iterator();
    while (localIterator.hasNext())
      ((DataBuffer)localIterator.next()).release();
    this.zzXK.clear();
    if (this.zzXM)
      notifyDataSetChanged();
  }

  public Context getContext()
  {
    return this.mContext;
  }

  public int getCount()
  {
    Iterator localIterator = this.zzXK.iterator();
    int i = 0;
    while (localIterator.hasNext())
      i += ((DataBuffer)localIterator.next()).getCount();
    return i;
  }

  public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    return zza(paramInt, paramView, paramViewGroup, this.zzXI);
  }

  public T getItem(int paramInt)
    throws CursorIndexOutOfBoundsException
  {
    Iterator localIterator = this.zzXK.iterator();
    int i = paramInt;
    while (localIterator.hasNext())
    {
      DataBuffer localDataBuffer = (DataBuffer)localIterator.next();
      int j = localDataBuffer.getCount();
      if (j <= i)
        i -= j;
      else
        try
        {
          Object localObject = localDataBuffer.get(i);
          return localObject;
        }
        catch (CursorIndexOutOfBoundsException localCursorIndexOutOfBoundsException)
        {
          throw new CursorIndexOutOfBoundsException(paramInt, getCount());
        }
    }
    throw new CursorIndexOutOfBoundsException(paramInt, getCount());
  }

  public long getItemId(int paramInt)
  {
    return paramInt;
  }

  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    return zza(paramInt, paramView, paramViewGroup, this.zzXH);
  }

  public void notifyDataSetChanged()
  {
    super.notifyDataSetChanged();
    this.zzXM = true;
  }

  public void setDropDownViewResource(int paramInt)
  {
    this.zzXI = paramInt;
  }

  public void setNotifyOnChange(boolean paramBoolean)
  {
    this.zzXM = paramBoolean;
  }
}