package com.google.common.reflect;

import com.google.common.base.Objects;
import java.io.Serializable;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

final class Types$GenericArrayTypeImpl
  implements GenericArrayType, Serializable
{
  private static final long serialVersionUID;
  private final Type componentType;

  Types$GenericArrayTypeImpl(Type paramType)
  {
    this.componentType = Types.JavaVersion.CURRENT.usedInGenericType(paramType);
  }

  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof Serializable))
    {
      GenericArrayType localGenericArrayType = (Serializable)paramObject;
      return Objects.equal(getGenericComponentType(), localGenericArrayType.getGenericComponentType());
    }
    return false;
  }

  public Type getGenericComponentType()
  {
    return this.componentType;
  }

  public int hashCode()
  {
    return this.componentType.hashCode();
  }

  public String toString()
  {
    return String.valueOf(Types.toString(this.componentType)).concat("[]");
  }
}