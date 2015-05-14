.class Lcom/digits/sdk/android/PhoneNumberController$1$1;
.super Ljava/lang/Object;
.source "PhoneNumberController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/PhoneNumberController$1;->success(Lcom/twitter/sdk/android/core/Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/digits/sdk/android/PhoneNumberController$1;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/PhoneNumberController$1;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/digits/sdk/android/PhoneNumberController$1$1;->this$1:Lcom/digits/sdk/android/PhoneNumberController$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberController$1$1;->this$1:Lcom/digits/sdk/android/PhoneNumberController$1;

    iget-object v0, v0, Lcom/digits/sdk/android/PhoneNumberController$1;->this$0:Lcom/digits/sdk/android/PhoneNumberController;

    iget-object v1, p0, Lcom/digits/sdk/android/PhoneNumberController$1$1;->this$1:Lcom/digits/sdk/android/PhoneNumberController$1;

    iget-object v1, v1, Lcom/digits/sdk/android/PhoneNumberController$1;->val$context:Landroid/content/Context;

    # invokes: Lcom/digits/sdk/android/PhoneNumberController;->startNextStep(Landroid/content/Context;)V
    invoke-static {v0, v1}, Lcom/digits/sdk/android/PhoneNumberController;->access$000(Lcom/digits/sdk/android/PhoneNumberController;Landroid/content/Context;)V

    .line 73
    return-void
.end method
