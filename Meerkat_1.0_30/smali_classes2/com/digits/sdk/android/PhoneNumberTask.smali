.class Lcom/digits/sdk/android/PhoneNumberTask;
.super Lio/fabric/sdk/android/services/concurrency/AsyncTask;
.source "PhoneNumberTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/digits/sdk/android/PhoneNumberTask$Listener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/services/concurrency/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/digits/sdk/android/PhoneNumber;",
        ">;"
    }
.end annotation


# instance fields
.field private final listener:Lcom/digits/sdk/android/PhoneNumberTask$Listener;

.field private final phoneNumberUtils:Lcom/digits/sdk/android/PhoneNumberUtils;


# direct methods
.method protected constructor <init>(Lcom/digits/sdk/android/PhoneNumberUtils;Lcom/digits/sdk/android/PhoneNumberTask$Listener;)V
    .locals 2
    .param p1, "phoneNumberUtils"    # Lcom/digits/sdk/android/PhoneNumberUtils;
    .param p2, "listener"    # Lcom/digits/sdk/android/PhoneNumberTask$Listener;

    .prologue
    .line 9
    invoke-direct {p0}, Lio/fabric/sdk/android/services/concurrency/AsyncTask;-><init>()V

    .line 10
    if-nez p1, :cond_0

    .line 11
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "phoneNumberManager can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 13
    :cond_0
    iput-object p2, p0, Lcom/digits/sdk/android/PhoneNumberTask;->listener:Lcom/digits/sdk/android/PhoneNumberTask$Listener;

    .line 14
    iput-object p1, p0, Lcom/digits/sdk/android/PhoneNumberTask;->phoneNumberUtils:Lcom/digits/sdk/android/PhoneNumberUtils;

    .line 15
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/digits/sdk/android/PhoneNumber;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberTask;->phoneNumberUtils:Lcom/digits/sdk/android/PhoneNumberUtils;

    invoke-virtual {v0}, Lcom/digits/sdk/android/PhoneNumberUtils;->getPhoneNumber()Lcom/digits/sdk/android/PhoneNumber;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 5
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/digits/sdk/android/PhoneNumberTask;->doInBackground([Ljava/lang/Void;)Lcom/digits/sdk/android/PhoneNumber;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/digits/sdk/android/PhoneNumber;)V
    .locals 1
    .param p1, "phoneNumber"    # Lcom/digits/sdk/android/PhoneNumber;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberTask;->listener:Lcom/digits/sdk/android/PhoneNumberTask$Listener;

    if-eqz v0, :cond_0

    .line 26
    iget-object v0, p0, Lcom/digits/sdk/android/PhoneNumberTask;->listener:Lcom/digits/sdk/android/PhoneNumberTask$Listener;

    invoke-interface {v0, p1}, Lcom/digits/sdk/android/PhoneNumberTask$Listener;->onLoadComplete(Lcom/digits/sdk/android/PhoneNumber;)V

    .line 28
    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 5
    check-cast p1, Lcom/digits/sdk/android/PhoneNumber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/digits/sdk/android/PhoneNumberTask;->onPostExecute(Lcom/digits/sdk/android/PhoneNumber;)V

    return-void
.end method
