.class final Lcom/instabug/library/invoker/d;
.super Ljava/lang/Object;
.source "ShakeProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/instabug/library/invoker/c;


# direct methods
.method constructor <init>(Lcom/instabug/library/invoker/c;)V
    .locals 0

    .prologue
    .line 16
    iput-object p1, p0, Lcom/instabug/library/invoker/d;->a:Lcom/instabug/library/invoker/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 19
    iget-object v0, p0, Lcom/instabug/library/invoker/d;->a:Lcom/instabug/library/invoker/c;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/instabug/library/invoker/c;->a(Lcom/instabug/library/invoker/c;I)I

    .line 20
    return-void
.end method
