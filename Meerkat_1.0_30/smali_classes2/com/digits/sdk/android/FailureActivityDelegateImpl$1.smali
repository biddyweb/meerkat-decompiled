.class Lcom/digits/sdk/android/FailureActivityDelegateImpl$1;
.super Ljava/lang/Object;
.source "FailureActivityDelegateImpl.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/FailureActivityDelegateImpl;->setUpDismissButton(Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/FailureActivityDelegateImpl;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/FailureActivityDelegateImpl;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl$1;->this$0:Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl$1;->this$0:Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    iget-object v0, v0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->activity:Landroid/app/Activity;

    const/16 v1, 0xc8

    invoke-static {v0, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->finishAffinity(Landroid/app/Activity;I)V

    .line 75
    iget-object v0, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl$1;->this$0:Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    iget-object v0, v0, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->controller:Lcom/digits/sdk/android/FailureController;

    iget-object v1, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl$1;->this$0:Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    invoke-static {v1}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->access$000(Lcom/digits/sdk/android/FailureActivityDelegateImpl;)Landroid/os/ResultReceiver;

    move-result-object v1

    iget-object v2, p0, Lcom/digits/sdk/android/FailureActivityDelegateImpl$1;->this$0:Lcom/digits/sdk/android/FailureActivityDelegateImpl;

    invoke-static {v2}, Lcom/digits/sdk/android/FailureActivityDelegateImpl;->access$100(Lcom/digits/sdk/android/FailureActivityDelegateImpl;)Lcom/digits/sdk/android/DigitsException;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/digits/sdk/android/FailureController;->sendFailure(Landroid/os/ResultReceiver;Ljava/lang/Exception;)V

    .line 76
    return-void
.end method
