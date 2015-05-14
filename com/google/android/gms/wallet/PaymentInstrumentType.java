package com.google.android.gms.wallet;

import java.util.ArrayList;
import java.util.Arrays;

public final class PaymentInstrumentType
{
  public static final int AMEX = 3;
  public static final int CHROME_PROXY_CARD_TYPE = 2;
  public static final int DISCOVER = 4;
  public static final int JCB = 5;
  public static final int MASTER_CARD = 2;
  public static final int VISA = 1;

  public static ArrayList<Integer> getAll()
  {
    Integer[] arrayOfInteger = new Integer[5];
    arrayOfInteger[0] = Integer.valueOf(1);
    arrayOfInteger[1] = Integer.valueOf(2);
    arrayOfInteger[2] = Integer.valueOf(3);
    arrayOfInteger[3] = Integer.valueOf(4);
    arrayOfInteger[4] = Integer.valueOf(5);
    return new ArrayList(Arrays.asList(arrayOfInteger));
  }
}