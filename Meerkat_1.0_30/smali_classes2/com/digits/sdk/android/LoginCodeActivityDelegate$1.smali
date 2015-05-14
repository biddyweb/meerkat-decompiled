.class Lcom/digits/sdk/android/LoginCodeActivityDelegate$1;
.super Ljava/lang/Object;
.source "LoginCodeActivityDelegate.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/LoginCodeActivityDelegate;->setUpResendText(Landroid/app/Activity;Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/LoginCodeActivityDelegate;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/LoginCodeActivityDelegate;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 64
    iput-object p1, p0, Lcom/digits/sdk/android/LoginCodeActivityDelegate$1;->this$0:Lcom/digits/sdk/android/LoginCodeActivityDelegate;

    iput-object p2, p0, Lcom/digits/sdk/android/LoginCodeActivityDelegate$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/digits/sdk/android/LoginCodeActivityDelegate$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 68
    return-void
.end method
