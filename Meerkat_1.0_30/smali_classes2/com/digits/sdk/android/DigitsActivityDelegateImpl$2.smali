.class Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;
.super Ljava/lang/Object;
.source "DigitsActivityDelegateImpl.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/DigitsActivityDelegateImpl;->setUpEditText(Landroid/app/Activity;Lcom/digits/sdk/android/DigitsController;Landroid/widget/EditText;)V
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
    .line 33
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;->this$0:Lcom/digits/sdk/android/DigitsActivityDelegateImpl;

    iput-object p2, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;->val$controller:Lcom/digits/sdk/android/DigitsController;

    iput-object p3, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 36
    const/4 v0, 0x5

    if-ne p2, v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;->val$controller:Lcom/digits/sdk/android/DigitsController;

    invoke-interface {v0}, Lcom/digits/sdk/android/DigitsController;->clearError()V

    .line 38
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;->val$controller:Lcom/digits/sdk/android/DigitsController;

    iget-object v1, p0, Lcom/digits/sdk/android/DigitsActivityDelegateImpl$2;->val$activity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Lcom/digits/sdk/android/DigitsController;->executeRequest(Landroid/content/Context;)V

    .line 39
    const/4 v0, 0x1

    .line 41
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
