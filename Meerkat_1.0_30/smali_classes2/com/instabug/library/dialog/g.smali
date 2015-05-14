.class final Lcom/instabug/library/dialog/g;
.super Ljava/lang/Object;
.source "InstabugFeedbackDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private synthetic a:Lcom/instabug/library/dialog/d;


# direct methods
.method constructor <init>(Lcom/instabug/library/dialog/d;)V
    .locals 0

    .prologue
    .line 136
    iput-object p1, p0, Lcom/instabug/library/dialog/g;->a:Lcom/instabug/library/dialog/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/instabug/library/dialog/g;->a:Lcom/instabug/library/dialog/d;

    invoke-virtual {v0}, Lcom/instabug/library/dialog/d;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 140
    return-void
.end method
