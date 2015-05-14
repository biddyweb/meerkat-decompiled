package com.instabug.library.dialog;

import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import com.instabug.library.Instabug.a;

final class g
  implements DialogInterface.OnCancelListener
{
  g(d paramd)
  {
  }

  public final void onCancel(DialogInterface paramDialogInterface)
  {
    Instabug.a.a(this.a.getOwnerActivity());
  }
}