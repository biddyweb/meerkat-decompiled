.class Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;
.super Ljava/lang/Object;
.source "DigitsActivityDelegateImpl.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/DigitsActivityDelegateImpl;->setUpSendButton(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Lcom/digits/sdk/android/StateButton;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/DigitsActivityDelegateImpl;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$controller:Lcom/digits/sdk/android/DigitsController;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/DigitsActivityDelegateImpl;Lcom/digits/sdk/android/DigitsController;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 21
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;->this$0:Lcom/digits/sdk/android/DigitsActivityDelegateImpl;

    iput-object p2, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;->val$controller:Lcom/digits/sdk/android/DigitsController;

    iput-object p3, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;->val$controller:Lcom/digits/sdk/android/DigitsController;

    invoke-interface {v0}, Lcom/digits/sdk/android/DigitsController;->clearError()V

    .line 25
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;->val$controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v1, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$1;->val$activity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Lcom/digits/sdk/android/DigitsController;->executeRequest(Landroid/content/Context;)V

    .line 26
    return-void
.end method
