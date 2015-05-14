.class public interface abstract Lco/getair/meerkat/utilities/CustomService;
.super Ljava/lang/Object;
.source "CustomService.java"


# virtual methods
.method public abstract favoriteTweet(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Query;
            value = "id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/1.1/favorites/create.json"
    .end annotation
.end method

.method public abstract getFriendsIds(JJLcom/twitter/sdk/android/core/Callback;)V
    .param p1    # J
        .annotation runtime Lretrofit/http/Query;
            value = "user_id"
        .end annotation
    .end param
    .param p3    # J
        .annotation runtime Lretrofit/http/Query;
            value = "cursor"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/GET;
        value = "/1.1/friends/ids.json"
    .end annotation
.end method

.method public abstract replyTweet(Ljava/lang/String;Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Query;
            value = "status"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Query;
            value = "in_reply_to_status_id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/1.1/statuses/update.json"
    .end annotation
.end method

.method public abstract retweet(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Path;
            value = "id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/1.1/statuses/retweet/{id}.json"
    .end annotation
.end method

.method public abstract show(JLcom/twitter/sdk/android/core/Callback;)V
    .param p1    # J
        .annotation runtime Lretrofit/http/Query;
            value = "user_id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/models/User;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/GET;
        value = "/1.1/users/show.json"
    .end annotation
.end method

.method public abstract tweet(Ljava/lang/String;Lcom/twitter/sdk/android/core/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Query;
            value = "status"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/google/gson/JsonObject;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/1.1/statuses/update.json"
    .end annotation
.end method
