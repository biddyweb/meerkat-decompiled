.class public final Lcom/instabug/library/util/j;
.super Ljava/lang/Object;
.source "ScreenshotProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/util/j$a;
    }
.end annotation


# instance fields
.field private a:Lcom/instabug/library/internal/storage/a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/a;)V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/instabug/library/util/j;->a:Lcom/instabug/library/internal/storage/a;

    .line 15
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/util/j;Landroid/graphics/Bitmap;Lcom/instabug/library/util/j$a;)V
    .locals 2

    .prologue
    .line 9
    iget-object v0, p0, Lcom/instabug/library/util/j;->a:Lcom/instabug/library/internal/storage/a;

    new-instance v1, Lcom/instabug/library/util/l;

    invoke-direct {v1, p0, p2}, Lcom/instabug/library/util/l;-><init>(Lcom/instabug/library/util/j;Lcom/instabug/library/util/j$a;)V

    invoke-virtual {v0, p1, v1}, Lcom/instabug/library/internal/storage/a;->a(Landroid/graphics/Bitmap;Lcom/instabug/library/internal/storage/a$b;)V

    return-void
.end method


# virtual methods
.method public final a(Lcom/instabug/library/util/h;Lcom/instabug/library/util/j$a;)V
    .locals 1

    .prologue
    .line 18
    new-instance v0, Lcom/instabug/library/util/k;

    invoke-direct {v0, p0, p2}, Lcom/instabug/library/util/k;-><init>(Lcom/instabug/library/util/j;Lcom/instabug/library/util/j$a;)V

    invoke-virtual {p1, v0}, Lcom/instabug/library/util/h;->a(Lcom/instabug/library/util/h$a;)V

    .line 35
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p1, v0}, Lcom/instabug/library/util/h;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 36
    return-void
.end method
