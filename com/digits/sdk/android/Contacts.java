package com.digits.sdk.android;

import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;

public class Contacts
{

  @SerializedName("next_cursor")
  public String nextCursor;

  @SerializedName("users")
  public ArrayList<DigitsUser> users;
}