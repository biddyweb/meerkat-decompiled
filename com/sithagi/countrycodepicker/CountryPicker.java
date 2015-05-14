package com.sithagi.countrycodepicker;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.EditText;
import android.widget.ListView;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Currency;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class CountryPicker extends DialogFragment
  implements Comparator<Country>
{
  private CountryListAdapter adapter;
  private List<Country> allCountriesList;
  private ListView countryListView;
  private CountryPickerListener listener;
  private EditText searchEditText;
  private List<Country> selectedCountriesList;

  private List<Country> getAllCountries()
  {
    if (this.allCountriesList == null)
      try
      {
        this.allCountriesList = new ArrayList();
        JSONArray localJSONArray = new JSONArray(readEncodedJsonString(getActivity()));
        for (int i = 0; i < localJSONArray.length(); i++)
        {
          JSONObject localJSONObject = localJSONArray.getJSONObject(i);
          String str1 = localJSONObject.getString("name");
          String str2 = localJSONObject.getString("dial_code");
          String str3 = localJSONObject.getString("code");
          Country localCountry = new Country();
          localCountry.setCode(str3);
          localCountry.setName(str1);
          localCountry.setDialCode(str2);
          this.allCountriesList.add(localCountry);
        }
        Collections.sort(this.allCountriesList, this);
        this.selectedCountriesList = new ArrayList();
        this.selectedCountriesList.addAll(this.allCountriesList);
        List localList = this.allCountriesList;
        return localList;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    return null;
  }

  public static Currency getCurrencyCode(String paramString)
  {
    try
    {
      Currency localCurrency = Currency.getInstance(new Locale("en", paramString));
      return localCurrency;
    }
    catch (Exception localException)
    {
    }
    return null;
  }

  public static CountryPicker newInstance(String paramString)
  {
    CountryPicker localCountryPicker = new CountryPicker();
    Bundle localBundle = new Bundle();
    localBundle.putString("dialogTitle", paramString);
    localCountryPicker.setArguments(localBundle);
    return localCountryPicker;
  }

  private static String readEncodedJsonString(Context paramContext)
    throws IOException
  {
    return new String(Base64.decode(paramContext.getResources().getString(R.string.countries_code), 0), "UTF-8");
  }

  @SuppressLint({"DefaultLocale"})
  private void search(String paramString)
  {
    this.selectedCountriesList.clear();
    Iterator localIterator = this.allCountriesList.iterator();
    while (localIterator.hasNext())
    {
      Country localCountry = (Country)localIterator.next();
      if (localCountry.getName().toLowerCase(Locale.ENGLISH).contains(paramString.toLowerCase()))
        this.selectedCountriesList.add(localCountry);
    }
    this.adapter.notifyDataSetChanged();
  }

  public int compare(Country paramCountry1, Country paramCountry2)
  {
    return paramCountry1.getName().compareTo(paramCountry2.getName());
  }

  public ListView getCountryListView()
  {
    return this.countryListView;
  }

  public EditText getSearchEditText()
  {
    return this.searchEditText;
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(R.layout.country_picker, null);
    getAllCountries();
    Bundle localBundle = getArguments();
    if (localBundle != null)
    {
      String str = localBundle.getString("dialogTitle");
      getDialog().setTitle(str);
      int i = getResources().getDimensionPixelSize(R.dimen.cp_dialog_width);
      int j = getResources().getDimensionPixelSize(R.dimen.cp_dialog_height);
      getDialog().getWindow().setLayout(i, j);
    }
    this.searchEditText = ((EditText)localView.findViewById(R.id.country_code_picker_search));
    this.countryListView = ((ListView)localView.findViewById(R.id.country_code_picker_listview));
    this.adapter = new CountryListAdapter(getActivity(), this.selectedCountriesList);
    this.countryListView.setAdapter(this.adapter);
    this.countryListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        if (CountryPicker.this.listener != null)
        {
          Country localCountry = (Country)CountryPicker.this.selectedCountriesList.get(paramAnonymousInt);
          CountryPicker.this.listener.onSelectCountry(localCountry.getName(), localCountry.getCode(), localCountry.getDialCode());
        }
      }
    });
    this.searchEditText.addTextChangedListener(new TextWatcher()
    {
      public void afterTextChanged(Editable paramAnonymousEditable)
      {
        CountryPicker.this.search(paramAnonymousEditable.toString());
      }

      public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
      }

      public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
      }
    });
    return localView;
  }

  public void setListener(CountryPickerListener paramCountryPickerListener)
  {
    this.listener = paramCountryPickerListener;
  }
}