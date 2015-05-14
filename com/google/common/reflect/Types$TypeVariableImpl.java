package com.google.common.reflect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import java.lang.reflect.GenericDeclaration;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

final class Types$TypeVariableImpl<D extends GenericDeclaration>
  implements TypeVariable<D>
{
  private final ImmutableList<Type> bounds;
  private final D genericDeclaration;
  private final String name;

  Types$TypeVariableImpl(D paramD, String paramString, Type[] paramArrayOfType)
  {
    Types.access$200(paramArrayOfType, "bound for type variable");
    this.genericDeclaration = ((GenericDeclaration)Preconditions.checkNotNull(paramD));
    this.name = ((String)Preconditions.checkNotNull(paramString));
    this.bounds = ImmutableList.copyOf(paramArrayOfType);
  }

  public boolean equals(Object paramObject)
  {
    if (Types.NativeTypeVariableEquals.NATIVE_TYPE_VARIABLE_ONLY)
      if ((paramObject instanceof TypeVariableImpl))
      {
        TypeVariableImpl localTypeVariableImpl = (TypeVariableImpl)paramObject;
        if ((!this.name.equals(localTypeVariableImpl.getName())) || (!this.genericDeclaration.equals(localTypeVariableImpl.getGenericDeclaration())) || (!this.bounds.equals(localTypeVariableImpl.bounds)));
      }
    TypeVariable localTypeVariable;
    do
    {
      return true;
      return false;
      return false;
      if (!(paramObject instanceof TypeVariable))
        break;
      localTypeVariable = (TypeVariable)paramObject;
    }
    while ((this.name.equals(localTypeVariable.getName())) && (this.genericDeclaration.equals(localTypeVariable.getGenericDeclaration())));
    return false;
    return false;
  }

  public Type[] getBounds()
  {
    return Types.access$300(this.bounds);
  }

  public D getGenericDeclaration()
  {
    return this.genericDeclaration;
  }

  public String getName()
  {
    return this.name;
  }

  public int hashCode()
  {
    return this.genericDeclaration.hashCode() ^ this.name.hashCode();
  }

  public String toString()
  {
    return this.name;
  }
}