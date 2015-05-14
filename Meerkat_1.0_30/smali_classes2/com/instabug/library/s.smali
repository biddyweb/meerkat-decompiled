.class final Lcom/instabug/library/s;
.super Landroid/os/AsyncTask;
.source "InstabugDelegate.java"


# direct methods
.method constructor <init>(Lcom/instabug/library/q;)V
    .locals 0

    .prologue
    .line 504
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private static varargs a([Ljava/io/File;)Ljava/lang/Void;
    .locals 1

    .prologue
    .line 508
    const/4 v0, 0x0

    :try_start_0
    aget-object v0, p0, v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 511
    :goto_0
    const/4 v0, 0x0

    return-object v0

    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 504
    check-cast p1, [Ljava/io/File;

    invoke-static {p1}, Lcom/instabug/library/s;->a([Ljava/io/File;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
