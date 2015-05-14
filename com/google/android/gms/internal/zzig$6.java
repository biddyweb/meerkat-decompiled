package com.google.android.gms.internal;

import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.webkit.JsPromptResult;
import android.widget.EditText;

final class zzig$6
  implements DialogInterface.OnClickListener
{
  zzig$6(JsPromptResult paramJsPromptResult, EditText paramEditText)
  {
  }

  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    this.zzAm.confirm(this.zzAn.getText().toString());
  }
}