.class public Lco/getair/meerkat/dtos/User;
.super Ljava/lang/Object;
.source "User.java"

# interfaces
.implements Lco/getair/meerkat/dtos/IUserToFollow;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/dtos/User$Stats;
    }
.end annotation


# static fields
.field private static myUserFileName:Ljava/lang/String;


# instance fields
.field private final FOLLOW_ACTION_URL_KEY:Ljava/lang/String;

.field private bio:Ljava/lang/String;

.field private deviceToken:Ljava/lang/String;

.field private displayName:Ljava/lang/String;

.field private followupActions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private id:Ljava/lang/String;

.field private privacy:Ljava/lang/String;

.field private stats:Lco/getair/meerkat/dtos/User$Stats;

.field private twitterId:Ljava/lang/String;

.field private username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-string v0, "myUser.persistency"

    sput-object v0, Lco/getair/meerkat/dtos/User;->myUserFileName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "privacy"    # Ljava/lang/String;
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "displayName"    # Ljava/lang/String;
    .param p5, "twitterId"    # Ljava/lang/String;
    .param p6, "bio"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string v0, "follow"

    iput-object v0, p0, Lco/getair/meerkat/dtos/User;->FOLLOW_ACTION_URL_KEY:Ljava/lang/String;

    .line 49
    iput-object p1, p0, Lco/getair/meerkat/dtos/User;->id:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lco/getair/meerkat/dtos/User;->privacy:Ljava/lang/String;

    .line 51
    iput-object p3, p0, Lco/getair/meerkat/dtos/User;->username:Ljava/lang/String;

    .line 52
    iput-object p4, p0, Lco/getair/meerkat/dtos/User;->displayName:Ljava/lang/String;

    .line 53
    iput-object p5, p0, Lco/getair/meerkat/dtos/User;->twitterId:Ljava/lang/String;

    .line 54
    iput-object p6, p0, Lco/getair/meerkat/dtos/User;->bio:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public static fetchUser(Landroid/content/Context;Ljava/lang/String;Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "completionRunnable"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 119
    if-nez p2, :cond_0

    .line 174
    :goto_0
    return-void

    .line 121
    :cond_0
    invoke-static {p0}, Lco/getair/meerkat/ApiProxy;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/ApiProxy;

    move-result-object v1

    const-string v3, "profileTemplate"

    invoke-virtual {v1, v3}, Lco/getair/meerkat/ApiProxy;->getUrlForFollowupActionKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 122
    .local v2, "getUserUrl":Ljava/lang/String;
    const-string v1, "{userId}"

    invoke-virtual {v2, v1, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 124
    new-instance v0, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;

    const/4 v1, 0x0

    const-string v3, ""

    new-instance v4, Lco/getair/meerkat/dtos/User$1;

    invoke-direct {v4, p2}, Lco/getair/meerkat/dtos/User$1;-><init>(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    new-instance v5, Lco/getair/meerkat/dtos/User$2;

    invoke-direct {v5, p2}, Lco/getair/meerkat/dtos/User$2;-><init>(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/utilities/ApiAuthorizedRequest;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 173
    .local v0, "requestUser":Lcom/android/volley/toolbox/JsonObjectRequest;
    invoke-static {p0}, Lco/getair/meerkat/utilities/NetworkQueue;->getInstance(Landroid/content/Context;)Lco/getair/meerkat/utilities/NetworkQueue;

    move-result-object v1

    invoke-virtual {v1, v0}, Lco/getair/meerkat/utilities/NetworkQueue;->addToRequestQueue(Lcom/android/volley/Request;)V

    goto :goto_0
.end method

.method public static getMyUserFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    sget-object v0, Lco/getair/meerkat/dtos/User;->myUserFileName:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getBio()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->bio:Ljava/lang/String;

    return-object v0
.end method

.method public getDeviceToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->deviceToken:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->displayName:Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFollowUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 76
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->followupActions:Ljava/util/HashMap;

    const-string v1, "follow"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getFollowupActions()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->followupActions:Ljava/util/HashMap;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getImageUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 108
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->followupActions:Ljava/util/HashMap;

    const-string v1, "profileImage"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getPrivacy()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->privacy:Ljava/lang/String;

    return-object v0
.end method

.method public getStats()Lco/getair/meerkat/dtos/User$Stats;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->stats:Lco/getair/meerkat/dtos/User$Stats;

    return-object v0
.end method

.method public getThumbnailImageUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 104
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->followupActions:Ljava/util/HashMap;

    const-string v1, "profileThumbImage"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->twitterId:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lco/getair/meerkat/dtos/User;->username:Ljava/lang/String;

    return-object v0
.end method

.method public setDeviceToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceToken"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lco/getair/meerkat/dtos/User;->deviceToken:Ljava/lang/String;

    return-void
.end method

.method public setFollowupActions(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p1, "followupActions":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lco/getair/meerkat/dtos/User;->followupActions:Ljava/util/HashMap;

    .line 101
    return-void
.end method

.method public setStats(Lco/getair/meerkat/dtos/User$Stats;)V
    .locals 0
    .param p1, "stats"    # Lco/getair/meerkat/dtos/User$Stats;

    .prologue
    .line 181
    iput-object p1, p0, Lco/getair/meerkat/dtos/User;->stats:Lco/getair/meerkat/dtos/User$Stats;

    .line 182
    return-void
.end method
