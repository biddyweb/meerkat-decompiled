package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.io.OutputStream;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Iterator;
import javax.annotation.Nullable;

@Beta
public final class Funnels
{
  public static OutputStream asOutputStream(PrimitiveSink paramPrimitiveSink)
  {
    return new SinkAsStream(paramPrimitiveSink);
  }

  public static Funnel<byte[]> byteArrayFunnel()
  {
    return ByteArrayFunnel.INSTANCE;
  }

  public static Funnel<Integer> integerFunnel()
  {
    return IntegerFunnel.INSTANCE;
  }

  public static Funnel<Long> longFunnel()
  {
    return LongFunnel.INSTANCE;
  }

  public static <E> Funnel<Iterable<? extends E>> sequentialFunnel(Funnel<E> paramFunnel)
  {
    return new SequentialFunnel(paramFunnel);
  }

  public static Funnel<CharSequence> stringFunnel(Charset paramCharset)
  {
    return new StringCharsetFunnel(paramCharset);
  }

  public static Funnel<CharSequence> unencodedCharsFunnel()
  {
    return UnencodedCharsFunnel.INSTANCE;
  }

  private static enum ByteArrayFunnel
    implements Funnel<byte[]>
  {
    static
    {
      ByteArrayFunnel[] arrayOfByteArrayFunnel = new ByteArrayFunnel[1];
      arrayOfByteArrayFunnel[0] = INSTANCE;
    }

    public void funnel(byte[] paramArrayOfByte, PrimitiveSink paramPrimitiveSink)
    {
      paramPrimitiveSink.putBytes(paramArrayOfByte);
    }

    public String toString()
    {
      return "Funnels.byteArrayFunnel()";
    }
  }

  private static enum IntegerFunnel
    implements Funnel<Integer>
  {
    static
    {
      IntegerFunnel[] arrayOfIntegerFunnel = new IntegerFunnel[1];
      arrayOfIntegerFunnel[0] = INSTANCE;
    }

    public void funnel(Integer paramInteger, PrimitiveSink paramPrimitiveSink)
    {
      paramPrimitiveSink.putInt(paramInteger.intValue());
    }

    public String toString()
    {
      return "Funnels.integerFunnel()";
    }
  }

  private static enum LongFunnel
    implements Funnel<Long>
  {
    static
    {
      LongFunnel[] arrayOfLongFunnel = new LongFunnel[1];
      arrayOfLongFunnel[0] = INSTANCE;
    }

    public void funnel(Long paramLong, PrimitiveSink paramPrimitiveSink)
    {
      paramPrimitiveSink.putLong(paramLong.longValue());
    }

    public String toString()
    {
      return "Funnels.longFunnel()";
    }
  }

  private static class SequentialFunnel<E>
    implements Funnel<Iterable<? extends E>>, Serializable
  {
    private final Funnel<E> elementFunnel;

    SequentialFunnel(Funnel<E> paramFunnel)
    {
      this.elementFunnel = ((Funnel)Preconditions.checkNotNull(paramFunnel));
    }

    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof SequentialFunnel))
      {
        SequentialFunnel localSequentialFunnel = (SequentialFunnel)paramObject;
        return this.elementFunnel.equals(localSequentialFunnel.elementFunnel);
      }
      return false;
    }

    public void funnel(Iterable<? extends E> paramIterable, PrimitiveSink paramPrimitiveSink)
    {
      Iterator localIterator = paramIterable.iterator();
      while (localIterator.hasNext())
      {
        Object localObject = localIterator.next();
        this.elementFunnel.funnel(localObject, paramPrimitiveSink);
      }
    }

    public int hashCode()
    {
      return SequentialFunnel.class.hashCode() ^ this.elementFunnel.hashCode();
    }

    public String toString()
    {
      String str = String.valueOf(String.valueOf(this.elementFunnel));
      return 26 + str.length() + "Funnels.sequentialFunnel(" + str + ")";
    }
  }

  private static class SinkAsStream extends OutputStream
  {
    final PrimitiveSink sink;

    SinkAsStream(PrimitiveSink paramPrimitiveSink)
    {
      this.sink = ((PrimitiveSink)Preconditions.checkNotNull(paramPrimitiveSink));
    }

    public String toString()
    {
      String str = String.valueOf(String.valueOf(this.sink));
      return 24 + str.length() + "Funnels.asOutputStream(" + str + ")";
    }

    public void write(int paramInt)
    {
      this.sink.putByte((byte)paramInt);
    }

    public void write(byte[] paramArrayOfByte)
    {
      this.sink.putBytes(paramArrayOfByte);
    }

    public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      this.sink.putBytes(paramArrayOfByte, paramInt1, paramInt2);
    }
  }

  private static class StringCharsetFunnel
    implements Funnel<CharSequence>, Serializable
  {
    private final Charset charset;

    StringCharsetFunnel(Charset paramCharset)
    {
      this.charset = ((Charset)Preconditions.checkNotNull(paramCharset));
    }

    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof StringCharsetFunnel))
      {
        StringCharsetFunnel localStringCharsetFunnel = (StringCharsetFunnel)paramObject;
        return this.charset.equals(localStringCharsetFunnel.charset);
      }
      return false;
    }

    public void funnel(CharSequence paramCharSequence, PrimitiveSink paramPrimitiveSink)
    {
      paramPrimitiveSink.putString(paramCharSequence, this.charset);
    }

    public int hashCode()
    {
      return StringCharsetFunnel.class.hashCode() ^ this.charset.hashCode();
    }

    public String toString()
    {
      String str = String.valueOf(String.valueOf(this.charset.name()));
      return 22 + str.length() + "Funnels.stringFunnel(" + str + ")";
    }

    Object writeReplace()
    {
      return new SerializedForm(this.charset);
    }

    private static class SerializedForm
      implements Serializable
    {
      private static final long serialVersionUID;
      private final String charsetCanonicalName;

      SerializedForm(Charset paramCharset)
      {
        this.charsetCanonicalName = paramCharset.name();
      }

      private Object readResolve()
      {
        return Funnels.stringFunnel(Charset.forName(this.charsetCanonicalName));
      }
    }
  }

  private static enum UnencodedCharsFunnel
    implements Funnel<CharSequence>
  {
    static
    {
      UnencodedCharsFunnel[] arrayOfUnencodedCharsFunnel = new UnencodedCharsFunnel[1];
      arrayOfUnencodedCharsFunnel[0] = INSTANCE;
    }

    public void funnel(CharSequence paramCharSequence, PrimitiveSink paramPrimitiveSink)
    {
      paramPrimitiveSink.putUnencodedChars(paramCharSequence);
    }

    public String toString()
    {
      return "Funnels.unencodedCharsFunnel()";
    }
  }
}