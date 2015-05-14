.class Lcom/digits/sdk/android/PhoneNumberController$1;
.super Lcom/digits/sdk/android/DigitsCallback;
.source "PhoneNumberController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/PhoneNumberController;->executeRequest(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/digits/sdk/android/DigitsCallback",
        "<",
        "Lretrofit/client/Response;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/PhoneNumberController;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/PhoneNumberController;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Landroid/content/Context;)V
    .locals 0
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # Lcom/digits/sdk/android/DigitsController;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/digits/sdk/android/PhoneNumberController$1;->this$0:Lcom/digits/sdk/android/PhoneNumberController;

    iput-object p4, p0, Lcom/digits/sdk/android/PhoneNumberController$1;->val$context:Landroid/content/Context;

    invoke-direct {p0, p2, p3}, Lcom/digits/sdk/android/DigitsCallback;-><init>(Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lretrofit/client/Response;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lretrofit/client/Response;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberController$1;->this$0:Lcom/digits/sdk/android/PhoneNumberController;

    iget-object v0, v0, Lcom/digits/sdk/android/PhoneNumberController;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v0}, Lcom/digits/sdk/android/StateButton;->showFinish()V

    .line 69
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberController$1;->this$0:Lcom/digits/sdk/android/PhoneNumberController;

    iget-object v0, v0, Lcom/digits/sdk/android/PhoneNumberController;->editText:Landroid/widget/EditText;

    new-instance v1, Lcom/digits/sdk/android/PhoneNumberController$1$1;

    invoke-direct {v1, p0}, Lcom/digits/sdk/android/PhoneNumberController$1$1;-><init>(Lcom/digits/sdk/android/PhoneNumberController$1;)V

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 75
    return-void
.end method
