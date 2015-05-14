package com.google.common.util.concurrent;

import java.util.concurrent.Executor;
import javax.annotation.Nullable;

final class ExecutionList$RunnableExecutorPair
{
  final Executor executor;

  @Nullable
  RunnableExecutorPair next;
  final Runnable runnable;

  ExecutionList$RunnableExecutorPair(Runnable paramRunnable, Executor paramExecutor, RunnableExecutorPair paramRunnableExecutorPair)
  {
    this.runnable = paramRunnable;
    this.executor = paramExecutor;
    this.next = paramRunnableExecutorPair;
  }
}