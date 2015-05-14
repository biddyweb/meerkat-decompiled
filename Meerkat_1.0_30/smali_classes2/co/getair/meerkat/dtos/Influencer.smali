.class public Lco/getair/meerkat/dtos/Influencer;
.super Ljava/lang/Object;
.source "Influencer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/dtos/Influencer$Type;
    }
.end annotation


# instance fields
.field displayName:Ljava/lang/String;

.field id:Ljava/lang/String;

.field type:Lco/getair/meerkat/dtos/Influencer$Type;

.field userName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "rawString"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const-string v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 25
    .local v1, "influencerParts":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-direct {p0, v2}, Lco/getair/meerkat/dtos/Influencer;->stringToType(Ljava/lang/String;)Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/dtos/Influencer;->type:Lco/getair/meerkat/dtos/Influencer$Type;

    .line 26
    const/4 v2, 0x1

    aget-object v2, v1, v2

    iput-object v2, p0, Lco/getair/meerkat/dtos/Influencer;->id:Ljava/lang/String;

    .line 28
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v2

    const-string v3, "graphProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/GraphProxy;

    .line 30
    .local v0, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    iget-object v2, p0, Lco/getair/meerkat/dtos/Influencer;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lco/getair/meerkat/proxies/GraphProxy;->getFollowedDisplayNameForUserId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/dtos/Influencer;->displayName:Ljava/lang/String;

    .line 31
    iget-object v2, p0, Lco/getair/meerkat/dtos/Influencer;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lco/getair/meerkat/proxies/GraphProxy;->getFollowedUsernameForUserId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/dtos/Influencer;->userName:Ljava/lang/String;

    .line 32
    return-void
.end method

.method private stringToType(Ljava/lang/String;)Lco/getair/meerkat/dtos/Influencer$Type;
    .locals 2
    .param p1, "typeString"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string v1, "b"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    sget-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeBroadcaster:Lco/getair/meerkat/dtos/Influencer$Type;

    .line 74
    .local v0, "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    :goto_0
    return-object v0

    .line 60
    .end local v0    # "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    :cond_0
    const-string v1, "r"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 62
    sget-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeRestreamer:Lco/getair/meerkat/dtos/Influencer$Type;

    .restart local v0    # "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    goto :goto_0

    .line 63
    .end local v0    # "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    :cond_1
    const-string v1, "l"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 65
    sget-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeLiker:Lco/getair/meerkat/dtos/Influencer$Type;

    .restart local v0    # "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    goto :goto_0

    .line 66
    .end local v0    # "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    :cond_2
    const-string v1, "f"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 68
    sget-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeFeatured:Lco/getair/meerkat/dtos/Influencer$Type;

    .restart local v0    # "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    goto :goto_0

    .line 71
    .end local v0    # "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    :cond_3
    sget-object v0, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeNone:Lco/getair/meerkat/dtos/Influencer$Type;

    .restart local v0    # "resultType":Lco/getair/meerkat/dtos/Influencer$Type;
    goto :goto_0
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lco/getair/meerkat/dtos/Influencer;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lco/getair/meerkat/dtos/Influencer;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lco/getair/meerkat/dtos/Influencer$Type;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lco/getair/meerkat/dtos/Influencer;->type:Lco/getair/meerkat/dtos/Influencer$Type;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lco/getair/meerkat/dtos/Influencer;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public isMe()Z
    .locals 4

    .prologue
    .line 78
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v2

    const-string v3, "graphProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/GraphProxy;

    .line 79
    .local v0, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v1

    .line 80
    .local v1, "myUser":Lco/getair/meerkat/dtos/User;
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/User;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lco/getair/meerkat/dtos/Influencer;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method

.method public isRelevantForMe()Z
    .locals 4

    .prologue
    .line 84
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v2

    const-string v3, "graphProxy"

    invoke-virtual {v2, v3}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/GraphProxy;

    .line 85
    .local v0, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {p0}, Lco/getair/meerkat/dtos/Influencer;->getType()Lco/getair/meerkat/dtos/Influencer$Type;

    move-result-object v2

    sget-object v3, Lco/getair/meerkat/dtos/Influencer$Type;->InfluencerTypeFeatured:Lco/getair/meerkat/dtos/Influencer$Type;

    if-eq v2, v3, :cond_0

    invoke-virtual {p0}, Lco/getair/meerkat/dtos/Influencer;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lco/getair/meerkat/proxies/GraphProxy;->amIFollowingUser(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 86
    .local v1, "result":Z
    :goto_0
    return v1

    .line 85
    .end local v1    # "result":Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
