.class Lcom/mixpanel/android/mpmetrics/DecideMessages;
.super Ljava/lang/Object;
.source "DecideMessages.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.DecideUpdates"


# instance fields
.field private mDistinctId:Ljava/lang/String;

.field private final mListener:Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;

.field private final mNotificationIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mSurveyIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mToken:Ljava/lang/String;

.field private final mUnseenNotifications:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/mpmetrics/InAppNotification;",
            ">;"
        }
    .end annotation
.end field

.field private final mUnseenSurveys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/mpmetrics/Survey;",
            ">;"
        }
    .end annotation
.end field

.field private final mUpdatesFromMixpanel:Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;)V
    .locals 1
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;
    .param p3, "updatesFromMixpanel"    # Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mToken:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mListener:Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;

    .line 24
    iput-object p3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUpdatesFromMixpanel:Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mDistinctId:Ljava/lang/String;

    .line 27
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    .line 28
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    .line 29
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mSurveyIds:Ljava/util/Set;

    .line 30
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mNotificationIds:Ljava/util/Set;

    .line 31
    return-void
.end method


# virtual methods
.method public declared-synchronized getDistinctId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mDistinctId:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getNotification(IZ)Lcom/mixpanel/android/mpmetrics/InAppNotification;
    .locals 4
    .param p1, "id"    # I
    .param p2, "replace"    # Z

    .prologue
    .line 125
    monitor-enter p0

    const/4 v2, 0x0

    .line 126
    .local v2, "notif":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 127
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mixpanel/android/mpmetrics/InAppNotification;

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getId()I

    move-result v3

    if-ne v3, p1, :cond_1

    .line 128
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/mixpanel/android/mpmetrics/InAppNotification;

    move-object v2, v0

    .line 129
    if-nez p2, :cond_0

    .line 130
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    :cond_0
    monitor-exit p0

    return-object v2

    .line 126
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 125
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getNotification(Z)Lcom/mixpanel/android/mpmetrics/InAppNotification;
    .locals 4
    .param p1, "replace"    # Z

    .prologue
    .line 107
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 108
    sget-boolean v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v1, :cond_0

    .line 109
    const-string v1, "MixpanelAPI.DecideUpdates"

    const-string v2, "No unseen notifications exist, none will be returned."

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    :cond_0
    const/4 v0, 0x0

    .line 121
    :cond_1
    :goto_0
    monitor-exit p0

    return-object v0

    .line 113
    :cond_2
    :try_start_1
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mixpanel/android/mpmetrics/InAppNotification;

    .line 114
    .local v0, "n":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    if-eqz p1, :cond_3

    .line 115
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 107
    .end local v0    # "n":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 117
    .restart local v0    # "n":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    :cond_3
    :try_start_2
    sget-boolean v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v1, :cond_1

    .line 118
    const-string v1, "MixpanelAPI.DecideUpdates"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Recording notification "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " as seen."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized getSurvey(IZ)Lcom/mixpanel/android/mpmetrics/Survey;
    .locals 4
    .param p1, "id"    # I
    .param p2, "replace"    # Z

    .prologue
    .line 93
    monitor-enter p0

    const/4 v2, 0x0

    .line 94
    .local v2, "survey":Lcom/mixpanel/android/mpmetrics/Survey;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 95
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mixpanel/android/mpmetrics/Survey;

    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/Survey;->getId()I

    move-result v3

    if-ne v3, p1, :cond_1

    .line 96
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/mixpanel/android/mpmetrics/Survey;

    move-object v2, v0

    .line 97
    if-nez p2, :cond_0

    .line 98
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    :cond_0
    monitor-exit p0

    return-object v2

    .line 94
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getSurvey(Z)Lcom/mixpanel/android/mpmetrics/Survey;
    .locals 3
    .param p1, "replace"    # Z

    .prologue
    .line 82
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_1

    .line 83
    const/4 v0, 0x0

    .line 89
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    .line 85
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mixpanel/android/mpmetrics/Survey;

    .line 86
    .local v0, "s":Lcom/mixpanel/android/mpmetrics/Survey;
    if-eqz p1, :cond_0

    .line 87
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 82
    .end local v0    # "s":Lcom/mixpanel/android/mpmetrics/Survey;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mToken:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized hasUpdatesAvailable()Z
    .locals 1

    .prologue
    .line 139
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reportResults(Ljava/util/List;Ljava/util/List;Lorg/json/JSONArray;)V
    .locals 7
    .param p3, "eventBindings"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/mpmetrics/Survey;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/mpmetrics/InAppNotification;",
            ">;",
            "Lorg/json/JSONArray;",
            ")V"
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "newSurveys":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/mpmetrics/Survey;>;"
    .local p2, "newNotifications":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/mpmetrics/InAppNotification;>;"
    monitor-enter p0

    const/4 v2, 0x0

    .line 50
    .local v2, "newContent":Z
    :try_start_0
    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUpdatesFromMixpanel:Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    invoke-interface {v4, p3}, Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;->setEventBindings(Lorg/json/JSONArray;)V

    .line 52
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mixpanel/android/mpmetrics/Survey;

    .line 53
    .local v3, "s":Lcom/mixpanel/android/mpmetrics/Survey;
    invoke-virtual {v3}, Lcom/mixpanel/android/mpmetrics/Survey;->getId()I

    move-result v0

    .line 54
    .local v0, "id":I
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mSurveyIds:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 55
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mSurveyIds:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    const/4 v2, 0x1

    goto :goto_0

    .line 61
    .end local v0    # "id":I
    .end local v3    # "s":Lcom/mixpanel/android/mpmetrics/Survey;
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mixpanel/android/mpmetrics/InAppNotification;

    .line 62
    .local v1, "n":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/InAppNotification;->getId()I

    move-result v0

    .line 63
    .restart local v0    # "id":I
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mNotificationIds:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 64
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mNotificationIds:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 65
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    const/4 v2, 0x1

    goto :goto_1

    .line 70
    .end local v0    # "id":I
    .end local v1    # "n":Lcom/mixpanel/android/mpmetrics/InAppNotification;
    :cond_3
    sget-boolean v4, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v4, :cond_4

    .line 71
    const-string v4, "MixpanelAPI.DecideUpdates"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "New Decide content has become available. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 72
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " surveys and "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 73
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " notifications have been added."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 71
    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    :cond_4
    if-eqz v2, :cond_5

    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->hasUpdatesAvailable()Z

    move-result v4

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mListener:Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;

    if-eqz v4, :cond_5

    .line 77
    iget-object v4, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mListener:Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;

    invoke-interface {v4}, Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;->onNewResults()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    :cond_5
    monitor-exit p0

    return-void

    .line 49
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized setDistinctId(Ljava/lang/String;)V
    .locals 1
    .param p1, "distinctId"    # Ljava/lang/String;

    .prologue
    .line 38
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenSurveys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 39
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mUnseenNotifications:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 40
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/DecideMessages;->mDistinctId:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    monitor-exit p0

    return-void

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
