.class public Lco/getair/meerkat/utilities/MLog;
.super Ljava/lang/Object;
.source "MLog.java"


# static fields
.field private static LOGGER_STACKTRACE_INDEX:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 149
    const/4 v0, 0x1

    sput v0, Lco/getair/meerkat/utilities/MLog;->LOGGER_STACKTRACE_INDEX:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 5
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "( %s:%d ) %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 71
    const-string v0, "( %s:%d ) %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 5
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "( %s:%d ) %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 142
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    const-string v0, "( %s:%d ) %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    :cond_0
    return-void
.end method

.method public static getClassName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 194
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getFirsPackageRowInStackTrace()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCurrentFilename()Ljava/lang/String;
    .locals 2

    .prologue
    .line 201
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getFirsPackageRowInStackTrace()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getFirsPackageRowInStackTrace()I
    .locals 14

    .prologue
    const/4 v13, 0x1

    const/4 v9, 0x0

    .line 153
    const-class v10, Lco/getair/meerkat/utilities/MLog;

    invoke-virtual {v10}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    .line 154
    .local v0, "aPackage":Ljava/lang/Package;
    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "\\."

    invoke-virtual {v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 155
    .local v5, "packageComponents":[Ljava/lang/String;
    const-string v10, "%s.%s"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    aget-object v12, v5, v9

    aput-object v12, v11, v9

    aget-object v12, v5, v13

    aput-object v12, v11, v13

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 157
    .local v6, "rootPackageName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v8

    .line 158
    .local v8, "stack":[Ljava/lang/StackTraceElement;
    const/4 v7, 0x0

    .line 159
    .local v7, "row":I
    array-length v10, v8

    :goto_0
    if-ge v9, v10, :cond_0

    aget-object v2, v8, v9

    .line 163
    .local v2, "element":Ljava/lang/StackTraceElement;
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    const-string v12, "declaringClass"

    invoke-virtual {v11, v12}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 164
    .local v4, "field":Ljava/lang/reflect/Field;
    const/4 v11, 0x1

    invoke-virtual {v4, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 165
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 167
    .local v1, "declaringClass":Ljava/lang/String;
    invoke-virtual {v1, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v11

    const-class v12, Lco/getair/meerkat/utilities/MLog;

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v11

    if-nez v11, :cond_1

    .line 180
    .end local v1    # "declaringClass":Ljava/lang/String;
    .end local v2    # "element":Ljava/lang/StackTraceElement;
    .end local v4    # "field":Ljava/lang/reflect/Field;
    :cond_0
    :goto_1
    return v7

    .line 172
    .restart local v2    # "element":Ljava/lang/StackTraceElement;
    :catch_0
    move-exception v3

    .line 174
    .local v3, "ex":Ljava/lang/Exception;
    goto :goto_1

    .line 177
    .end local v3    # "ex":Ljava/lang/Exception;
    .restart local v1    # "declaringClass":Ljava/lang/String;
    .restart local v4    # "field":Ljava/lang/reflect/Field;
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 159
    add-int/lit8 v9, v9, 0x1

    goto :goto_0
.end method

.method public static getLineNumber()I
    .locals 2

    .prologue
    .line 208
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getFirsPackageRowInStackTrace()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v0

    return v0
.end method

.method public static getMethodName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 187
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getFirsPackageRowInStackTrace()I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static i(Ljava/lang/String;)V
    .locals 5
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "( %s:%d ) %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 94
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 95
    const-string v0, "( %s:%d ) %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    :cond_0
    return-void
.end method

.method public static isDebug()Z
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    return v0
.end method

.method public static v(Ljava/lang/String;)V
    .locals 5
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 34
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "( %s:%d ) %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    const-string v0, "( %s:%d ) %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .locals 5
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getClassName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "( %s:%d ) %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 118
    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->isDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    const-string v0, "( %s:%d ) %s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getCurrentFilename()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {}, Lco/getair/meerkat/utilities/MLog;->getLineNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :cond_0
    return-void
.end method
