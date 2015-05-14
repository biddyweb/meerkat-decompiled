.class final Lcom/instabug/library/interactor/b;
.super Ljava/lang/Object;
.source "SendCrashUseCase.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/e$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/interactor/a;


# direct methods
.method constructor <init>(Lcom/instabug/library/interactor/a;)V
    .locals 0

    .prologue
    .line 16
    iput-object p1, p0, Lcom/instabug/library/interactor/b;->a:Lcom/instabug/library/interactor/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;)V
    .locals 2

    .prologue
    .line 19
    iget-object v0, p0, Lcom/instabug/library/interactor/b;->a:Lcom/instabug/library/interactor/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/instabug/library/interactor/a;->a(Lcom/instabug/library/interactor/a;Lcom/instabug/library/internal/storage/e;)Lcom/instabug/library/internal/storage/e;

    .line 20
    iget-object v0, p0, Lcom/instabug/library/interactor/b;->a:Lcom/instabug/library/interactor/a;

    invoke-static {v0}, Lcom/instabug/library/interactor/a;->a(Lcom/instabug/library/interactor/a;)Lcom/instabug/library/interactor/a$a;

    move-result-object v0

    invoke-interface {v0}, Lcom/instabug/library/interactor/a$a;->a()V

    .line 21
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/instabug/library/interactor/b;->a:Lcom/instabug/library/interactor/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/instabug/library/interactor/a;->a(Lcom/instabug/library/interactor/a;Lcom/instabug/library/internal/storage/e;)Lcom/instabug/library/internal/storage/e;

    .line 26
    iget-object v0, p0, Lcom/instabug/library/interactor/b;->a:Lcom/instabug/library/interactor/a;

    invoke-static {v0}, Lcom/instabug/library/interactor/a;->a(Lcom/instabug/library/interactor/a;)Lcom/instabug/library/interactor/a$a;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/instabug/library/interactor/a$a;->a(Ljava/lang/String;)V

    .line 27
    return-void
.end method
