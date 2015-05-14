package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
public enum BoundType
{
  static
  {
    // Byte code:
    //   0: new 15\011com/google/common/collect/BoundType$1
    //   3: dup
    //   4: ldc 16
    //   6: iconst_0
    //   7: invokespecial 20\011com/google/common/collect/BoundType$1:<init>\011(Ljava/lang/String;I)V
    //   10: putstatic 22\011com/google/common/collect/BoundType:OPEN\011Lcom/google/common/collect/BoundType;
    //   13: new 24\011com/google/common/collect/BoundType$2
    //   16: dup
    //   17: ldc 25
    //   19: iconst_1
    //   20: invokespecial 26\011com/google/common/collect/BoundType$2:<init>\011(Ljava/lang/String;I)V
    //   23: putstatic 28\011com/google/common/collect/BoundType:CLOSED\011Lcom/google/common/collect/BoundType;
    //   26: iconst_2
    //   27: anewarray 2\011com/google/common/collect/BoundType
    //   30: astore_0
    //   31: aload_0
    //   32: iconst_0
    //   33: getstatic 22\011com/google/common/collect/BoundType:OPEN\011Lcom/google/common/collect/BoundType;
    //   36: aastore
    //   37: aload_0
    //   38: iconst_1
    //   39: getstatic 28\011com/google/common/collect/BoundType:CLOSED\011Lcom/google/common/collect/BoundType;
    //   42: aastore
    //   43: aload_0
    //   44: putstatic 30\011com/google/common/collect/BoundType:$VALUES\011[Lcom/google/common/collect/BoundType;
    //   47: return
  }

  static BoundType forBoolean(boolean paramBoolean)
  {
    if (paramBoolean)
      return CLOSED;
    return OPEN;
  }

  abstract BoundType flip();
}