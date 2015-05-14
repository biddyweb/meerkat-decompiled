package com.digits.sdk.android;

import com.google.gson.annotations.SerializedName;

class UploadError
{

  @SerializedName("code")
  final int code;

  @SerializedName("item")
  final int item;

  @SerializedName("message")
  final String message;

  UploadError(int paramInt1, String paramString, int paramInt2)
  {
    this.code = paramInt1;
    this.message = paramString;
    this.item = paramInt2;
  }
}