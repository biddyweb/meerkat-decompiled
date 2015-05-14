package org.joda.time;

import java.io.Serializable;
import java.util.Locale;
import org.joda.time.field.AbstractPartialFieldProperty;

public class YearMonth$Property extends AbstractPartialFieldProperty
  implements Serializable
{
  private static final long serialVersionUID = 5727734012190224363L;
  private final YearMonth iBase;
  private final int iFieldIndex;

  YearMonth$Property(YearMonth paramYearMonth, int paramInt)
  {
    this.iBase = paramYearMonth;
    this.iFieldIndex = paramInt;
  }

  public YearMonth addToCopy(int paramInt)
  {
    int[] arrayOfInt1 = this.iBase.getValues();
    int[] arrayOfInt2 = getField().add(this.iBase, this.iFieldIndex, arrayOfInt1, paramInt);
    return new YearMonth(this.iBase, arrayOfInt2);
  }

  public YearMonth addWrapFieldToCopy(int paramInt)
  {
    int[] arrayOfInt1 = this.iBase.getValues();
    int[] arrayOfInt2 = getField().addWrapField(this.iBase, this.iFieldIndex, arrayOfInt1, paramInt);
    return new YearMonth(this.iBase, arrayOfInt2);
  }

  public int get()
  {
    return this.iBase.getValue(this.iFieldIndex);
  }

  public DateTimeField getField()
  {
    return this.iBase.getField(this.iFieldIndex);
  }

  protected ReadablePartial getReadablePartial()
  {
    return this.iBase;
  }

  public YearMonth getYearMonth()
  {
    return this.iBase;
  }

  public YearMonth setCopy(int paramInt)
  {
    int[] arrayOfInt1 = this.iBase.getValues();
    int[] arrayOfInt2 = getField().set(this.iBase, this.iFieldIndex, arrayOfInt1, paramInt);
    return new YearMonth(this.iBase, arrayOfInt2);
  }

  public YearMonth setCopy(String paramString)
  {
    return setCopy(paramString, null);
  }

  public YearMonth setCopy(String paramString, Locale paramLocale)
  {
    int[] arrayOfInt1 = this.iBase.getValues();
    int[] arrayOfInt2 = getField().set(this.iBase, this.iFieldIndex, arrayOfInt1, paramString, paramLocale);
    return new YearMonth(this.iBase, arrayOfInt2);
  }
}