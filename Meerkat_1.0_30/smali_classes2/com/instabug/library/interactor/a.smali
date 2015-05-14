.class public final Lcom/instabug/library/interactor/a;
.super Ljava/lang/Object;
.source "SendCrashUseCase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/interactor/a$a;
    }
.end annotation


# instance fields
.field private a:Lcom/instabug/library/internal/storage/e;

.field private b:Lcom/instabug/library/interactor/a$a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/e;)V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/instabug/library/interactor/a;->a:Lcom/instabug/library/internal/storage/e;

    .line 12
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/interactor/a;)Lcom/instabug/library/interactor/a$a;
    .locals 1

    .prologue
    .line 6
    iget-object v0, p0, Lcom/instabug/library/interactor/a;->b:Lcom/instabug/library/interactor/a$a;

    return-object v0
.end method

.method static synthetic a(Lcom/instabug/library/interactor/a;Lcom/instabug/library/internal/storage/e;)Lcom/instabug/library/internal/storage/e;
    .locals 1

    .prologue
    .line 6
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/interactor/a;->a:Lcom/instabug/library/internal/storage/e;

    return-object v0
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;Lcom/instabug/library/interactor/a$a;)V
    .locals 2

    .prologue
    .line 15
    iput-object p2, p0, Lcom/instabug/library/interactor/a;->b:Lcom/instabug/library/interactor/a$a;

    .line 16
    iget-object v0, p0, Lcom/instabug/library/interactor/a;->a:Lcom/instabug/library/internal/storage/e;

    new-instance v1, Lcom/instabug/library/interactor/b;

    invoke-direct {v1, p0}, Lcom/instabug/library/interactor/b;-><init>(Lcom/instabug/library/interactor/a;)V

    invoke-virtual {v0, p1, v1}, Lcom/instabug/library/internal/storage/e;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 29
    return-void
.end method
