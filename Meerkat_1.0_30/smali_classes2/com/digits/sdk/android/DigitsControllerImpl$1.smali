.class Lcom/digits/sdk/android/DigitsControllerImpl$1;
.super Ljava/lang/Object;
.source "DigitsControllerImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/DigitsControllerImpl;->loginSuccess(Landroid/content/Context;Lcom/digits/sdk/android/DigitsSession;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/DigitsControllerImpl;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$phoneNumber:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/DigitsControllerImpl;Ljava/lang/String;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 138
    iput-object p1, p0, Lcom/digits/sdk/android/DigitsControllerImpl$1;->this$0:Lcom/digits/sdk/android/DigitsControllerImpl;

    iput-object p2, p0, Lcom/digits/sdk/android/DigitsControllerImpl$1;->val$phoneNumber:Ljava/lang/String;

    iput-object p3, p0, Lcom/digits/sdk/android/DigitsControllerImpl$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/16 v3, 0xc8

    .line 141
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl$1;->this$0:Lcom/digits/sdk/android/DigitsControllerImpl;

    iget-object v0, v0, Lcom/digits/sdk/android/DigitsControllerImpl;->resultReceiver:Landroid/os/ResultReceiver;

    iget-object v1, p0, Lcom/digits/sdk/android/DigitsControllerImpl$1;->this$0:Lcom/digits/sdk/android/DigitsControllerImpl;

    iget-object v2, p0, Lcom/digits/sdk/android/DigitsControllerImpl$1;->val$phoneNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/digits/sdk/android/DigitsControllerImpl;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 142
    iget-object v0, p0, Lcom/digits/sdk/android/DigitsControllerImpl$1;->val$context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-static {v0, v3}, Lio/fabric/sdk/android/services/common/CommonUtils;->finishAffinity(Landroid/app/Activity;I)V

    .line 144
    return-void
.end method
