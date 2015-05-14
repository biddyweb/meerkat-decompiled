package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;

@Beta
@GwtCompatible
public enum RemovalCause
{
  static
  {
    // Byte code:
    //   0: new 19\011com/google/common/cache/RemovalCause$1
    //   3: dup
    //   4: ldc 20
    //   6: iconst_0
    //   7: invokespecial 24\011com/google/common/cache/RemovalCause$1:<init>\011(Ljava/lang/String;I)V
    //   10: putstatic 26\011com/google/common/cache/RemovalCause:EXPLICIT\011Lcom/google/common/cache/RemovalCause;
    //   13: new 28\011com/google/common/cache/RemovalCause$2
    //   16: dup
    //   17: ldc 29
    //   19: iconst_1
    //   20: invokespecial 30\011com/google/common/cache/RemovalCause$2:<init>\011(Ljava/lang/String;I)V
    //   23: putstatic 32\011com/google/common/cache/RemovalCause:REPLACED\011Lcom/google/common/cache/RemovalCause;
    //   26: new 34\011com/google/common/cache/RemovalCause$3
    //   29: dup
    //   30: ldc 35
    //   32: iconst_2
    //   33: invokespecial 36\011com/google/common/cache/RemovalCause$3:<init>\011(Ljava/lang/String;I)V
    //   36: putstatic 38\011com/google/common/cache/RemovalCause:COLLECTED\011Lcom/google/common/cache/RemovalCause;
    //   39: new 40\011com/google/common/cache/RemovalCause$4
    //   42: dup
    //   43: ldc 41
    //   45: iconst_3
    //   46: invokespecial 42\011com/google/common/cache/RemovalCause$4:<init>\011(Ljava/lang/String;I)V
    //   49: putstatic 44\011com/google/common/cache/RemovalCause:EXPIRED\011Lcom/google/common/cache/RemovalCause;
    //   52: new 46\011com/google/common/cache/RemovalCause$5
    //   55: dup
    //   56: ldc 47
    //   58: iconst_4
    //   59: invokespecial 48\011com/google/common/cache/RemovalCause$5:<init>\011(Ljava/lang/String;I)V
    //   62: putstatic 50\011com/google/common/cache/RemovalCause:SIZE\011Lcom/google/common/cache/RemovalCause;
    //   65: iconst_5
    //   66: anewarray 2\011com/google/common/cache/RemovalCause
    //   69: astore_0
    //   70: aload_0
    //   71: iconst_0
    //   72: getstatic 26\011com/google/common/cache/RemovalCause:EXPLICIT\011Lcom/google/common/cache/RemovalCause;
    //   75: aastore
    //   76: aload_0
    //   77: iconst_1
    //   78: getstatic 32\011com/google/common/cache/RemovalCause:REPLACED\011Lcom/google/common/cache/RemovalCause;
    //   81: aastore
    //   82: aload_0
    //   83: iconst_2
    //   84: getstatic 38\011com/google/common/cache/RemovalCause:COLLECTED\011Lcom/google/common/cache/RemovalCause;
    //   87: aastore
    //   88: aload_0
    //   89: iconst_3
    //   90: getstatic 44\011com/google/common/cache/RemovalCause:EXPIRED\011Lcom/google/common/cache/RemovalCause;
    //   93: aastore
    //   94: aload_0
    //   95: iconst_4
    //   96: getstatic 50\011com/google/common/cache/RemovalCause:SIZE\011Lcom/google/common/cache/RemovalCause;
    //   99: aastore
    //   100: aload_0
    //   101: putstatic 52\011com/google/common/cache/RemovalCause:$VALUES\011[Lcom/google/common/cache/RemovalCause;
    //   104: return
  }

  abstract boolean wasEvicted();
}