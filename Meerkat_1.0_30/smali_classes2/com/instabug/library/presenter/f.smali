.class final Lcom/instabug/library/presenter/f;
.super Ljava/lang/Object;
.source "FeedbackPresenter.java"

# interfaces
.implements Lcom/instabug/library/interactor/c$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/presenter/e;)V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 57
    const-string v0, "reportCaughtException: Your exception has been reported"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 58
    return-void
.end method
