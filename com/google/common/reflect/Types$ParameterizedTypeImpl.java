package com.google.common.reflect;

import com.google.common.base.Joiner;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Iterables;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import javax.annotation.Nullable;

final class Types$ParameterizedTypeImpl
  implements ParameterizedType, Serializable
{
  private static final long serialVersionUID;
  private final ImmutableList<Type> argumentsList;
  private final Type ownerType;
  private final Class<?> rawType;

  Types$ParameterizedTypeImpl(@Nullable Type paramType, Class<?> paramClass, Type[] paramArrayOfType)
  {
    Preconditions.checkNotNull(paramClass);
    if (paramArrayOfType.length == paramClass.getTypeParameters().length);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool);
      Types.access$200(paramArrayOfType, "type parameter");
      this.ownerType = paramType;
      this.rawType = paramClass;
      this.argumentsList = Types.JavaVersion.CURRENT.usedInGenericType(paramArrayOfType);
      return;
    }
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof Serializable));
    ParameterizedType localParameterizedType;
    do
    {
      return false;
      localParameterizedType = (Serializable)paramObject;
    }
    while ((!getRawType().equals(localParameterizedType.getRawType())) || (!Objects.equal(getOwnerType(), localParameterizedType.getOwnerType())) || (!Arrays.equals(getActualTypeArguments(), localParameterizedType.getActualTypeArguments())));
    return true;
  }

  public Type[] getActualTypeArguments()
  {
    return Types.access$300(this.argumentsList);
  }

  public Type getOwnerType()
  {
    return this.ownerType;
  }

  public Type getRawType()
  {
    return this.rawType;
  }

  public int hashCode()
  {
    if (this.ownerType == null);
    for (int i = 0; ; i = this.ownerType.hashCode())
      return i ^ this.argumentsList.hashCode() ^ this.rawType.hashCode();
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (this.ownerType != null)
      localStringBuilder.append(Types.JavaVersion.CURRENT.typeName(this.ownerType)).append('.');
    localStringBuilder.append(this.rawType.getName()).append('<').append(Types.access$500().join(Iterables.transform(this.argumentsList, Types.access$400()))).append('>');
    return localStringBuilder.toString();
  }
}