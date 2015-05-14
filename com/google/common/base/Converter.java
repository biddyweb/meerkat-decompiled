package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import java.util.Iterator;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
public abstract class Converter<A, B>
  implements Function<A, B>
{
  private final boolean handleNullAutomatically;
  private transient Converter<B, A> reverse;

  protected Converter()
  {
    this(true);
  }

  Converter(boolean paramBoolean)
  {
    this.handleNullAutomatically = paramBoolean;
  }

  public static <A, B> Converter<A, B> from(Function<? super A, ? extends B> paramFunction, Function<? super B, ? extends A> paramFunction1)
  {
    return new FunctionBasedConverter(paramFunction, paramFunction1, null);
  }

  public static <T> Converter<T, T> identity()
  {
    return IdentityConverter.INSTANCE;
  }

  public final <C> Converter<A, C> andThen(Converter<B, C> paramConverter)
  {
    return doAndThen(paramConverter);
  }

  @Deprecated
  @Nullable
  public final B apply(@Nullable A paramA)
  {
    return convert(paramA);
  }

  @Nullable
  public final B convert(@Nullable A paramA)
  {
    return correctedDoForward(paramA);
  }

  public Iterable<B> convertAll(final Iterable<? extends A> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable, "fromIterable");
    return new Iterable()
    {
      public Iterator<B> iterator()
      {
        return new Iterator()
        {
          private final Iterator<? extends A> fromIterator = Converter.1.this.val$fromIterable.iterator();

          public boolean hasNext()
          {
            return this.fromIterator.hasNext();
          }

          public B next()
          {
            return Converter.this.convert(this.fromIterator.next());
          }

          public void remove()
          {
            this.fromIterator.remove();
          }
        };
      }
    };
  }

  @Nullable
  A correctedDoBackward(@Nullable B paramB)
  {
    if (this.handleNullAutomatically)
    {
      if (paramB == null)
        return null;
      return Preconditions.checkNotNull(doBackward(paramB));
    }
    return doBackward(paramB);
  }

  @Nullable
  B correctedDoForward(@Nullable A paramA)
  {
    if (this.handleNullAutomatically)
    {
      if (paramA == null)
        return null;
      return Preconditions.checkNotNull(doForward(paramA));
    }
    return doForward(paramA);
  }

  <C> Converter<A, C> doAndThen(Converter<B, C> paramConverter)
  {
    return new ConverterComposition(this, (Converter)Preconditions.checkNotNull(paramConverter));
  }

  protected abstract A doBackward(B paramB);

  protected abstract B doForward(A paramA);

  public boolean equals(@Nullable Object paramObject)
  {
    return super.equals(paramObject);
  }

  public Converter<B, A> reverse()
  {
    Object localObject = this.reverse;
    if (localObject == null)
    {
      localObject = new ReverseConverter(this);
      this.reverse = ((Converter)localObject);
    }
    return localObject;
  }

  private static final class ConverterComposition<A, B, C> extends Converter<A, C>
    implements Serializable
  {
    private static final long serialVersionUID;
    final Converter<A, B> first;
    final Converter<B, C> second;

    ConverterComposition(Converter<A, B> paramConverter, Converter<B, C> paramConverter1)
    {
      this.first = paramConverter;
      this.second = paramConverter1;
    }

    @Nullable
    A correctedDoBackward(@Nullable C paramC)
    {
      return this.first.correctedDoBackward(this.second.correctedDoBackward(paramC));
    }

    @Nullable
    C correctedDoForward(@Nullable A paramA)
    {
      return this.second.correctedDoForward(this.first.correctedDoForward(paramA));
    }

    protected A doBackward(C paramC)
    {
      throw new AssertionError();
    }

    protected C doForward(A paramA)
    {
      throw new AssertionError();
    }

    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool1 = paramObject instanceof ConverterComposition;
      boolean bool2 = false;
      if (bool1)
      {
        ConverterComposition localConverterComposition = (ConverterComposition)paramObject;
        boolean bool3 = this.first.equals(localConverterComposition.first);
        bool2 = false;
        if (bool3)
        {
          boolean bool4 = this.second.equals(localConverterComposition.second);
          bool2 = false;
          if (bool4)
            bool2 = true;
        }
      }
      return bool2;
    }

    public int hashCode()
    {
      return 31 * this.first.hashCode() + this.second.hashCode();
    }

    public String toString()
    {
      String str1 = String.valueOf(String.valueOf(this.first));
      String str2 = String.valueOf(String.valueOf(this.second));
      return 10 + str1.length() + str2.length() + str1 + ".andThen(" + str2 + ")";
    }
  }

  private static final class FunctionBasedConverter<A, B> extends Converter<A, B>
    implements Serializable
  {
    private final Function<? super B, ? extends A> backwardFunction;
    private final Function<? super A, ? extends B> forwardFunction;

    private FunctionBasedConverter(Function<? super A, ? extends B> paramFunction, Function<? super B, ? extends A> paramFunction1)
    {
      this.forwardFunction = ((Function)Preconditions.checkNotNull(paramFunction));
      this.backwardFunction = ((Function)Preconditions.checkNotNull(paramFunction1));
    }

    protected A doBackward(B paramB)
    {
      return this.backwardFunction.apply(paramB);
    }

    protected B doForward(A paramA)
    {
      return this.forwardFunction.apply(paramA);
    }

    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool1 = paramObject instanceof FunctionBasedConverter;
      boolean bool2 = false;
      if (bool1)
      {
        FunctionBasedConverter localFunctionBasedConverter = (FunctionBasedConverter)paramObject;
        boolean bool3 = this.forwardFunction.equals(localFunctionBasedConverter.forwardFunction);
        bool2 = false;
        if (bool3)
        {
          boolean bool4 = this.backwardFunction.equals(localFunctionBasedConverter.backwardFunction);
          bool2 = false;
          if (bool4)
            bool2 = true;
        }
      }
      return bool2;
    }

    public int hashCode()
    {
      return 31 * this.forwardFunction.hashCode() + this.backwardFunction.hashCode();
    }

    public String toString()
    {
      String str1 = String.valueOf(String.valueOf(this.forwardFunction));
      String str2 = String.valueOf(String.valueOf(this.backwardFunction));
      return 18 + str1.length() + str2.length() + "Converter.from(" + str1 + ", " + str2 + ")";
    }
  }

  private static final class IdentityConverter<T> extends Converter<T, T>
    implements Serializable
  {
    static final IdentityConverter INSTANCE = new IdentityConverter();
    private static final long serialVersionUID;

    private Object readResolve()
    {
      return INSTANCE;
    }

    <S> Converter<T, S> doAndThen(Converter<T, S> paramConverter)
    {
      return (Converter)Preconditions.checkNotNull(paramConverter, "otherConverter");
    }

    protected T doBackward(T paramT)
    {
      return paramT;
    }

    protected T doForward(T paramT)
    {
      return paramT;
    }

    public IdentityConverter<T> reverse()
    {
      return this;
    }

    public String toString()
    {
      return "Converter.identity()";
    }
  }

  private static final class ReverseConverter<A, B> extends Converter<B, A>
    implements Serializable
  {
    private static final long serialVersionUID;
    final Converter<A, B> original;

    ReverseConverter(Converter<A, B> paramConverter)
    {
      this.original = paramConverter;
    }

    @Nullable
    B correctedDoBackward(@Nullable A paramA)
    {
      return this.original.correctedDoForward(paramA);
    }

    @Nullable
    A correctedDoForward(@Nullable B paramB)
    {
      return this.original.correctedDoBackward(paramB);
    }

    protected B doBackward(A paramA)
    {
      throw new AssertionError();
    }

    protected A doForward(B paramB)
    {
      throw new AssertionError();
    }

    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof ReverseConverter))
      {
        ReverseConverter localReverseConverter = (ReverseConverter)paramObject;
        return this.original.equals(localReverseConverter.original);
      }
      return false;
    }

    public int hashCode()
    {
      return 0xFFFFFFFF ^ this.original.hashCode();
    }

    public Converter<A, B> reverse()
    {
      return this.original;
    }

    public String toString()
    {
      String str = String.valueOf(String.valueOf(this.original));
      return 10 + str.length() + str + ".reverse()";
    }
  }
}