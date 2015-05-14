package co.getair.meerkat.dtos;

import android.content.Intent;

public class OnActivityResultParams
{
  private Intent data;
  private int requestCode;
  private int resultCode;

  public OnActivityResultParams(int paramInt1, int paramInt2, Intent paramIntent)
  {
    this.requestCode = paramInt1;
    this.resultCode = paramInt2;
    this.data = paramIntent;
  }

  public Intent getData()
  {
    return this.data;
  }

  public int getRequestCode()
  {
    return this.requestCode;
  }

  public int getResultCode()
  {
    return this.resultCode;
  }
}