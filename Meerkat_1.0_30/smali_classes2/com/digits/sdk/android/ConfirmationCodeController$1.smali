.class Lcom/digits/sdk/android/ConfirmationCodeController$1;
.super Lcom/digits/sdk/android/DigitsCallback;
.source "ConfirmationCodeController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/ConfirmationCodeController;->executeRequest(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/digits/sdk/android/DigitsCallback",
        "<",
        "Lcom/digits/sdk/android/DigitsUser;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/ConfirmationCodeController;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/ConfirmationCodeController;Landroid/content/Context;Lcom/digits/sdk/android/DigitsController;Landroid/content/Context;)V
    .locals 0
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # Lcom/digits/sdk/android/DigitsController;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/digits/sdk/android/ConfirmationCodeController$1;->this$0:Lcom/digits/sdk/android/ConfirmationCodeController;

    iput-object p4, p0, Lcom/digits/sdk/android/ConfirmationCodeController$1;->val$context:Landroid/content/Context;

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
            "Lcom/digits/sdk/android/DigitsUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Lcom/digits/sdk/android/DigitsUser;>;"
    invoke-static {p1}, Lcom/digits/sdk/android/DigitsSession;->create(Lcom/twitter/sdk/android/core/Result;)Lcom/digits/sdk/android/DigitsSession;

    move-result-object v0

    .line 48
    .local v0, "session":Lcom/digits/sdk/android/DigitsSession;
    iget-object v1, p0, Lcom/digits/sdk/android/ConfirmationCodeController$1;->this$0:Lcom/digits/sdk/android/ConfirmationCodeController;

    iget-object v2, p0, Lcom/digits/sdk/android/ConfirmationCodeController$1;->val$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/digits/sdk/android/ConfirmationCodeController$1;->this$0:Lcom/digits/sdk/android/ConfirmationCodeController;

    # getter for: Lcom/digits/sdk/android/ConfirmationCodeController;->phoneNumber:Ljava/lang/String;
    invoke-static {v3}, Lcom/digits/sdk/android/ConfirmationCodeController;->access$000(Lcom/digits/sdk/android/ConfirmationCodeController;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v0, v3}, Lcom/digits/sdk/android/ConfirmationCodeController;->loginSuccess(Landroid/content/Context;Lcom/digits/sdk/android/DigitsSession;Ljava/lang/String;)V

    .line 49
    return-void
.end method
