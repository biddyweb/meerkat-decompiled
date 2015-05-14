.class final Lcom/instabug/library/n;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Lcom/instabug/library/util/b$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/h;


# direct methods
.method constructor <init>(Lcom/instabug/library/h;)V
    .locals 0

    .prologue
    .line 209
    iput-object p1, p0, Lcom/instabug/library/n;->a:Lcom/instabug/library/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 212
    iget-object v0, p0, Lcom/instabug/library/n;->a:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;)Lcom/instabug/library/x;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/instabug/library/x;->h(Z)V

    .line 214
    return-void
.end method
