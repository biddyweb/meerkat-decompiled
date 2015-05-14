.class public Lcom/twitter/sdk/android/tweetcomposer/TweetComposer;
.super Lio/fabric/sdk/android/Kit;
.source "TweetComposer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/tweetcomposer/TweetComposer$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/Kit",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation

.annotation runtime Lio/fabric/sdk/android/services/concurrency/DependsOn;
    value = {
        Lcom/twitter/sdk/android/core/TwitterCore;
    }
.end annotation


# static fields
.field private static final MIME_TYPE_JPEG:Ljava/lang/String; = "image/jpeg"

.field private static final MIME_TYPE_PLAIN_TEXT:Ljava/lang/String; = "text/plain"

.field private static final TWITTER_PACKAGE_NAME:Ljava/lang/String; = "com.twitter.android"

.field private static final WEB_INTENT:Ljava/lang/String; = "https://twitter.com/intent/tweet?text=%s&url=%s"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Lio/fabric/sdk/android/Kit;-><init>()V

    .line 31
    return-void
.end method


# virtual methods
.method protected doInBackground()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 171
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic doInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 20
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer;->doInBackground()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    const-string v0, "com.twitter.sdk.android:tweet-composer"

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    const-string v0, "0.7.3.33"

    return-object v0
.end method
