.class public abstract Lcom/digits/sdk/android/ContactsCallback;
.super Lcom/twitter/sdk/android/core/Callback;
.source "ContactsCallback.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/twitter/sdk/android/core/Callback",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    .local p0, "this":Lcom/digits/sdk/android/ContactsCallback;, "Lcom/digits/sdk/android/ContactsCallback<TT;>;"
    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract failure(Lcom/twitter/sdk/android/core/TwitterException;)V
.end method

.method public abstract success(Lcom/twitter/sdk/android/core/Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<TT;>;)V"
        }
    .end annotation
.end method
