package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.MoreObjects;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Lists;
import com.google.common.collect.MapMaker;
import com.google.common.collect.Maps;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.ReadLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.concurrent.ThreadSafe;

@Beta
@ThreadSafe
public class CycleDetectingLockFactory
{
  private static final ThreadLocal<ArrayList<CycleDetectingLockFactory.LockGraphNode>> acquiredLocks = new ThreadLocal()
  {
    protected ArrayList<CycleDetectingLockFactory.LockGraphNode> initialValue()
    {
      return Lists.newArrayListWithCapacity(3);
    }
  };
  private static final ConcurrentMap<Class<? extends Enum>, Map<? extends Enum, CycleDetectingLockFactory.LockGraphNode>> lockGraphNodesPerType = new MapMaker().weakKeys().makeMap();
  private static final Logger logger = Logger.getLogger(CycleDetectingLockFactory.class.getName());
  final Policy policy;

  private CycleDetectingLockFactory(Policy paramPolicy)
  {
    this.policy = ((Policy)Preconditions.checkNotNull(paramPolicy));
  }

  private void aboutToAcquire(CycleDetectingLock paramCycleDetectingLock)
  {
    if (!paramCycleDetectingLock.isAcquiredByCurrentThread())
    {
      ArrayList localArrayList = (ArrayList)acquiredLocks.get();
      CycleDetectingLockFactory.LockGraphNode localLockGraphNode = paramCycleDetectingLock.getLockGraphNode();
      localLockGraphNode.checkAcquiredLocks(this.policy, localArrayList);
      localArrayList.add(localLockGraphNode);
    }
  }

  @VisibleForTesting
  static <E extends Enum<E>> Map<E, CycleDetectingLockFactory.LockGraphNode> createNodes(Class<E> paramClass)
  {
    EnumMap localEnumMap = Maps.newEnumMap(paramClass);
    Enum[] arrayOfEnum = (Enum[])paramClass.getEnumConstants();
    int i = arrayOfEnum.length;
    ArrayList localArrayList = Lists.newArrayListWithCapacity(i);
    int j = arrayOfEnum.length;
    for (int k = 0; k < j; k++)
    {
      Enum localEnum = arrayOfEnum[k];
      CycleDetectingLockFactory.LockGraphNode localLockGraphNode = new CycleDetectingLockFactory.LockGraphNode(getLockName(localEnum));
      localArrayList.add(localLockGraphNode);
      localEnumMap.put(localEnum, localLockGraphNode);
    }
    for (int m = 1; m < i; m++)
      ((CycleDetectingLockFactory.LockGraphNode)localArrayList.get(m)).checkAcquiredLocks(Policies.THROW, localArrayList.subList(0, m));
    for (int n = 0; n < i - 1; n++)
      ((CycleDetectingLockFactory.LockGraphNode)localArrayList.get(n)).checkAcquiredLocks(Policies.DISABLED, localArrayList.subList(n + 1, i));
    return Collections.unmodifiableMap(localEnumMap);
  }

  private static String getLockName(Enum<?> paramEnum)
  {
    String str1 = String.valueOf(String.valueOf(paramEnum.getDeclaringClass().getSimpleName()));
    String str2 = String.valueOf(String.valueOf(paramEnum.name()));
    return 1 + str1.length() + str2.length() + str1 + "." + str2;
  }

  private static Map<? extends Enum, CycleDetectingLockFactory.LockGraphNode> getOrCreateNodes(Class<? extends Enum> paramClass)
  {
    Map localMap1 = (Map)lockGraphNodesPerType.get(paramClass);
    if (localMap1 != null)
      return localMap1;
    Map localMap2 = createNodes(paramClass);
    return (Map)MoreObjects.firstNonNull((Map)lockGraphNodesPerType.putIfAbsent(paramClass, localMap2), localMap2);
  }

  private void lockStateChanged(CycleDetectingLock paramCycleDetectingLock)
  {
    ArrayList localArrayList;
    CycleDetectingLockFactory.LockGraphNode localLockGraphNode;
    if (!paramCycleDetectingLock.isAcquiredByCurrentThread())
    {
      localArrayList = (ArrayList)acquiredLocks.get();
      localLockGraphNode = paramCycleDetectingLock.getLockGraphNode();
    }
    for (int i = -1 + localArrayList.size(); ; i--)
      if (i >= 0)
      {
        if (localArrayList.get(i) == localLockGraphNode)
          localArrayList.remove(i);
      }
      else
        return;
  }

  public static CycleDetectingLockFactory newInstance(Policy paramPolicy)
  {
    return new CycleDetectingLockFactory(paramPolicy);
  }

  public static <E extends Enum<E>> WithExplicitOrdering<E> newInstanceWithExplicitOrdering(Class<E> paramClass, Policy paramPolicy)
  {
    Preconditions.checkNotNull(paramClass);
    Preconditions.checkNotNull(paramPolicy);
    return new WithExplicitOrdering(paramPolicy, getOrCreateNodes(paramClass));
  }

  public ReentrantLock newReentrantLock(String paramString)
  {
    return newReentrantLock(paramString, false);
  }

  public ReentrantLock newReentrantLock(String paramString, boolean paramBoolean)
  {
    if (this.policy == Policies.DISABLED)
      return new ReentrantLock(paramBoolean);
    return new CycleDetectingReentrantLock(new CycleDetectingLockFactory.LockGraphNode(paramString), paramBoolean, null);
  }

  public ReentrantReadWriteLock newReentrantReadWriteLock(String paramString)
  {
    return newReentrantReadWriteLock(paramString, false);
  }

  public ReentrantReadWriteLock newReentrantReadWriteLock(String paramString, boolean paramBoolean)
  {
    if (this.policy == Policies.DISABLED)
      return new ReentrantReadWriteLock(paramBoolean);
    return new CycleDetectingReentrantReadWriteLock(new CycleDetectingLockFactory.LockGraphNode(paramString), paramBoolean, null);
  }

  private static abstract interface CycleDetectingLock
  {
    public abstract CycleDetectingLockFactory.LockGraphNode getLockGraphNode();

    public abstract boolean isAcquiredByCurrentThread();
  }

  final class CycleDetectingReentrantLock extends ReentrantLock
    implements CycleDetectingLockFactory.CycleDetectingLock
  {
    private final CycleDetectingLockFactory.LockGraphNode lockGraphNode;

    private CycleDetectingReentrantLock(CycleDetectingLockFactory.LockGraphNode paramBoolean, boolean arg3)
    {
      super();
      this.lockGraphNode = ((CycleDetectingLockFactory.LockGraphNode)Preconditions.checkNotNull(paramBoolean));
    }

    public CycleDetectingLockFactory.LockGraphNode getLockGraphNode()
    {
      return this.lockGraphNode;
    }

    public boolean isAcquiredByCurrentThread()
    {
      return isHeldByCurrentThread();
    }

    public void lock()
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this);
      try
      {
        super.lock();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this);
      }
    }

    public void lockInterruptibly()
      throws InterruptedException
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this);
      try
      {
        super.lockInterruptibly();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this);
      }
    }

    public boolean tryLock()
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this);
      try
      {
        boolean bool = super.tryLock();
        return bool;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this);
      }
    }

    public boolean tryLock(long paramLong, TimeUnit paramTimeUnit)
      throws InterruptedException
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this);
      try
      {
        boolean bool = super.tryLock(paramLong, paramTimeUnit);
        return bool;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this);
      }
    }

    public void unlock()
    {
      try
      {
        super.unlock();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this);
      }
    }
  }

  private class CycleDetectingReentrantReadLock extends ReentrantReadWriteLock.ReadLock
  {
    final CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock readWriteLock;

    CycleDetectingReentrantReadLock(CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock arg2)
    {
      super();
      this.readWriteLock = localReentrantReadWriteLock;
    }

    public void lock()
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this.readWriteLock);
      try
      {
        super.lock();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }

    public void lockInterruptibly()
      throws InterruptedException
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this.readWriteLock);
      try
      {
        super.lockInterruptibly();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }

    public boolean tryLock()
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this.readWriteLock);
      try
      {
        boolean bool = super.tryLock();
        return bool;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }

    public boolean tryLock(long paramLong, TimeUnit paramTimeUnit)
      throws InterruptedException
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this.readWriteLock);
      try
      {
        boolean bool = super.tryLock(paramLong, paramTimeUnit);
        return bool;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }

    public void unlock()
    {
      try
      {
        super.unlock();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }
  }

  final class CycleDetectingReentrantReadWriteLock extends ReentrantReadWriteLock
    implements CycleDetectingLockFactory.CycleDetectingLock
  {
    private final CycleDetectingLockFactory.LockGraphNode lockGraphNode;
    private final CycleDetectingLockFactory.CycleDetectingReentrantReadLock readLock = new CycleDetectingLockFactory.CycleDetectingReentrantReadLock(CycleDetectingLockFactory.this, this);
    private final CycleDetectingLockFactory.CycleDetectingReentrantWriteLock writeLock = new CycleDetectingLockFactory.CycleDetectingReentrantWriteLock(CycleDetectingLockFactory.this, this);

    private CycleDetectingReentrantReadWriteLock(CycleDetectingLockFactory.LockGraphNode paramBoolean, boolean arg3)
    {
      super();
      this.lockGraphNode = ((CycleDetectingLockFactory.LockGraphNode)Preconditions.checkNotNull(paramBoolean));
    }

    public CycleDetectingLockFactory.LockGraphNode getLockGraphNode()
    {
      return this.lockGraphNode;
    }

    public boolean isAcquiredByCurrentThread()
    {
      return (isWriteLockedByCurrentThread()) || (getReadHoldCount() > 0);
    }

    public ReentrantReadWriteLock.ReadLock readLock()
    {
      return this.readLock;
    }

    public ReentrantReadWriteLock.WriteLock writeLock()
    {
      return this.writeLock;
    }
  }

  private class CycleDetectingReentrantWriteLock extends ReentrantReadWriteLock.WriteLock
  {
    final CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock readWriteLock;

    CycleDetectingReentrantWriteLock(CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock arg2)
    {
      super();
      this.readWriteLock = localReentrantReadWriteLock;
    }

    public void lock()
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this.readWriteLock);
      try
      {
        super.lock();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }

    public void lockInterruptibly()
      throws InterruptedException
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this.readWriteLock);
      try
      {
        super.lockInterruptibly();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }

    public boolean tryLock()
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this.readWriteLock);
      try
      {
        boolean bool = super.tryLock();
        return bool;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }

    public boolean tryLock(long paramLong, TimeUnit paramTimeUnit)
      throws InterruptedException
    {
      CycleDetectingLockFactory.this.aboutToAcquire(this.readWriteLock);
      try
      {
        boolean bool = super.tryLock(paramLong, paramTimeUnit);
        return bool;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }

    public void unlock()
    {
      try
      {
        super.unlock();
        return;
      }
      finally
      {
        CycleDetectingLockFactory.this.lockStateChanged(this.readWriteLock);
      }
    }
  }

  private static class ExampleStackTrace extends IllegalStateException
  {
    static final StackTraceElement[] EMPTY_STACK_TRACE = new StackTraceElement[0];
    static Set<String> EXCLUDED_CLASS_NAMES = ImmutableSet.of(CycleDetectingLockFactory.class.getName(), ExampleStackTrace.class.getName(), CycleDetectingLockFactory.LockGraphNode.class.getName());

    ExampleStackTrace(CycleDetectingLockFactory.LockGraphNode paramLockGraphNode1, CycleDetectingLockFactory.LockGraphNode paramLockGraphNode2)
    {
      super();
      StackTraceElement[] arrayOfStackTraceElement = getStackTrace();
      int i = 0;
      int j = arrayOfStackTraceElement.length;
      while (true)
      {
        if (i < j)
        {
          if (CycleDetectingLockFactory.WithExplicitOrdering.class.getName().equals(arrayOfStackTraceElement[i].getClassName()))
            setStackTrace(EMPTY_STACK_TRACE);
        }
        else
          return;
        if (!EXCLUDED_CLASS_NAMES.contains(arrayOfStackTraceElement[i].getClassName()))
        {
          setStackTrace((StackTraceElement[])Arrays.copyOfRange(arrayOfStackTraceElement, i, j));
          return;
        }
        i++;
      }
    }
  }

  @Beta
  public static abstract enum Policies
    implements CycleDetectingLockFactory.Policy
  {
    static
    {
      // Byte code:
      //   0: new 18\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies$1
      //   3: dup
      //   4: ldc 19
      //   6: iconst_0
      //   7: invokespecial 23\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies$1:<init>\011(Ljava/lang/String;I)V
      //   10: putstatic 25\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies:THROW\011Lcom/google/common/util/concurrent/CycleDetectingLockFactory$Policies;
      //   13: new 27\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies$2
      //   16: dup
      //   17: ldc 28
      //   19: iconst_1
      //   20: invokespecial 29\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies$2:<init>\011(Ljava/lang/String;I)V
      //   23: putstatic 31\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies:WARN\011Lcom/google/common/util/concurrent/CycleDetectingLockFactory$Policies;
      //   26: new 33\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies$3
      //   29: dup
      //   30: ldc 34
      //   32: iconst_2
      //   33: invokespecial 35\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies$3:<init>\011(Ljava/lang/String;I)V
      //   36: putstatic 37\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies:DISABLED\011Lcom/google/common/util/concurrent/CycleDetectingLockFactory$Policies;
      //   39: iconst_3
      //   40: anewarray 2\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies
      //   43: astore_0
      //   44: aload_0
      //   45: iconst_0
      //   46: getstatic 25\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies:THROW\011Lcom/google/common/util/concurrent/CycleDetectingLockFactory$Policies;
      //   49: aastore
      //   50: aload_0
      //   51: iconst_1
      //   52: getstatic 31\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies:WARN\011Lcom/google/common/util/concurrent/CycleDetectingLockFactory$Policies;
      //   55: aastore
      //   56: aload_0
      //   57: iconst_2
      //   58: getstatic 37\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies:DISABLED\011Lcom/google/common/util/concurrent/CycleDetectingLockFactory$Policies;
      //   61: aastore
      //   62: aload_0
      //   63: putstatic 39\011com/google/common/util/concurrent/CycleDetectingLockFactory$Policies:$VALUES\011[Lcom/google/common/util/concurrent/CycleDetectingLockFactory$Policies;
      //   66: return
    }
  }

  @Beta
  @ThreadSafe
  public static abstract interface Policy
  {
    public abstract void handlePotentialDeadlock(CycleDetectingLockFactory.PotentialDeadlockException paramPotentialDeadlockException);
  }

  @Beta
  public static final class PotentialDeadlockException extends CycleDetectingLockFactory.ExampleStackTrace
  {
    private final CycleDetectingLockFactory.ExampleStackTrace conflictingStackTrace;

    private PotentialDeadlockException(CycleDetectingLockFactory.LockGraphNode paramLockGraphNode1, CycleDetectingLockFactory.LockGraphNode paramLockGraphNode2, CycleDetectingLockFactory.ExampleStackTrace paramExampleStackTrace)
    {
      super(paramLockGraphNode2);
      this.conflictingStackTrace = paramExampleStackTrace;
      initCause(paramExampleStackTrace);
    }

    public CycleDetectingLockFactory.ExampleStackTrace getConflictingStackTrace()
    {
      return this.conflictingStackTrace;
    }

    public String getMessage()
    {
      StringBuilder localStringBuilder = new StringBuilder(super.getMessage());
      for (Object localObject = this.conflictingStackTrace; localObject != null; localObject = ((Throwable)localObject).getCause())
        localStringBuilder.append(", ").append(((Throwable)localObject).getMessage());
      return localStringBuilder.toString();
    }
  }

  @Beta
  public static final class WithExplicitOrdering<E extends Enum<E>> extends CycleDetectingLockFactory
  {
    private final Map<E, CycleDetectingLockFactory.LockGraphNode> lockGraphNodes;

    @VisibleForTesting
    WithExplicitOrdering(CycleDetectingLockFactory.Policy paramPolicy, Map<E, CycleDetectingLockFactory.LockGraphNode> paramMap)
    {
      super(null);
      this.lockGraphNodes = paramMap;
    }

    public ReentrantLock newReentrantLock(E paramE)
    {
      return newReentrantLock(paramE, false);
    }

    public ReentrantLock newReentrantLock(E paramE, boolean paramBoolean)
    {
      if (this.policy == CycleDetectingLockFactory.Policies.DISABLED)
        return new ReentrantLock(paramBoolean);
      return new CycleDetectingLockFactory.CycleDetectingReentrantLock(this, (CycleDetectingLockFactory.LockGraphNode)this.lockGraphNodes.get(paramE), paramBoolean, null);
    }

    public ReentrantReadWriteLock newReentrantReadWriteLock(E paramE)
    {
      return newReentrantReadWriteLock(paramE, false);
    }

    public ReentrantReadWriteLock newReentrantReadWriteLock(E paramE, boolean paramBoolean)
    {
      if (this.policy == CycleDetectingLockFactory.Policies.DISABLED)
        return new ReentrantReadWriteLock(paramBoolean);
      return new CycleDetectingLockFactory.CycleDetectingReentrantReadWriteLock(this, (CycleDetectingLockFactory.LockGraphNode)this.lockGraphNodes.get(paramE), paramBoolean, null);
    }
  }
}