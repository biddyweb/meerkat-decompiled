package com.sithagi.countrycodepicker;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Locale;

public class CountryListAdapter extends BaseAdapter
{
  private Context context;
  List<Country> countries;
  LayoutInflater inflater;

  public CountryListAdapter(Context paramContext, List<Country> paramList)
  {
    this.context = paramContext;
    this.countries = paramList;
    this.inflater = ((LayoutInflater)this.context.getSystemService("layout_inflater"));
  }

  private int getResId(String paramString)
  {
    try
    {
      int i = R.drawable.class.getField(paramString).getInt(null);
      return i;
    }
    catch (Exception localException)
    {
      Log.e("CountryCodePicker", "Failure to get drawable id.", localException);
    }
    return -1;
  }

  public int getCount()
  {
    return this.countries.size();
  }

  public Object getItem(int paramInt)
  {
    return null;
  }

  public long getItemId(int paramInt)
  {
    return 0L;
  }

  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    View localView = paramView;
    Country localCountry = (Country)this.countries.get(paramInt);
    Cell localCell;
    if (paramView == null)
    {
      localCell = new Cell();
      localView = this.inflater.inflate(R.layout.row, null);
      localCell.textView = ((TextView)localView.findViewById(R.id.row_title));
      localCell.imageView = ((ImageView)localView.findViewById(R.id.row_icon));
      localView.setTag(localCell);
    }
    while (true)
    {
      localCell.textView.setText(localCountry.getName());
      String str = "flag_" + localCountry.getCode().toLowerCase(Locale.ENGLISH);
      localCell.imageView.setImageResource(getResId(str));
      return localView;
      localCell = (Cell)localView.getTag();
    }
  }

  static class Cell
  {
    public ImageView imageView;
    public TextView textView;
  }
}