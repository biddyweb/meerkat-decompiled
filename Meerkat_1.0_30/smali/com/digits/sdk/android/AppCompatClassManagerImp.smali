.class Lcom/digits/sdk/android/AppCompatClassManagerImp;
.super Ljava/lang/Object;
.source "AppCompatClassManagerImp.java"

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
    const-class v0, Lcom/digits/sdk/android/ConfirmationCodeActionBarActivity;

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
    const-class v0, Lcom/digits/sdk/android/ContactsActionBarActivity;

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
    const-class v0, Lcom/digits/sdk/android/FailureActionBarActivity;

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
    const-class v0, Lcom/digits/sdk/android/LoginCodeActionBarActivity;

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
    const-class v0, Lcom/digits/sdk/android/PhoneNumberActionBarActivity;

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
    const-class v0, Lcom/digits/sdk/android/PinCodeActionBarActivity;

    return-object v0
.end method
