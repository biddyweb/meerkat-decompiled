.class public final Lcom/instabug/library/internal/storage/db/AsyncTasks/c;
.super Landroid/os/AsyncTask;
.source "DeleteScreenshotTask.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method private static varargs a([Ljava/lang/String;)Ljava/lang/Void;
    .locals 2

    .prologue
    .line 13
    const/4 v0, 0x0

    aget-object v0, p0, v0

    .line 15
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 16
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 17
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected final synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 10
    check-cast p1, [Ljava/lang/String;

    invoke-static {p1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/c;->a([Ljava/lang/String;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
