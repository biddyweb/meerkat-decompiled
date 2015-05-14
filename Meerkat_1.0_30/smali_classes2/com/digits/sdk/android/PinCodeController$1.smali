.class Lcom/digits/sdk/android/PinCodeController$1;
.super Lcom/digits/sdk/android/DigitsCallback;
.source "PinCodeController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/PinCodeController;->executeRequest(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/digits/sdk/android/DigitsCallback",
        "<",
        "Lcom/digits/sdk/android/DigitsSessionResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/PinCodeController;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/PinCodeController;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Landroid/content/Context;)V
    .locals 0
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # Lcom/digits/sdk/android/DigitsController;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/digits/sdk/android/PinCodeController$1;->this$0:Lcom/digits/sdk/android/PinCodeController;

    iput-object p4, p0, Lcom/digits/sdk/android/PinCodeController$1;->val$context:Landroid/content/Context;

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
            "Lcom/digits/sdk/android/DigitsSessionResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/digits/sdk/android/DigitsSessionResponse;>;"
    iget-object v1, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v1, Lcom/digits/sdk/android/DigitsSessionResponse;

    invoke-static {v1}, Lcom/digits/sdk/android/DigitsSession;->create(Lcom/digits/sdk/android/DigitsSessionResponse;)Lcom/digits/sdk/android/DigitsSession;

    move-result-object v0

    .line 60
    .local v0, "session":Lcom/digits/sdk/android/DigitsSession;
    iget-object v1, p0, Lcom/digits/sdk/android/PinCodeController$1;->this$0:Lcom/digits/sdk/android/PinCodeController;

    iget-object v2, p0, Lcom/digits/sdk/android/PinCodeController$1;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/digits/sdk/android/PinCodeController$1;->this$0:Lcom/digits/sdk/android/PinCodeController;

    # getter for: Lcom/digits/sdk/android/PinCodeController;->phoneNumber:Ljava/lang/String;
    invoke-static {v3}, Lcom/digits/sdk/android/PinCodeController;->access$000(Lcom/digits/sdk/android/PinCodeController;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v0, v3}, Lcom/digits/sdk/android/PinCodeController;->loginSuccess(Landroid/content/Context;Lcom/digits/sdk/android/DigitsSession;Ljava/lang/String;)V

    .line 61
    return-void
.end method
