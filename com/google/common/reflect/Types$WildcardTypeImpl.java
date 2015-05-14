package com.google.common.reflect;

import com.google.common.collect.ImmutableList;
import java.io.Serializable;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.Iterator;

final class Types$WildcardTypeImpl
  implements WildcardType, Serializable
{
  private static final long serialVersionUID;
  private final ImmutableList<Type> lowerBounds;
  private final ImmutableList<Type> upperBounds;

  Types$WildcardTypeImpl(Type[] paramArrayOfType1, Type[] paramArrayOfType2)
  {
    Types.access$200(paramArrayOfType1, "lower bound for wildcard");
    Types.access$200(paramArrayOfType2, "upper bound for wildcard");
    this.lowerBounds = Types.JavaVersion.CURRENT.usedInGenericType(paramArrayOfType1);
    this.upperBounds = Types.JavaVersion.CURRENT.usedInGenericType(paramArrayOfType2);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1 = paramObject instanceof Serializable;
    boolean bool2 = false;
    if (bool1)
    {
      WildcardType localWildcardType = (Serializable)paramObject;
      boolean bool3 = this.lowerBounds.equals(Arrays.asList(localWildcardType.getLowerBounds()));
      bool2 = false;
      if (bool3)
      {
        boolean bool4 = this.upperBounds.equals(Arrays.asList(localWildcardType.getUpperBounds()));
        bool2 = false;
        if (bool4)
          bool2 = true;
      }
    }
    return bool2;
  }

  public Type[] getLowerBounds()
  {
    return Types.access$300(this.lowerBounds);
  }

  public Type[] getUpperBounds()
  {
    return Types.access$300(this.upperBounds);
  }

  public int hashCode()
  {
    return this.lowerBounds.hashCode() ^ this.upperBounds.hashCode();
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("?");
    Iterator localIterator1 = this.lowerBounds.iterator();
    while (localIterator1.hasNext())
    {
      Type localType2 = (Type)localIterator1.next();
      localStringBuilder.append(" super ").append(Types.JavaVersion.CURRENT.typeName(localType2));
    }
    Iterator localIterator2 = Types.access$600(this.upperBounds).iterator();
    while (localIterator2.hasNext())
    {
      Type localType1 = (Type)localIterator2.next();
      localStringBuilder.append(" extends ").append(Types.JavaVersion.CURRENT.typeName(localType1));
    }
    return localStringBuilder.toString();
  }
}