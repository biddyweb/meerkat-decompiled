.class public Lco/getair/meerkat/dtos/FollowUser;
.super Ljava/lang/Object;
.source "FollowUser.java"

# interfaces
.implements Lco/getair/meerkat/dtos/IUserToFollow;


# instance fields
.field displayName:Ljava/lang/String;

.field follow:Ljava/lang/String;

.field followers:Ljava/lang/String;

.field following:Ljava/lang/String;

.field id:Ljava/lang/String;

.field profile:Ljava/lang/String;

.field profileImage:Ljava/lang/String;

.field profileThumbImage:Ljava/lang/String;

.field report:Ljava/lang/String;

.field score:I

.field username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getFollow()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->follow:Ljava/lang/String;

    return-object v0
.end method

.method public getFollowUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->follow:Ljava/lang/String;

    return-object v0
.end method

.method public getFollowers()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->followers:Ljava/lang/String;

    return-object v0
.end method

.method public getFollowing()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->following:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getProfile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->profile:Ljava/lang/String;

    return-object v0
.end method

.method public getProfileImage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->profileImage:Ljava/lang/String;

    return-object v0
.end method

.method public getProfileThumbImage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->profileThumbImage:Ljava/lang/String;

    return-object v0
.end method

.method public getReport()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->report:Ljava/lang/String;

    return-object v0
.end method

.method public getScore()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lco/getair/meerkat/dtos/FollowUser;->score:I

    return v0
.end method

.method public getTwitterHandle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lco/getair/meerkat/dtos/FollowUser;->getUsername()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lco/getair/meerkat/dtos/FollowUser;->username:Ljava/lang/String;

    return-object v0
.end method
