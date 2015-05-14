.class public final Lcom/instabug/library/internal/storage/a;
.super Ljava/lang/Object;
.source "BitmapFileManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/internal/storage/a$a;,
        Lcom/instabug/library/internal/storage/a$b;
    }
.end annotation


# instance fields
.field private a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/instabug/library/internal/storage/a;->a:Landroid/content/Context;

    .line 17
    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 34
    new-instance v0, Lcom/instabug/library/internal/storage/db/AsyncTasks/c;

    invoke-direct {v0}, Lcom/instabug/library/internal/storage/db/AsyncTasks/c;-><init>()V

    .line 35
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/c;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 36
    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;Lcom/instabug/library/internal/storage/a$b;)V
    .locals 6

    .prologue
    .line 20
    new-instance v0, Lcom/instabug/library/internal/storage/b;

    iget-object v2, p0, Lcom/instabug/library/internal/storage/a;->a:Landroid/content/Context;

    const-string v3, ""

    move-object v1, p0

    move-object v4, p2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/instabug/library/internal/storage/b;-><init>(Lcom/instabug/library/internal/storage/a;Landroid/content/Context;Ljava/lang/String;Lcom/instabug/library/internal/storage/a$b;Landroid/graphics/Bitmap;)V

    .line 30
    const/4 v1, 0x1

    new-array v1, v1, [Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/storage/t;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 31
    return-void
.end method

.method public final a(Ljava/lang/String;Lcom/instabug/library/internal/storage/a$a;)V
    .locals 3

    .prologue
    .line 39
    new-instance v0, Lcom/instabug/library/internal/storage/c;

    invoke-direct {v0, p0, p2}, Lcom/instabug/library/internal/storage/c;-><init>(Lcom/instabug/library/internal/storage/a;Lcom/instabug/library/internal/storage/a$a;)V

    .line 46
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/instabug/library/internal/storage/db/AsyncTasks/d;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 47
    return-void
.end method
