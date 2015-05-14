.class Lcom/digits/sdk/android/PhoneNumberController$2;
.super Lcom/digits/sdk/android/DigitsCallback;
.source "PhoneNumberController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/PhoneNumberController;->handleError(Landroid/content/Context;Lcom/digits/sdk/android/DigitsException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/digits/sdk/android/DigitsCallback",
        "<",
        "Lcom/digits/sdk/android/AuthResponse;",
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
    .line 85
    iput-object p1, p0, Lcom/digits/sdk/android/PhoneNumberController$2;->this$0:Lcom/digits/sdk/android/PhoneNumberController;

    iput-object p4, p0, Lcom/digits/sdk/android/PhoneNumberController$2;->val$context:Landroid/content/Context;

    invoke-direct {p0, p2, p3}, Lcom/digits/sdk/android/DigitsCallback;-><init>(Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Lcom/digits/sdk/android/AuthResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/digits/sdk/android/AuthResponse;>;"
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberController$2;->this$0:Lcom/digits/sdk/android/PhoneNumberController;

    iget-object v0, v0, Lcom/digits/sdk/android/PhoneNumberController;->sendButton:Lcom/digits/sdk/android/StateButton;

    invoke-virtual {v0}, Lcom/digits/sdk/android/StateButton;->showFinish()V

    .line 89
    iget-object v1, p0, Lcom/digits/sdk/android/PhoneNumberController$2;->this$0:Lcom/digits/sdk/android/PhoneNumberController;

    iget-object v2, p0, Lcom/digits/sdk/android/PhoneNumberController$2;->val$context:Landroid/content/Context;

    iget-object v0, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v0, Lcom/digits/sdk/android/AuthResponse;

    iget-object v3, v0, Lcom/digits/sdk/android/AuthResponse;->requestId:Ljava/lang/String;

    iget-object v0, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v0, Lcom/digits/sdk/android/AuthResponse;

    iget-wide v4, v0, Lcom/digits/sdk/android/AuthResponse;->userId:J

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/digits/sdk/android/PhoneNumberController;->startSignIn(Landroid/content/Context;Ljava/lang/String;J)V

    .line 90
    return-void
.end method
