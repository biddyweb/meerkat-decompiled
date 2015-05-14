.class final Lcom/instabug/library/presenter/g;
.super Ljava/lang/Object;
.source "FeedbackPresenter.java"

# interfaces
.implements Lcom/instabug/library/interactor/c$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/presenter/e;)V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 103
    const-string v0, "Feedback report sent"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 104
    return-void
.end method
