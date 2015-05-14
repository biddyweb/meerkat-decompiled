.class public final Lcom/instabug/library/internal/module/d;
.super Ljava/lang/Object;
.source "StorageModule.java"


# instance fields
.field private final a:Lcom/instabug/library/x;

.field private final b:Lcom/instabug/library/model/b;

.field private final c:Lcom/instabug/library/internal/storage/s;

.field private final d:Lcom/instabug/library/internal/storage/e;

.field private final e:Lcom/instabug/library/internal/storage/a;

.field private final f:Lcom/instabug/library/internal/device/a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/db/d;Lcom/instabug/library/internal/storage/a;Lcom/instabug/library/x;Lcom/instabug/library/internal/storage/e;Lcom/instabug/library/internal/storage/s;Lcom/instabug/library/model/b;Lcom/instabug/library/internal/device/a;)V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p2, p0, Lcom/instabug/library/internal/module/d;->e:Lcom/instabug/library/internal/storage/a;

    .line 35
    iput-object p5, p0, Lcom/instabug/library/internal/module/d;->c:Lcom/instabug/library/internal/storage/s;

    .line 36
    iput-object p3, p0, Lcom/instabug/library/internal/module/d;->a:Lcom/instabug/library/x;

    .line 37
    iput-object p4, p0, Lcom/instabug/library/internal/module/d;->d:Lcom/instabug/library/internal/storage/e;

    .line 38
    iput-object p7, p0, Lcom/instabug/library/internal/module/d;->f:Lcom/instabug/library/internal/device/a;

    .line 39
    iput-object p6, p0, Lcom/instabug/library/internal/module/d;->b:Lcom/instabug/library/model/b;

    .line 40
    return-void
.end method


# virtual methods
.method public final a()Lcom/instabug/library/internal/device/a;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/instabug/library/internal/module/d;->f:Lcom/instabug/library/internal/device/a;

    return-object v0
.end method

.method public final b()Lcom/instabug/library/internal/storage/a;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/instabug/library/internal/module/d;->e:Lcom/instabug/library/internal/storage/a;

    return-object v0
.end method

.method public final c()Lcom/instabug/library/x;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/instabug/library/internal/module/d;->a:Lcom/instabug/library/x;

    return-object v0
.end method

.method public final d()Lcom/instabug/library/model/b;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/instabug/library/internal/module/d;->b:Lcom/instabug/library/model/b;

    return-object v0
.end method

.method public final e()Lcom/instabug/library/internal/storage/s;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/instabug/library/internal/module/d;->c:Lcom/instabug/library/internal/storage/s;

    return-object v0
.end method

.method public final f()Lcom/instabug/library/internal/storage/e;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/instabug/library/internal/module/d;->d:Lcom/instabug/library/internal/storage/e;

    return-object v0
.end method
