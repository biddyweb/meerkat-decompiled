package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
final class ByFunctionOrdering<F, T> extends Ordering<F>
  implements Serializable
{
  private static final long serialVersionUID;
  final Function<F, ? extends T> function;
  final Ordering<T> ordering;

  ByFunctionOrdering(Function<F, ? extends T> paramFunction, Ordering<T> paramOrdering)
  {
    this.function = ((Function)Preconditions.checkNotNull(paramFunction));
    this.ordering = ((Ordering)Preconditions.checkNotNull(paramOrdering));
  }

  public int compare(F paramF1, F paramF2)
  {
    return this.ordering.compare(this.function.apply(paramF1), this.function.apply(paramF2));
  }

  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this);
    ByFunctionOrdering localByFunctionOrdering;
    do
    {
      return true;
      if (!(paramObject instanceof ByFunctionOrdering))
        break;
      localByFunctionOrdering = (ByFunctionOrdering)paramObject;
    }
    while ((this.function.equals(localByFunctionOrdering.function)) && (this.ordering.equals(localByFunctionOrdering.ordering)));
    return false;
    return false;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.function;
    arrayOfObject[1] = this.ordering;
    return Objects.hashCode(arrayOfObject);
  }

  public String toString()
  {
    String str1 = String.valueOf(String.valueOf(this.ordering));
    String str2 = String.valueOf(String.valueOf(this.function));
    return 13 + str1.length() + str2.length() + str1 + ".onResultOf(" + str2 + ")";
  }
}