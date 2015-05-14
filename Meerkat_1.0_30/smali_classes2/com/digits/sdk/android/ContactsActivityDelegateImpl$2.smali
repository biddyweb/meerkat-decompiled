.class Lcom/digits/sdk/android/ContactsActivityDelegateImpl$2;
.super Ljava/lang/Object;
.source "ContactsActivityDelegateImpl.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->setUpOkayButton(Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/ContactsActivityDelegateImpl;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/ContactsActivityDelegateImpl;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl$2;->this$0:Lcom/digits/sdk/android/ContactsActivityDelegateImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl$2;->this$0:Lcom/digits/sdk/android/ContactsActivityDelegateImpl;

    iget-object v0, v0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->controller:Lcom/digits/sdk/android/ContactsController;

    iget-object v1, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl$2;->this$0:Lcom/digits/sdk/android/ContactsActivityDelegateImpl;

    iget-object v1, v1, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    invoke-interface {v0, v1}, Lcom/digits/sdk/android/ContactsController;->startUploadService(Landroid/content/Context;)V

    .line 66
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl$2;->this$0:Lcom/digits/sdk/android/ContactsActivityDelegateImpl;

    iget-object v0, v0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 67
    return-void
.end method
