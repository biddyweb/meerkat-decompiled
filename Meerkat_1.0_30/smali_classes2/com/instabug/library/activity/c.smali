.class final Lcom/instabug/library/activity/c;
.super Ljava/lang/Object;
.source "InstabugInvocationDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private synthetic a:Lcom/instabug/library/activity/b;


# direct methods
.method constructor <init>(Lcom/instabug/library/activity/b;)V
    .locals 0

    .prologue
    .line 81
    iput-object p1, p0, Lcom/instabug/library/activity/c;->a:Lcom/instabug/library/activity/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/instabug/library/activity/c;->a:Lcom/instabug/library/activity/b;

    iget-object v0, v0, Lcom/instabug/library/activity/b;->a:Lcom/instabug/library/activity/a;

    invoke-static {v0}, Lcom/instabug/library/activity/a;->a(Lcom/instabug/library/activity/a;)V

    .line 85
    return-void
.end method
