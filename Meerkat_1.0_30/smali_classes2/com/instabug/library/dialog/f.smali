.class final Lcom/instabug/library/dialog/f;
.super Ljava/lang/Object;
.source "InstabugFeedbackDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic a:Lcom/instabug/library/dialog/d;


# direct methods
.method constructor <init>(Lcom/instabug/library/dialog/d;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lcom/instabug/library/dialog/f;->a:Lcom/instabug/library/dialog/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/instabug/library/dialog/f;->a:Lcom/instabug/library/dialog/d;

    invoke-static {v0}, Lcom/instabug/library/dialog/d;->a(Lcom/instabug/library/dialog/d;)Lcom/instabug/library/presenter/e;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/presenter/e;->a()V

    .line 133
    return-void
.end method
