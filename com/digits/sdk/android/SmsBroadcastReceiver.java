package com.digits.sdk.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.telephony.SmsMessage;
import android.widget.EditText;
import java.lang.ref.WeakReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SmsBroadcastReceiver extends BroadcastReceiver
{
  static final String PDU_EXTRA = "pdus";
  final WeakReference<EditText> editTextWeakReference;
  final Pattern patternConfirmationCode = Pattern.compile(":\\s(\\d{6}).*Digits by Twitter");

  SmsBroadcastReceiver(EditText paramEditText)
  {
    this.editTextWeakReference = new WeakReference(paramEditText);
  }

  String getConfirmationCode(SmsMessage paramSmsMessage)
  {
    String str = paramSmsMessage.getDisplayMessageBody();
    if (str != null)
    {
      Matcher localMatcher = this.patternConfirmationCode.matcher(str);
      if (localMatcher.find())
        return localMatcher.group(1);
    }
    return null;
  }

  String getConfirmationCode(SmsMessage[] paramArrayOfSmsMessage)
  {
    int i = paramArrayOfSmsMessage.length;
    for (int j = 0; j < i; j++)
    {
      String str = getConfirmationCode(paramArrayOfSmsMessage[j]);
      if (str != null)
        return str;
    }
    return null;
  }

  SmsMessage[] getMessagesFromIntent(Intent paramIntent)
  {
    Object[] arrayOfObject = (Object[])paramIntent.getSerializableExtra("pdus");
    int i = arrayOfObject.length;
    SmsMessage[] arrayOfSmsMessage = new SmsMessage[i];
    for (int j = 0; j < i; j++)
      arrayOfSmsMessage[j] = SmsMessage.createFromPdu((byte[])(byte[])arrayOfObject[j]);
    return arrayOfSmsMessage;
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str = getConfirmationCode(getMessagesFromIntent(paramIntent));
    if (str != null)
    {
      EditText localEditText = (EditText)this.editTextWeakReference.get();
      if (localEditText != null)
      {
        localEditText.setText(str);
        localEditText.setSelection(str.length());
      }
    }
  }
}