package org.joda.time.convert;

class ConverterSet
{
  private final Converter[] iConverters;
  private Entry[] iSelectEntries;

  ConverterSet(Converter[] paramArrayOfConverter)
  {
    this.iConverters = paramArrayOfConverter;
    this.iSelectEntries = new Entry[16];
  }

  private static Converter selectSlow(ConverterSet paramConverterSet, Class<?> paramClass)
  {
    Converter[] arrayOfConverter1 = paramConverterSet.iConverters;
    int i = arrayOfConverter1.length;
    int j = i;
    ConverterSet localConverterSet = paramConverterSet;
    int k = j - 1;
    Class localClass3;
    Converter localConverter1;
    if (k >= 0)
    {
      Converter localConverter3 = arrayOfConverter1[k];
      localClass3 = localConverter3.getSupportedType();
      if (localClass3 == paramClass)
        localConverter1 = localConverter3;
    }
    do
    {
      do
      {
        return localConverter1;
        if ((localClass3 == null) || ((paramClass != null) && (!localClass3.isAssignableFrom(paramClass))))
        {
          localConverterSet = localConverterSet.remove(k, null);
          arrayOfConverter1 = localConverterSet.iConverters;
          i = arrayOfConverter1.length;
        }
        j = k;
        break;
        localConverter1 = null;
      }
      while (paramClass == null);
      localConverter1 = null;
    }
    while (i == 0);
    if (i == 1)
      return arrayOfConverter1[0];
    Converter[] arrayOfConverter2 = arrayOfConverter1;
    Object localObject1 = localConverterSet;
    int m = i;
    while (true)
    {
      int n = i - 1;
      if (n < 0)
        break;
      Class localClass2 = arrayOfConverter2[n].getSupportedType();
      Object localObject2 = localObject1;
      int i2 = n;
      int i3 = m;
      while (true)
      {
        i3--;
        if (i3 < 0)
          break;
        if ((i3 != i2) && (arrayOfConverter2[i3].getSupportedType().isAssignableFrom(localClass2)))
        {
          localObject2 = ((ConverterSet)localObject2).remove(i3, null);
          arrayOfConverter2 = ((ConverterSet)localObject2).iConverters;
          m = arrayOfConverter2.length;
          i2 = m - 1;
        }
      }
      i = i2;
      localObject1 = localObject2;
    }
    if (m == 1)
      return arrayOfConverter2[0];
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("Unable to find best converter for type \"");
    localStringBuilder.append(paramClass.getName());
    localStringBuilder.append("\" from remaining set: ");
    int i1 = 0;
    if (i1 < m)
    {
      Converter localConverter2 = arrayOfConverter2[i1];
      Class localClass1 = localConverter2.getSupportedType();
      localStringBuilder.append(localConverter2.getClass().getName());
      localStringBuilder.append('[');
      if (localClass1 == null);
      for (String str = null; ; str = localClass1.getName())
      {
        localStringBuilder.append(str);
        localStringBuilder.append("], ");
        i1++;
        break;
      }
    }
    throw new IllegalStateException(localStringBuilder.toString());
  }

  ConverterSet add(Converter paramConverter, Converter[] paramArrayOfConverter)
  {
    for (Converter localConverter : this.iConverters)
    {
      if (paramConverter.equals(localConverter))
      {
        if (paramArrayOfConverter != null)
          paramArrayOfConverter[0] = null;
        return this;
      }
      if (paramConverter.getSupportedType() == localConverter.getSupportedType())
      {
        Converter[] arrayOfConverter3 = new Converter[???];
        int k = 0;
        if (k < ???)
        {
          if (k != ???)
            arrayOfConverter3[k] = ???[k];
          while (true)
          {
            k++;
            break;
            arrayOfConverter3[k] = paramConverter;
          }
        }
        if (paramArrayOfConverter != null)
          paramArrayOfConverter[0] = localConverter;
        return new ConverterSet(arrayOfConverter3);
      }
    }
    Converter[] arrayOfConverter2 = new Converter[??? + 1];
    System.arraycopy(???, 0, arrayOfConverter2, 0, ???);
    arrayOfConverter2[???] = paramConverter;
    if (paramArrayOfConverter != null)
      paramArrayOfConverter[0] = null;
    return new ConverterSet(arrayOfConverter2);
  }

  void copyInto(Converter[] paramArrayOfConverter)
  {
    System.arraycopy(this.iConverters, 0, paramArrayOfConverter, 0, this.iConverters.length);
  }

  ConverterSet remove(int paramInt, Converter[] paramArrayOfConverter)
  {
    Converter[] arrayOfConverter1 = this.iConverters;
    int i = arrayOfConverter1.length;
    if (paramInt >= i)
      throw new IndexOutOfBoundsException();
    if (paramArrayOfConverter != null)
      paramArrayOfConverter[0] = arrayOfConverter1[paramInt];
    Converter[] arrayOfConverter2 = new Converter[i - 1];
    int j = 0;
    int k = 0;
    int m;
    if (j < i)
    {
      if (j == paramInt)
        break label96;
      m = k + 1;
      arrayOfConverter2[k] = arrayOfConverter1[j];
    }
    while (true)
    {
      j++;
      k = m;
      break;
      return new ConverterSet(arrayOfConverter2);
      label96: m = k;
    }
  }

  ConverterSet remove(Converter paramConverter, Converter[] paramArrayOfConverter)
  {
    Converter[] arrayOfConverter = this.iConverters;
    int i = arrayOfConverter.length;
    int j = 0;
    if (j < i)
      if (paramConverter.equals(arrayOfConverter[j]))
        this = remove(j, paramArrayOfConverter);
    while (paramArrayOfConverter == null)
    {
      return this;
      j++;
      break;
    }
    paramArrayOfConverter[0] = null;
    return this;
  }

  Converter select(Class<?> paramClass)
    throws IllegalStateException
  {
    Entry[] arrayOfEntry1 = this.iSelectEntries;
    int i = arrayOfEntry1.length;
    int j;
    int k;
    if (paramClass == null)
    {
      j = 0;
      k = j;
    }
    while (true)
    {
      Entry localEntry1 = arrayOfEntry1[k];
      int i3;
      if (localEntry1 != null)
      {
        if (localEntry1.iType == paramClass)
        {
          return localEntry1.iConverter;
          j = paramClass.hashCode() & i - 1;
          break;
        }
        i3 = k + 1;
        if (i3 < i)
          break label250;
        k = 0;
        continue;
      }
      Converter localConverter = selectSlow(this, paramClass);
      Entry localEntry2 = new Entry(paramClass, localConverter);
      Entry[] arrayOfEntry2 = (Entry[])arrayOfEntry1.clone();
      arrayOfEntry2[k] = localEntry2;
      for (int m = 0; m < i; m++)
        if (arrayOfEntry2[m] == null)
        {
          this.iSelectEntries = arrayOfEntry2;
          return localConverter;
        }
      int n = i << 1;
      Entry[] arrayOfEntry3 = new Entry[n];
      for (int i1 = 0; i1 < i; i1++)
      {
        Entry localEntry3 = arrayOfEntry2[i1];
        Class localClass = localEntry3.iType;
        int i2;
        if (localClass == null)
          i2 = 0;
        while (arrayOfEntry3[i2] != null)
        {
          i2++;
          if (i2 >= n)
          {
            i2 = 0;
            continue;
            i2 = localClass.hashCode() & n - 1;
          }
        }
        arrayOfEntry3[i2] = localEntry3;
      }
      this.iSelectEntries = arrayOfEntry3;
      return localConverter;
      label250: k = i3;
    }
  }

  int size()
  {
    return this.iConverters.length;
  }

  static class Entry
  {
    final Converter iConverter;
    final Class<?> iType;

    Entry(Class<?> paramClass, Converter paramConverter)
    {
      this.iType = paramClass;
      this.iConverter = paramConverter;
    }
  }
}