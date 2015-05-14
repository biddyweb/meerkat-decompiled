.class public final Lcom/instabug/library/interactor/c;
.super Ljava/lang/Object;
.source "SendIssueUseCase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/interactor/c$a;
    }
.end annotation


# instance fields
.field private a:Lcom/instabug/library/internal/storage/s;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/s;)V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/instabug/library/interactor/c;->a:Lcom/instabug/library/internal/storage/s;

    .line 10
    return-void
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;Lcom/instabug/library/interactor/c$a;)V
    .locals 2

    .prologue
    .line 13
    invoke-interface {p2}, Lcom/instabug/library/interactor/c$a;->a()V

    .line 14
    iget-object v0, p0, Lcom/instabug/library/interactor/c;->a:Lcom/instabug/library/internal/storage/s;

    new-instance v1, Lcom/instabug/library/interactor/d;

    invoke-direct {v1, p0}, Lcom/instabug/library/interactor/d;-><init>(Lcom/instabug/library/interactor/c;)V

    invoke-interface {v0, p1, v1}, Lcom/instabug/library/internal/storage/s;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 23
    return-void
.end method
