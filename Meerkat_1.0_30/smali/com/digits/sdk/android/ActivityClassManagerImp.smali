.class Lcom/digits/sdk/android/ActivityClassManagerImp;
.super Ljava/lang/Object;
.source "ActivityClassManagerImp.java"

# interfaces
.implements Lcom/digits/sdk/android/ActivityClassManager;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getConfirmationActivity()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 13
    const-class v0, Lcom/digits/sdk/android/ConfirmationCodeActivity;

    return-object v0
.end method

.method public getContactsActivity()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    const-class v0, Lcom/digits/sdk/android/ContactsActivity;

    return-object v0
.end method

.method public getFailureActivity()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 23
    const-class v0, Lcom/digits/sdk/android/FailureActivity;

    return-object v0
.end method

.method public getLoginCodeActivity()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 18
    const-class v0, Lcom/digits/sdk/android/LoginCodeActivity;

    return-object v0
.end method

.method public getPhoneNumberActivity()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 8
    const-class v0, Lcom/digits/sdk/android/PhoneNumberActivity;

    return-object v0
.end method

.method public getPinCodeActivity()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 33
    const-class v0, Lcom/digits/sdk/android/PinCodeActivity;

    return-object v0
.end method
