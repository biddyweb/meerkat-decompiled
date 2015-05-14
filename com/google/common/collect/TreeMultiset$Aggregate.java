package com.google.common.collect;

import javax.annotation.Nullable;

 enum TreeMultiset$Aggregate
{
  static
  {
    // Byte code:
    //   0: new 14\011com/google/common/collect/TreeMultiset$Aggregate$1
    //   3: dup
    //   4: ldc 15
    //   6: iconst_0
    //   7: invokespecial 19\011com/google/common/collect/TreeMultiset$Aggregate$1:<init>\011(Ljava/lang/String;I)V
    //   10: putstatic 21\011com/google/common/collect/TreeMultiset$Aggregate:SIZE\011Lcom/google/common/collect/TreeMultiset$Aggregate;
    //   13: new 23\011com/google/common/collect/TreeMultiset$Aggregate$2
    //   16: dup
    //   17: ldc 24
    //   19: iconst_1
    //   20: invokespecial 25\011com/google/common/collect/TreeMultiset$Aggregate$2:<init>\011(Ljava/lang/String;I)V
    //   23: putstatic 27\011com/google/common/collect/TreeMultiset$Aggregate:DISTINCT\011Lcom/google/common/collect/TreeMultiset$Aggregate;
    //   26: iconst_2
    //   27: anewarray 2\011com/google/common/collect/TreeMultiset$Aggregate
    //   30: astore_0
    //   31: aload_0
    //   32: iconst_0
    //   33: getstatic 21\011com/google/common/collect/TreeMultiset$Aggregate:SIZE\011Lcom/google/common/collect/TreeMultiset$Aggregate;
    //   36: aastore
    //   37: aload_0
    //   38: iconst_1
    //   39: getstatic 27\011com/google/common/collect/TreeMultiset$Aggregate:DISTINCT\011Lcom/google/common/collect/TreeMultiset$Aggregate;
    //   42: aastore
    //   43: aload_0
    //   44: putstatic 29\011com/google/common/collect/TreeMultiset$Aggregate:$VALUES\011[Lcom/google/common/collect/TreeMultiset$Aggregate;
    //   47: return
  }

  abstract int nodeAggregate(TreeMultiset.AvlNode<?> paramAvlNode);

  abstract long treeAggregate(@Nullable TreeMultiset.AvlNode<?> paramAvlNode);
}