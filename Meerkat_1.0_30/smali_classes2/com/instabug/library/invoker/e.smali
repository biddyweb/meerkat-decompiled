.class final Lcom/instabug/library/invoker/e;
.super Ljava/lang/Object;
.source "ShakeProcessor.java"

# interfaces
.implements Lcom/instabug/library/internal/sensor/a$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/invoker/c;


# direct methods
.method constructor <init>(Lcom/instabug/library/invoker/c;)V
    .locals 0

    .prologue
    .line 23
    iput-object p1, p0, Lcom/instabug/library/invoker/e;->a:Lcom/instabug/library/invoker/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .prologue
    .line 26
    iget-object v0, p0, Lcom/instabug/library/invoker/e;->a:Lcom/instabug/library/invoker/c;

    invoke-static {v0}, Lcom/instabug/library/invoker/c;->a(Lcom/instabug/library/invoker/c;)I

    .line 27
    iget-object v0, p0, Lcom/instabug/library/invoker/e;->a:Lcom/instabug/library/invoker/c;

    invoke-static {v0}, Lcom/instabug/library/invoker/c;->b(Lcom/instabug/library/invoker/c;)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 28
    iget-object v0, p0, Lcom/instabug/library/invoker/e;->a:Lcom/instabug/library/invoker/c;

    invoke-static {v0}, Lcom/instabug/library/invoker/c;->d(Lcom/instabug/library/invoker/c;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/invoker/e;->a:Lcom/instabug/library/invoker/c;

    invoke-static {v1}, Lcom/instabug/library/invoker/c;->c(Lcom/instabug/library/invoker/c;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 29
    iget-object v0, p0, Lcom/instabug/library/invoker/e;->a:Lcom/instabug/library/invoker/c;

    invoke-static {v0}, Lcom/instabug/library/invoker/c;->e(Lcom/instabug/library/invoker/c;)Lcom/instabug/library/invoker/c$a;

    move-result-object v0

    invoke-interface {v0}, Lcom/instabug/library/invoker/c$a;->a()V

    .line 31
    :cond_0
    return-void
.end method
