.class Lcom/digits/sdk/android/PhoneNumberActivityDelegate$1;
.super Ljava/lang/Object;
.source "PhoneNumberActivityDelegate.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->setUpCountrySpinner(Lcom/digits/sdk/android/CountryListSpinner;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/PhoneNumberActivityDelegate;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/PhoneNumberActivityDelegate;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate$1;->this$0:Lcom/digits/sdk/android/PhoneNumberActivityDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate$1;->this$0:Lcom/digits/sdk/android/PhoneNumberActivityDelegate;

    iget-object v0, v0, Lcom/digits/sdk/android/PhoneNumberActivityDelegate;->controller:Lcom/digits/sdk/android/PhoneNumberController;

    invoke-virtual {v0}, Lcom/digits/sdk/android/PhoneNumberController;->clearError()V

    .line 76
    return-void
.end method
