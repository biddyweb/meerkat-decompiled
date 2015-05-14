package rx.functions;

public final class Functions
{
  private Functions()
  {
    throw new IllegalStateException("No instances!");
  }

  public static FuncN<Void> fromAction(Action0 paramAction0)
  {
    return new FuncN()
    {
      public Void call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 0)
          throw new RuntimeException("Action0 expecting 0 arguments.");
        this.val$f.call();
        return null;
      }
    };
  }

  public static <T0> FuncN<Void> fromAction(Action1<? super T0> paramAction1)
  {
    return new FuncN()
    {
      public Void call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 1)
          throw new RuntimeException("Action1 expecting 1 argument.");
        this.val$f.call(paramAnonymousArrayOfObject[0]);
        return null;
      }
    };
  }

  public static <T0, T1> FuncN<Void> fromAction(Action2<? super T0, ? super T1> paramAction2)
  {
    return new FuncN()
    {
      public Void call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 2)
          throw new RuntimeException("Action3 expecting 2 arguments.");
        this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1]);
        return null;
      }
    };
  }

  public static <T0, T1, T2> FuncN<Void> fromAction(Action3<? super T0, ? super T1, ? super T2> paramAction3)
  {
    return new FuncN()
    {
      public Void call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 3)
          throw new RuntimeException("Action3 expecting 3 arguments.");
        this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1], paramAnonymousArrayOfObject[2]);
        return null;
      }
    };
  }

  public static <R> FuncN<R> fromFunc(Func0<? extends R> paramFunc0)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 0)
          throw new RuntimeException("Func0 expecting 0 arguments.");
        return this.val$f.call();
      }
    };
  }

  public static <T0, R> FuncN<R> fromFunc(Func1<? super T0, ? extends R> paramFunc1)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 1)
          throw new RuntimeException("Func1 expecting 1 argument.");
        return this.val$f.call(paramAnonymousArrayOfObject[0]);
      }
    };
  }

  public static <T0, T1, R> FuncN<R> fromFunc(Func2<? super T0, ? super T1, ? extends R> paramFunc2)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 2)
          throw new RuntimeException("Func2 expecting 2 arguments.");
        return this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1]);
      }
    };
  }

  public static <T0, T1, T2, R> FuncN<R> fromFunc(Func3<? super T0, ? super T1, ? super T2, ? extends R> paramFunc3)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 3)
          throw new RuntimeException("Func3 expecting 3 arguments.");
        return this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1], paramAnonymousArrayOfObject[2]);
      }
    };
  }

  public static <T0, T1, T2, T3, R> FuncN<R> fromFunc(Func4<? super T0, ? super T1, ? super T2, ? super T3, ? extends R> paramFunc4)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 4)
          throw new RuntimeException("Func4 expecting 4 arguments.");
        return this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1], paramAnonymousArrayOfObject[2], paramAnonymousArrayOfObject[3]);
      }
    };
  }

  public static <T0, T1, T2, T3, T4, R> FuncN<R> fromFunc(Func5<? super T0, ? super T1, ? super T2, ? super T3, ? super T4, ? extends R> paramFunc5)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 5)
          throw new RuntimeException("Func5 expecting 5 arguments.");
        return this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1], paramAnonymousArrayOfObject[2], paramAnonymousArrayOfObject[3], paramAnonymousArrayOfObject[4]);
      }
    };
  }

  public static <T0, T1, T2, T3, T4, T5, R> FuncN<R> fromFunc(Func6<? super T0, ? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? extends R> paramFunc6)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 6)
          throw new RuntimeException("Func6 expecting 6 arguments.");
        return this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1], paramAnonymousArrayOfObject[2], paramAnonymousArrayOfObject[3], paramAnonymousArrayOfObject[4], paramAnonymousArrayOfObject[5]);
      }
    };
  }

  public static <T0, T1, T2, T3, T4, T5, T6, R> FuncN<R> fromFunc(Func7<? super T0, ? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? extends R> paramFunc7)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 7)
          throw new RuntimeException("Func7 expecting 7 arguments.");
        return this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1], paramAnonymousArrayOfObject[2], paramAnonymousArrayOfObject[3], paramAnonymousArrayOfObject[4], paramAnonymousArrayOfObject[5], paramAnonymousArrayOfObject[6]);
      }
    };
  }

  public static <T0, T1, T2, T3, T4, T5, T6, T7, R> FuncN<R> fromFunc(Func8<? super T0, ? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? super T7, ? extends R> paramFunc8)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 8)
          throw new RuntimeException("Func8 expecting 8 arguments.");
        return this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1], paramAnonymousArrayOfObject[2], paramAnonymousArrayOfObject[3], paramAnonymousArrayOfObject[4], paramAnonymousArrayOfObject[5], paramAnonymousArrayOfObject[6], paramAnonymousArrayOfObject[7]);
      }
    };
  }

  public static <T0, T1, T2, T3, T4, T5, T6, T7, T8, R> FuncN<R> fromFunc(Func9<? super T0, ? super T1, ? super T2, ? super T3, ? super T4, ? super T5, ? super T6, ? super T7, ? super T8, ? extends R> paramFunc9)
  {
    return new FuncN()
    {
      public R call(Object[] paramAnonymousArrayOfObject)
      {
        if (paramAnonymousArrayOfObject.length != 9)
          throw new RuntimeException("Func9 expecting 9 arguments.");
        return this.val$f.call(paramAnonymousArrayOfObject[0], paramAnonymousArrayOfObject[1], paramAnonymousArrayOfObject[2], paramAnonymousArrayOfObject[3], paramAnonymousArrayOfObject[4], paramAnonymousArrayOfObject[5], paramAnonymousArrayOfObject[6], paramAnonymousArrayOfObject[7], paramAnonymousArrayOfObject[8]);
      }
    };
  }
}