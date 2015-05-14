package rx.observers;

import rx.Observer;
import rx.exceptions.Exceptions;

public class SerializedObserver<T>
  implements Observer<T>
{
  private static final Object COMPLETE_SENTINEL = new Object();
  private static final int MAX_DRAIN_ITERATION = 2147483647;
  private static final Object NULL_SENTINEL = new Object();
  private final Observer<? super T> actual;
  private boolean emitting = false;
  private FastList queue;
  private boolean terminated = false;

  public SerializedObserver(Observer<? super T> paramObserver)
  {
    this.actual = paramObserver;
  }

  void drainQueue(FastList paramFastList)
  {
    if ((paramFastList == null) || (paramFastList.size == 0));
    int j;
    label23: Object localObject;
    do
    {
      return;
      Object[] arrayOfObject = paramFastList.array;
      int i = arrayOfObject.length;
      j = 0;
      if (j >= i)
        break;
      localObject = arrayOfObject[j];
    }
    while (localObject == null);
    if (localObject == NULL_SENTINEL)
      this.actual.onNext(null);
    while (true)
    {
      j++;
      break label23;
      break;
      if (localObject == COMPLETE_SENTINEL)
        this.actual.onCompleted();
      else if (localObject.getClass() == ErrorSentinel.class)
        this.actual.onError(((ErrorSentinel)localObject).e);
      else
        this.actual.onNext(localObject);
    }
  }

  public void onCompleted()
  {
    try
    {
      if (this.terminated)
        return;
      this.terminated = true;
      if (this.emitting)
      {
        if (this.queue == null)
          this.queue = new FastList();
        this.queue.add(COMPLETE_SENTINEL);
        return;
      }
    }
    finally
    {
    }
    this.emitting = true;
    FastList localFastList = this.queue;
    this.queue = null;
    drainQueue(localFastList);
    this.actual.onCompleted();
  }

  public void onError(Throwable paramThrowable)
  {
    Exceptions.throwIfFatal(paramThrowable);
    try
    {
      if (this.terminated)
        return;
      if (this.emitting)
      {
        if (this.queue == null)
          this.queue = new FastList();
        this.queue.add(new ErrorSentinel(paramThrowable));
        return;
      }
    }
    finally
    {
    }
    this.emitting = true;
    FastList localFastList = this.queue;
    this.queue = null;
    drainQueue(localFastList);
    this.actual.onError(paramThrowable);
    try
    {
      this.emitting = false;
      return;
    }
    finally
    {
    }
  }

  // ERROR //
  public void onNext(T paramT)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 35\011rx/observers/SerializedObserver:terminated\011Z
    //   6: ifeq +6 -> 12
    //   9: aload_0
    //   10: monitorexit
    //   11: return
    //   12: aload_0
    //   13: getfield 33\011rx/observers/SerializedObserver:emitting\011Z
    //   16: ifeq +52 -> 68
    //   19: aload_0
    //   20: getfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   23: ifnonnull +14 -> 37
    //   26: aload_0
    //   27: new 41\011rx/observers/SerializedObserver$FastList
    //   30: dup
    //   31: invokespecial 72\011rx/observers/SerializedObserver$FastList:<init>\011()V
    //   34: putfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   37: aload_0
    //   38: getfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   41: astore 13
    //   43: aload_1
    //   44: ifnull +17 -> 61
    //   47: aload 13
    //   49: aload_1
    //   50: invokevirtual 75\011rx/observers/SerializedObserver$FastList:add\011(Ljava/lang/Object;)V
    //   53: aload_0
    //   54: monitorexit
    //   55: return
    //   56: astore_2
    //   57: aload_0
    //   58: monitorexit
    //   59: aload_2
    //   60: athrow
    //   61: getstatic 28\011rx/observers/SerializedObserver:NULL_SENTINEL\011Ljava/lang/Object;
    //   64: astore_1
    //   65: goto -18 -> 47
    //   68: aload_0
    //   69: iconst_1
    //   70: putfield 33\011rx/observers/SerializedObserver:emitting\011Z
    //   73: aload_0
    //   74: getfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   77: astore_3
    //   78: aload_0
    //   79: aconst_null
    //   80: putfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   83: aload_0
    //   84: monitorexit
    //   85: iconst_0
    //   86: istore 4
    //   88: ldc 12
    //   90: istore 5
    //   92: aload_0
    //   93: aload_3
    //   94: invokevirtual 77\011rx/observers/SerializedObserver:drainQueue\011(Lrx/observers/SerializedObserver$FastList;)V
    //   97: iconst_0
    //   98: istore 4
    //   100: iload 5
    //   102: ldc 12
    //   104: if_icmpne +13 -> 117
    //   107: aload_0
    //   108: getfield 37\011rx/observers/SerializedObserver:actual\011Lrx/Observer;
    //   111: aload_1
    //   112: invokeinterface 52 2 0
    //   117: iinc 5 255
    //   120: iconst_0
    //   121: istore 4
    //   123: iload 5
    //   125: ifle +73 -> 198
    //   128: aload_0
    //   129: monitorenter
    //   130: aload_0
    //   131: getfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   134: astore_3
    //   135: aload_0
    //   136: aconst_null
    //   137: putfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   140: aload_3
    //   141: ifnonnull +55 -> 196
    //   144: aload_0
    //   145: iconst_0
    //   146: putfield 33\011rx/observers/SerializedObserver:emitting\011Z
    //   149: iconst_1
    //   150: istore 4
    //   152: aload_0
    //   153: monitorexit
    //   154: iload 4
    //   156: ifne +148 -> 304
    //   159: aload_0
    //   160: monitorenter
    //   161: aload_0
    //   162: getfield 35\011rx/observers/SerializedObserver:terminated\011Z
    //   165: ifeq +23 -> 188
    //   168: aload_0
    //   169: getfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   172: pop
    //   173: aload_0
    //   174: aconst_null
    //   175: putfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   178: aload_0
    //   179: monitorexit
    //   180: return
    //   181: astore 10
    //   183: aload_0
    //   184: monitorexit
    //   185: aload 10
    //   187: athrow
    //   188: aload_0
    //   189: iconst_0
    //   190: putfield 33\011rx/observers/SerializedObserver:emitting\011Z
    //   193: goto -15 -> 178
    //   196: aload_0
    //   197: monitorexit
    //   198: iload 5
    //   200: ifgt -108 -> 92
    //   203: iconst_0
    //   204: ifne +24 -> 228
    //   207: aload_0
    //   208: monitorenter
    //   209: aload_0
    //   210: getfield 35\011rx/observers/SerializedObserver:terminated\011Z
    //   213: ifeq +59 -> 272
    //   216: aload_0
    //   217: getfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   220: astore_3
    //   221: aload_0
    //   222: aconst_null
    //   223: putfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   226: aload_0
    //   227: monitorexit
    //   228: aload_0
    //   229: aload_3
    //   230: invokevirtual 77\011rx/observers/SerializedObserver:drainQueue\011(Lrx/observers/SerializedObserver$FastList;)V
    //   233: return
    //   234: astore 9
    //   236: aload_0
    //   237: monitorexit
    //   238: aload 9
    //   240: athrow
    //   241: astore 6
    //   243: iload 4
    //   245: ifne +24 -> 269
    //   248: aload_0
    //   249: monitorenter
    //   250: aload_0
    //   251: getfield 35\011rx/observers/SerializedObserver:terminated\011Z
    //   254: ifeq +35 -> 289
    //   257: aload_0
    //   258: getfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   261: pop
    //   262: aload_0
    //   263: aconst_null
    //   264: putfield 71\011rx/observers/SerializedObserver:queue\011Lrx/observers/SerializedObserver$FastList;
    //   267: aload_0
    //   268: monitorexit
    //   269: aload 6
    //   271: athrow
    //   272: aload_0
    //   273: iconst_0
    //   274: putfield 33\011rx/observers/SerializedObserver:emitting\011Z
    //   277: aconst_null
    //   278: astore_3
    //   279: goto -53 -> 226
    //   282: astore 12
    //   284: aload_0
    //   285: monitorexit
    //   286: aload 12
    //   288: athrow
    //   289: aload_0
    //   290: iconst_0
    //   291: putfield 33\011rx/observers/SerializedObserver:emitting\011Z
    //   294: goto -27 -> 267
    //   297: astore 7
    //   299: aload_0
    //   300: monitorexit
    //   301: aload 7
    //   303: athrow
    //   304: return
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01111\01156\011finally
    //   12\01137\01156\011finally
    //   37\01143\01156\011finally
    //   47\01155\01156\011finally
    //   57\01159\01156\011finally
    //   61\01165\01156\011finally
    //   68\01185\01156\011finally
    //   161\011178\011181\011finally
    //   178\011180\011181\011finally
    //   183\011185\011181\011finally
    //   188\011193\011181\011finally
    //   130\011140\011234\011finally
    //   144\011149\011234\011finally
    //   152\011154\011234\011finally
    //   196\011198\011234\011finally
    //   236\011238\011234\011finally
    //   92\01197\011241\011finally
    //   107\011117\011241\011finally
    //   128\011130\011241\011finally
    //   238\011241\011241\011finally
    //   209\011226\011282\011finally
    //   226\011228\011282\011finally
    //   272\011277\011282\011finally
    //   284\011286\011282\011finally
    //   250\011267\011297\011finally
    //   267\011269\011297\011finally
    //   289\011294\011297\011finally
    //   299\011301\011297\011finally
  }

  private static final class ErrorSentinel
  {
    final Throwable e;

    ErrorSentinel(Throwable paramThrowable)
    {
      this.e = paramThrowable;
    }
  }

  static final class FastList
  {
    Object[] array;
    int size;

    public void add(Object paramObject)
    {
      int i = this.size;
      Object localObject = this.array;
      if (localObject == null)
      {
        localObject = new Object[16];
        this.array = ((Object[])localObject);
      }
      while (true)
      {
        localObject[i] = paramObject;
        this.size = (i + 1);
        return;
        if (i == localObject.length)
        {
          Object[] arrayOfObject = new Object[i + (i >> 2)];
          System.arraycopy(localObject, 0, arrayOfObject, 0, i);
          localObject = arrayOfObject;
          this.array = ((Object[])localObject);
        }
      }
    }
  }
}