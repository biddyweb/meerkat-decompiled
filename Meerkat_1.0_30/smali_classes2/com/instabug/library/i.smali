.class final Lcom/instabug/library/i;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Lcom/instabug/library/invoker/c$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/h;


# direct methods
.method constructor <init>(Lcom/instabug/library/h;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/instabug/library/i;->a:Lcom/instabug/library/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/instabug/library/i;->a:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->f()V

    .line 122
    return-void
.end method
