.class public Lcom/instabug/library/InstabugFeedbackActivity;
.super Landroid/app/Activity;
.source "InstabugFeedbackActivity.java"


# instance fields
.field private annotationScreen:Lcom/instabug/library/b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/instabug/library/InstabugFeedbackActivity;->annotationScreen:Lcom/instabug/library/b;

    invoke-virtual {v0}, Lcom/instabug/library/b;->j()V

    .line 31
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 32
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .prologue
    .line 13
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 14
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/instabug/library/InstabugFeedbackActivity;->requestWindowFeature(I)Z

    .line 15
    new-instance v0, Lcom/instabug/library/b;

    invoke-direct {v0, p0}, Lcom/instabug/library/b;-><init>(Lcom/instabug/library/InstabugFeedbackActivity;)V

    iput-object v0, p0, Lcom/instabug/library/InstabugFeedbackActivity;->annotationScreen:Lcom/instabug/library/b;

    .line 16
    iget-object v0, p0, Lcom/instabug/library/InstabugFeedbackActivity;->annotationScreen:Lcom/instabug/library/b;

    invoke-virtual {v0}, Lcom/instabug/library/b;->a()V

    .line 17
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/instabug/library/InstabugFeedbackActivity;->annotationScreen:Lcom/instabug/library/b;

    invoke-virtual {v0}, Lcom/instabug/library/b;->b()V

    .line 37
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 38
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 23
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 24
    iget-object v0, p0, Lcom/instabug/library/InstabugFeedbackActivity;->annotationScreen:Lcom/instabug/library/b;

    invoke-virtual {v0}, Lcom/instabug/library/b;->i()V

    .line 26
    return-void
.end method
