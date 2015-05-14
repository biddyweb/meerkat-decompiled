package com.google.common.reflect;

import com.google.common.collect.FluentIterable;
import com.google.common.collect.ForwardingSet;
import com.google.common.collect.ImmutableSet;
import java.io.Serializable;
import java.util.Set;

public class TypeToken$TypeSet extends ForwardingSet<TypeToken<? super T>>
  implements Serializable
{
  private static final long serialVersionUID;
  private transient ImmutableSet<TypeToken<? super T>> types;

  TypeToken$TypeSet(TypeToken paramTypeToken)
  {
  }

  public TypeToken<T>.TypeSet classes()
  {
    return new TypeToken.ClassSet(this.this$0, null);
  }

  protected Set<TypeToken<? super T>> delegate()
  {
    ImmutableSet localImmutableSet = this.types;
    if (localImmutableSet == null)
    {
      localImmutableSet = FluentIterable.from(TypeToken.TypeCollector.FOR_GENERIC_TYPE.collectTypes(this.this$0)).filter(TypeToken.TypeFilter.IGNORE_TYPE_VARIABLE_OR_WILDCARD).toSet();
      this.types = localImmutableSet;
    }
    return localImmutableSet;
  }

  public TypeToken<T>.TypeSet interfaces()
  {
    return new TypeToken.InterfaceSet(this.this$0, this);
  }

  public Set<Class<? super T>> rawTypes()
  {
    return ImmutableSet.copyOf(TypeToken.TypeCollector.FOR_RAW_TYPE.collectTypes(TypeToken.access$200(this.this$0)));
  }
}