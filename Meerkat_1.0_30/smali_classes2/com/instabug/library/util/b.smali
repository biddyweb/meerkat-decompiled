.class public final Lcom/instabug/library/util/b;
.super Ljava/lang/Object;
.source "DeviceRegistrar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/util/b$a;
    }
.end annotation


# instance fields
.field private a:Lcom/instabug/library/x;

.field private b:Lcom/instabug/library/util/b$a;

.field private c:Lcom/instabug/library/network/restapi/a;

.field private d:Lcom/instabug/library/internal/device/a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/x;Lcom/instabug/library/network/restapi/a;Lcom/instabug/library/internal/device/a;)V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/instabug/library/util/b;->a:Lcom/instabug/library/x;

    .line 17
    iput-object p3, p0, Lcom/instabug/library/util/b;->d:Lcom/instabug/library/internal/device/a;

    .line 18
    iput-object p2, p0, Lcom/instabug/library/util/b;->c:Lcom/instabug/library/network/restapi/a;

    .line 19
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/util/b;)Lcom/instabug/library/util/b$a;
    .locals 1

    .prologue
    .line 8
    iget-object v0, p0, Lcom/instabug/library/util/b;->b:Lcom/instabug/library/util/b$a;

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/instabug/library/util/b$a;)V
    .locals 9

    .prologue
    .line 22
    iput-object p1, p0, Lcom/instabug/library/util/b;->b:Lcom/instabug/library/util/b$a;

    .line 25
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/util/b;->c:Lcom/instabug/library/network/restapi/a;

    iget-object v1, p0, Lcom/instabug/library/util/b;->d:Lcom/instabug/library/internal/device/a;

    invoke-virtual {v1}, Lcom/instabug/library/internal/device/a;->j()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/instabug/library/util/b;->a:Lcom/instabug/library/x;

    invoke-virtual {v2}, Lcom/instabug/library/x;->b()Ljava/lang/String;

    move-result-object v2

    .line 26
    invoke-static {}, Lcom/instabug/library/internal/device/a;->a()Ljava/lang/String;

    move-result-object v3

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/instabug/library/util/b;->d:Lcom/instabug/library/internal/device/a;

    .line 27
    invoke-virtual {v5}, Lcom/instabug/library/internal/device/a;->h()Ljava/lang/String;

    move-result-object v5

    const-string v6, "1.3.2"

    invoke-static {}, Lcom/instabug/library/internal/device/a;->c()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/instabug/library/util/c;

    invoke-direct {v8, p0}, Lcom/instabug/library/util/c;-><init>(Lcom/instabug/library/util/b;)V

    .line 25
    invoke-virtual/range {v0 .. v8}, Lcom/instabug/library/network/restapi/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/instabug/library/interactor/a$a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :goto_0
    return-void

    .line 38
    :catch_0
    move-exception v0

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to create device registration request. Reason is:\n"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method
