package com.digits.sdk.android;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.widget.Button;
import android.widget.TextView;

class ContactsActivityDelegateImpl
  implements ContactsActivityDelegate
{
  final Activity activity;
  final ContactsController controller;

  public ContactsActivityDelegateImpl(Activity paramActivity)
  {
    this(paramActivity, new ContactsControllerImpl());
  }

  public ContactsActivityDelegateImpl(Activity paramActivity, ContactsController paramContactsController)
  {
    this.activity = paramActivity;
    this.controller = paramContactsController;
  }

  protected String getApplicationName()
  {
    return this.activity.getApplicationInfo().loadLabel(this.activity.getPackageManager()).toString();
  }

  protected String getFormattedDescription()
  {
    Activity localActivity = this.activity;
    int i = R.string.dgts__upload_contacts;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = getApplicationName();
    return localActivity.getString(i, arrayOfObject);
  }

  public void init()
  {
    setContentView();
    setUpViews();
  }

  protected void setContentView()
  {
    this.activity.setContentView(R.layout.dgts__activity_contacts);
  }

  protected void setUpDescription(TextView paramTextView)
  {
    paramTextView.setText(getFormattedDescription());
  }

  protected void setUpNotNowButton(Button paramButton)
  {
    paramButton.setOnClickListener(new ContactsActivityDelegateImpl.1(this));
  }

  protected void setUpOkayButton(Button paramButton)
  {
    paramButton.setOnClickListener(new ContactsActivityDelegateImpl.2(this));
  }

  protected void setUpViews()
  {
    Button localButton1 = (Button)this.activity.findViewById(R.id.dgts__not_now);
    Button localButton2 = (Button)this.activity.findViewById(R.id.dgts__okay);
    TextView localTextView = (TextView)this.activity.findViewById(R.id.dgts__upload_contacts);
    setUpNotNowButton(localButton1);
    setUpOkayButton(localButton2);
    setUpDescription(localTextView);
  }
}