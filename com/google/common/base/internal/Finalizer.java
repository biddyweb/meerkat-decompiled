package com.google.common.base.internal;

import java.lang.ref.PhantomReference;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Finalizer
  implements Runnable
{
  private static final String FINALIZABLE_REFERENCE = "com.google.common.base.FinalizableReference";
  private static final Field inheritableThreadLocals = getInheritableThreadLocalsField();
  private static final Logger logger = Logger.getLogger(Finalizer.class.getName());
  private final WeakReference<Class<?>> finalizableReferenceClassReference;
  private final PhantomReference<Object> frqReference;
  private final ReferenceQueue<Object> queue;

  private Finalizer(Class<?> paramClass, ReferenceQueue<Object> paramReferenceQueue, PhantomReference<Object> paramPhantomReference)
  {
    this.queue = paramReferenceQueue;
    this.finalizableReferenceClassReference = new WeakReference(paramClass);
    this.frqReference = paramPhantomReference;
  }

  private boolean cleanUp(Reference<?> paramReference)
  {
    Method localMethod = getFinalizeReferentMethod();
    if (localMethod == null)
      return false;
    while (true)
    {
      paramReference.clear();
      if (paramReference == this.frqReference)
        break;
      try
      {
        localMethod.invoke(paramReference, new Object[0]);
        paramReference = this.queue.poll();
        if (paramReference != null)
          continue;
        return true;
      }
      catch (Throwable localThrowable)
      {
        while (true)
          logger.log(Level.SEVERE, "Error cleaning up after reference.", localThrowable);
      }
    }
  }

  private Method getFinalizeReferentMethod()
  {
    Class localClass = (Class)this.finalizableReferenceClassReference.get();
    if (localClass == null)
      return null;
    try
    {
      Method localMethod = localClass.getMethod("finalizeReferent", new Class[0]);
      return localMethod;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new AssertionError(localNoSuchMethodException);
    }
  }

  public static Field getInheritableThreadLocalsField()
  {
    try
    {
      Field localField = Thread.class.getDeclaredField("inheritableThreadLocals");
      localField.setAccessible(true);
      return localField;
    }
    catch (Throwable localThrowable)
    {
      logger.log(Level.INFO, "Couldn't access Thread.inheritableThreadLocals. Reference finalizer threads will inherit thread local values.");
    }
    return null;
  }

  public static void startFinalizer(Class<?> paramClass, ReferenceQueue<Object> paramReferenceQueue, PhantomReference<Object> paramPhantomReference)
  {
    if (!paramClass.getName().equals("com.google.common.base.FinalizableReference"))
      throw new IllegalArgumentException("Expected com.google.common.base.FinalizableReference.");
    Thread localThread = new Thread(new Finalizer(paramClass, paramReferenceQueue, paramPhantomReference));
    localThread.setName(Finalizer.class.getName());
    localThread.setDaemon(true);
    try
    {
      if (inheritableThreadLocals != null)
        inheritableThreadLocals.set(localThread, null);
      localThread.start();
      return;
    }
    catch (Throwable localThrowable)
    {
      while (true)
        logger.log(Level.INFO, "Failed to clear thread local values inherited by reference finalizer thread.", localThrowable);
    }
  }

  public void run()
  {
    while (true)
      try
      {
        boolean bool = cleanUp(this.queue.remove());
        if (!bool)
          return;
      }
      catch (InterruptedException localInterruptedException)
      {
      }
  }
}