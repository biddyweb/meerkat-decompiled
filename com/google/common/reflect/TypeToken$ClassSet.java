package com.google.common.reflect;

import com.google.common.collect.FluentIterable;
import com.google.common.collect.ImmutableSet;
import java.util.Set;

final class TypeToken$ClassSet extends TypeToken<T>.TypeSet
{
  private static final long serialVersionUID;
  private transient ImmutableSet<TypeToken<? super T>> classes;

  private TypeToken$ClassSet(TypeToken paramTypeToken)
  {
    super(paramTypeToken);
  }

  private Object readResolve()
  {
    return this.this$0.getTypes().classes();
  }

  public TypeToken<T>.TypeSet classes()
  {
    return this;
  }

  protected Set<TypeToken<? super T>> delegate()
  {
    ImmutableSet localImmutableSet = this.classes;
    if (localImmutableSet == null)
    {
      localImmutableSet = FluentIterable.from(TypeToken.TypeCollector.FOR_GENERIC_TYPE.classesOnly().collectTypes(this.this$0)).filter(TypeToken.TypeFilter.IGNORE_TYPE_VARIABLE_OR_WILDCARD).toSet();
      this.classes = localImmutableSet;
    }
    return localImmutableSet;
  }

  public TypeToken<T>.TypeSet interfaces()
  {
    throw new UnsupportedOperationException("classes().interfaces() not supported.");
  }

  public Set<Class<? super T>> rawTypes()
  {
    return ImmutableSet.copyOf(TypeToken.TypeCollector.FOR_RAW_TYPE.classesOnly().collectTypes(TypeToken.access$200(this.this$0)));
  }
}