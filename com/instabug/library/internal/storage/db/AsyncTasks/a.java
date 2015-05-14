package com.instabug.library.internal.storage.db.AsyncTasks;

import android.os.AsyncTask;
import com.instabug.library.internal.storage.d;
import com.instabug.library.internal.storage.e.a;

public final class a extends AsyncTask
{
  private d a;
  private e.a b;

  public a(d paramd, e.a parama)
  {
    this.a = paramd;
    this.b = parama;
  }

  // ERROR //
  private com.instabug.library.model.a a(com.instabug.library.model.a[] paramArrayOfa)
  {
    // Byte code:
    //   0: aload_1
    //   1: iconst_0
    //   2: aaload
    //   3: ifnull +28 -> 31
    //   6: ldc 22
    //   8: invokestatic 27\011com/instabug/library/Instabug$a:a\011(Ljava/lang/String;)V
    //   11: aload_0
    //   12: getfield 15\011com/instabug/library/internal/storage/db/AsyncTasks/a:a\011Lcom/instabug/library/internal/storage/d;
    //   15: aload_1
    //   16: iconst_0
    //   17: aaload
    //   18: invokevirtual 32\011com/instabug/library/internal/storage/d:a\011(Lcom/instabug/library/model/a;)V
    //   21: ldc 34
    //   23: invokestatic 27\011com/instabug/library/Instabug$a:a\011(Ljava/lang/String;)V
    //   26: aload_0
    //   27: aconst_null
    //   28: putfield 15\011com/instabug/library/internal/storage/db/AsyncTasks/a:a\011Lcom/instabug/library/internal/storage/d;
    //   31: aload_1
    //   32: iconst_0
    //   33: aaload
    //   34: areturn
    //   35: astore_3
    //   36: aload_0
    //   37: aconst_null
    //   38: putfield 15\011com/instabug/library/internal/storage/db/AsyncTasks/a:a\011Lcom/instabug/library/internal/storage/d;
    //   41: aconst_null
    //   42: areturn
    //   43: astore_2
    //   44: aload_0
    //   45: aconst_null
    //   46: putfield 15\011com/instabug/library/internal/storage/db/AsyncTasks/a:a\011Lcom/instabug/library/internal/storage/d;
    //   49: aload_2
    //   50: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   6\01126\01135\011java/lang/Exception
    //   6\01126\01143\011finally
  }
}