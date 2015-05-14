package com.digits.sdk.android;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ListView;
import android.widget.TextView;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.util.List;
import java.util.Locale;

public class CountryListSpinner extends TextView
  implements View.OnClickListener, CountryListLoadTask.Listener
{
  private CountryListAdapter countryListAdapter;
  private DialogPopup dialogPopup;
  private View.OnClickListener listener;
  private String selectedCountryName;
  private String textFormat;

  public CountryListSpinner(Context paramContext)
  {
    this(paramContext, null, 16842881);
  }

  public CountryListSpinner(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842881);
  }

  public CountryListSpinner(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init();
  }

  private void executeUserClickListener(View paramView)
  {
    if (this.listener != null)
      this.listener.onClick(paramView);
  }

  private void init()
  {
    super.setOnClickListener(this);
    this.countryListAdapter = new CountryListAdapter(getContext());
    this.dialogPopup = new DialogPopup(this.countryListAdapter);
    this.textFormat = getResources().getString(R.string.dgts__country_spinner_format);
    this.selectedCountryName = "";
    setSpinnerText(1, Locale.US.getDisplayCountry());
  }

  private void loadCountryList()
  {
    new CountryListLoadTask(this).executeOnExecutor(Digits.getInstance().getExecutorService(), new Void[0]);
  }

  private void setSpinnerText(int paramInt, String paramString)
  {
    String str = this.textFormat;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramString;
    arrayOfObject[1] = Integer.valueOf(paramInt);
    setText(String.format(str, arrayOfObject));
    setTag(Integer.valueOf(paramInt));
  }

  public void onClick(View paramView)
  {
    if (this.countryListAdapter.getCount() == 0)
      loadCountryList();
    while (true)
    {
      CommonUtils.hideKeyboard(getContext(), this);
      executeUserClickListener(paramView);
      return;
      this.dialogPopup.show(this.countryListAdapter.getPositionForCountry(this.selectedCountryName));
    }
  }

  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (this.dialogPopup.isShowing())
      this.dialogPopup.dismiss();
  }

  public void onLoadComplete(List<CountryInfo> paramList)
  {
    this.countryListAdapter.setData(paramList);
    this.dialogPopup.show(this.countryListAdapter.getPositionForCountry(this.selectedCountryName));
  }

  void setDialogPopup(DialogPopup paramDialogPopup)
  {
    this.dialogPopup = paramDialogPopup;
  }

  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    this.listener = paramOnClickListener;
  }

  public void setSelectedForCountry(String paramString1, String paramString2)
  {
    if ((!TextUtils.isEmpty(paramString1)) && (!TextUtils.isEmpty(paramString2)))
    {
      this.selectedCountryName = paramString1;
      setSpinnerText(Integer.valueOf(paramString2).intValue(), paramString1);
    }
  }

  public class DialogPopup
    implements DialogInterface.OnClickListener
  {
    private static final long DELAY_MILLIS = 10L;
    private AlertDialog dialog;
    private final CountryListAdapter listAdapter;

    DialogPopup(CountryListAdapter arg2)
    {
      Object localObject;
      this.listAdapter = localObject;
    }

    public void dismiss()
    {
      this.dialog.dismiss();
      this.dialog = null;
    }

    public boolean isShowing()
    {
      if (this.dialog != null)
        return this.dialog.isShowing();
      return false;
    }

    public void onClick(DialogInterface paramDialogInterface, int paramInt)
    {
      CountryInfo localCountryInfo = (CountryInfo)this.listAdapter.getItem(paramInt);
      CountryListSpinner.access$002(CountryListSpinner.this, localCountryInfo.country);
      CountryListSpinner.this.setSpinnerText(localCountryInfo.countryCode, localCountryInfo.country);
      dismiss();
    }

    public void show(final int paramInt)
    {
      if (this.listAdapter == null)
        return;
      this.dialog = new AlertDialog.Builder(CountryListSpinner.this.getContext()).setSingleChoiceItems(this.listAdapter, 0, this).create();
      this.dialog.setCanceledOnTouchOutside(true);
      final ListView localListView = this.dialog.getListView();
      localListView.setFastScrollEnabled(true);
      localListView.postDelayed(new Runnable()
      {
        public void run()
        {
          localListView.setSelection(paramInt);
        }
      }
      , 10L);
      this.dialog.show();
    }
  }
}