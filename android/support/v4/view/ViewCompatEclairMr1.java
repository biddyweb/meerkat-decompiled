package android.support.v4.view;

import android.view.View;
import java.lang.reflect.Method;

class ViewCompatEclairMr1
{
  public static final String TAG = "ViewCompat";
  private static Method sChildrenDrawingOrderMethod;

  public static boolean isOpaque(View paramView)
  {
    return paramView.isOpaque();
  }

  // ERROR //
  public static void setChildrenDrawingOrderEnabled(android.view.ViewGroup paramViewGroup, boolean paramBoolean)
  {
    // Byte code:
    //   0: getstatic 33\011android/support/v4/view/ViewCompatEclairMr1:sChildrenDrawingOrderMethod\011Ljava/lang/reflect/Method;
    //   3: ifnonnull +35 -> 38
    //   6: iconst_1
    //   7: anewarray 35\011java/lang/Class
    //   10: astore 13
    //   12: aload 13
    //   14: iconst_0
    //   15: getstatic 41\011java/lang/Boolean:TYPE\011Ljava/lang/Class;
    //   18: aastore
    //   19: ldc 43
    //   21: ldc 44
    //   23: aload 13
    //   25: invokevirtual 48\011java/lang/Class:getDeclaredMethod\011(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    //   28: putstatic 33\011android/support/v4/view/ViewCompatEclairMr1:sChildrenDrawingOrderMethod\011Ljava/lang/reflect/Method;
    //   31: getstatic 33\011android/support/v4/view/ViewCompatEclairMr1:sChildrenDrawingOrderMethod\011Ljava/lang/reflect/Method;
    //   34: iconst_1
    //   35: invokevirtual 54\011java/lang/reflect/Method:setAccessible\011(Z)V
    //   38: getstatic 33\011android/support/v4/view/ViewCompatEclairMr1:sChildrenDrawingOrderMethod\011Ljava/lang/reflect/Method;
    //   41: astore 8
    //   43: iconst_1
    //   44: anewarray 4\011java/lang/Object
    //   47: astore 9
    //   49: aload 9
    //   51: iconst_0
    //   52: iload_1
    //   53: invokestatic 58\011java/lang/Boolean:valueOf\011(Z)Ljava/lang/Boolean;
    //   56: aastore
    //   57: aload 8
    //   59: aload_0
    //   60: aload 9
    //   62: invokevirtual 62\011java/lang/reflect/Method:invoke\011(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    //   65: pop
    //   66: return
    //   67: astore 11
    //   69: ldc 8
    //   71: ldc 64
    //   73: aload 11
    //   75: invokestatic 70\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   78: pop
    //   79: goto -48 -> 31
    //   82: astore 6
    //   84: ldc 8
    //   86: ldc 72
    //   88: aload 6
    //   90: invokestatic 70\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   93: pop
    //   94: return
    //   95: astore 4
    //   97: ldc 8
    //   99: ldc 72
    //   101: aload 4
    //   103: invokestatic 70\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   106: pop
    //   107: return
    //   108: astore_2
    //   109: ldc 8
    //   111: ldc 72
    //   113: aload_2
    //   114: invokestatic 70\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   117: pop
    //   118: return
    //
    // Exception table:
    //   from\011to\011target\011type
    //   6\01131\01167\011java/lang/NoSuchMethodException
    //   38\01166\01182\011java/lang/IllegalAccessException
    //   38\01166\01195\011java/lang/IllegalArgumentException
    //   38\01166\011108\011java/lang/reflect/InvocationTargetException
  }
}