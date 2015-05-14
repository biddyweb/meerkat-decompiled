.class public Lorg/puremvc/java/multicore/core/view/View;
.super Ljava/lang/Object;
.source "View.java"

# interfaces
.implements Lorg/puremvc/java/multicore/interfaces/IView;


# static fields
.field protected static instanceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/puremvc/java/multicore/core/view/View;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mediatorMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/puremvc/java/multicore/interfaces/IMediator;",
            ">;"
        }
    .end annotation
.end field

.field protected multitonKey:Ljava/lang/String;

.field private observerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/puremvc/java/multicore/interfaces/IObserver;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/puremvc/java/multicore/core/view/View;->instanceMap:Ljava/util/Map;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/puremvc/java/multicore/core/view/View;->multitonKey:Ljava/lang/String;

    .line 68
    sget-object v0, Lorg/puremvc/java/multicore/core/view/View;->instanceMap:Ljava/util/Map;

    iget-object v1, p0, Lorg/puremvc/java/multicore/core/view/View;->multitonKey:Ljava/lang/String;

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/puremvc/java/multicore/core/view/View;->mediatorMap:Ljava/util/HashMap;

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/puremvc/java/multicore/core/view/View;->observerMap:Ljava/util/HashMap;

    .line 71
    invoke-virtual {p0}, Lorg/puremvc/java/multicore/core/view/View;->initializeView()V

    .line 72
    return-void
.end method

.method public static declared-synchronized getInstance(Ljava/lang/String;)Lorg/puremvc/java/multicore/core/view/View;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 93
    const-class v1, Lorg/puremvc/java/multicore/core/view/View;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/puremvc/java/multicore/core/view/View;->instanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 94
    new-instance v0, Lorg/puremvc/java/multicore/core/view/View;

    invoke-direct {v0, p0}, Lorg/puremvc/java/multicore/core/view/View;-><init>(Ljava/lang/String;)V

    .line 96
    :cond_0
    sget-object v0, Lorg/puremvc/java/multicore/core/view/View;->instanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/puremvc/java/multicore/core/view/View;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 93
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized removeView(Ljava/lang/String;)V
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 286
    const-class v1, Lorg/puremvc/java/multicore/core/view/View;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/puremvc/java/multicore/core/view/View;->instanceMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 287
    monitor-exit v1

    return-void

    .line 286
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public clearView()V
    .locals 1

    .prologue
    .line 290
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/view/View;->mediatorMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 291
    return-void
.end method

.method public hasMediator(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mediatorName"    # Ljava/lang/String;

    .prologue
    .line 277
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/view/View;->mediatorMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected initializeView()V
    .locals 0

    .prologue
    .line 85
    return-void
.end method

.method public notifyObservers(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 6
    .param p1, "note"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 115
    iget-object v4, p0, Lorg/puremvc/java/multicore/core/view/View;->observerMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 116
    .local v3, "observers_ref":Ljava/util/List;, "Ljava/util/List<Lorg/puremvc/java/multicore/interfaces/IObserver;>;"
    if-eqz v3, :cond_0

    .line 120
    invoke-interface {v3}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    .line 123
    .local v2, "observers":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, v2

    if-ge v0, v4, :cond_0

    .line 124
    aget-object v1, v2, v0

    check-cast v1, Lorg/puremvc/java/multicore/interfaces/IObserver;

    .line 125
    .local v1, "observer":Lorg/puremvc/java/multicore/interfaces/IObserver;
    invoke-interface {v1, p1}, Lorg/puremvc/java/multicore/interfaces/IObserver;->notifyObserver(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 128
    .end local v0    # "i":I
    .end local v1    # "observer":Lorg/puremvc/java/multicore/interfaces/IObserver;
    .end local v2    # "observers":[Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method public registerMediator(Lorg/puremvc/java/multicore/interfaces/IMediator;)V
    .locals 6
    .param p1, "mediator"    # Lorg/puremvc/java/multicore/interfaces/IMediator;

    .prologue
    .line 178
    iget-object v4, p0, Lorg/puremvc/java/multicore/core/view/View;->mediatorMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/IMediator;->getMediatorName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 179
    iget-object v4, p0, Lorg/puremvc/java/multicore/core/view/View;->multitonKey:Ljava/lang/String;

    invoke-interface {p1, v4}, Lorg/puremvc/java/multicore/interfaces/IMediator;->initializeNotifier(Ljava/lang/String;)V

    .line 182
    iget-object v4, p0, Lorg/puremvc/java/multicore/core/view/View;->mediatorMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/IMediator;->getMediatorName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/IMediator;->listNotificationInterests()[Ljava/lang/String;

    move-result-object v2

    .line 186
    .local v2, "noteInterests":[Ljava/lang/String;
    array-length v4, v2

    if-eqz v4, :cond_0

    .line 189
    new-instance v0, Lorg/puremvc/java/multicore/core/view/View$1;

    invoke-direct {v0, p0, p1}, Lorg/puremvc/java/multicore/core/view/View$1;-><init>(Lorg/puremvc/java/multicore/core/view/View;Lorg/puremvc/java/multicore/interfaces/IMediator;)V

    .line 197
    .local v0, "function":Lorg/puremvc/java/multicore/interfaces/IFunction;
    new-instance v3, Lorg/puremvc/java/multicore/patterns/observer/Observer;

    invoke-direct {v3, v0, p1}, Lorg/puremvc/java/multicore/patterns/observer/Observer;-><init>(Lorg/puremvc/java/multicore/interfaces/IFunction;Ljava/lang/Object;)V

    .line 201
    .local v3, "observer":Lorg/puremvc/java/multicore/patterns/observer/Observer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v2

    if-ge v1, v4, :cond_0

    .line 202
    aget-object v4, v2, v1

    invoke-virtual {p0, v4, v3}, Lorg/puremvc/java/multicore/core/view/View;->registerObserver(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/IObserver;)V

    .line 201
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 207
    .end local v0    # "function":Lorg/puremvc/java/multicore/interfaces/IFunction;
    .end local v1    # "i":I
    .end local v3    # "observer":Lorg/puremvc/java/multicore/patterns/observer/Observer;
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/IMediator;->onRegister()V

    .line 209
    .end local v2    # "noteInterests":[Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public registerObserver(Ljava/lang/String;Lorg/puremvc/java/multicore/interfaces/IObserver;)V
    .locals 3
    .param p1, "notificationName"    # Ljava/lang/String;
    .param p2, "observer"    # Lorg/puremvc/java/multicore/interfaces/IObserver;

    .prologue
    .line 222
    iget-object v1, p0, Lorg/puremvc/java/multicore/core/view/View;->observerMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 223
    iget-object v1, p0, Lorg/puremvc/java/multicore/core/view/View;->observerMap:Ljava/util/HashMap;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    :cond_0
    iget-object v1, p0, Lorg/puremvc/java/multicore/core/view/View;->observerMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 226
    .local v0, "observers":Ljava/util/List;, "Ljava/util/List<Lorg/puremvc/java/multicore/interfaces/IObserver;>;"
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    return-void
.end method

.method public removeMediator(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IMediator;
    .locals 4
    .param p1, "mediatorName"    # Ljava/lang/String;

    .prologue
    .line 237
    iget-object v3, p0, Lorg/puremvc/java/multicore/core/view/View;->mediatorMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/puremvc/java/multicore/interfaces/IMediator;

    .line 239
    .local v2, "mediator":Lorg/puremvc/java/multicore/interfaces/IMediator;
    if-eqz v2, :cond_1

    .line 241
    invoke-interface {v2}, Lorg/puremvc/java/multicore/interfaces/IMediator;->listNotificationInterests()[Ljava/lang/String;

    move-result-object v1

    .line 242
    .local v1, "interests":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 245
    aget-object v3, v1, v0

    invoke-virtual {p0, v3, v2}, Lorg/puremvc/java/multicore/core/view/View;->removeObserver(Ljava/lang/String;Ljava/lang/Object;)V

    .line 242
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 249
    :cond_0
    iget-object v3, p0, Lorg/puremvc/java/multicore/core/view/View;->mediatorMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    invoke-interface {v2}, Lorg/puremvc/java/multicore/interfaces/IMediator;->onRemove()V

    .line 254
    .end local v0    # "i":I
    .end local v1    # "interests":[Ljava/lang/String;
    :cond_1
    return-object v2
.end method

.method public removeObserver(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .param p1, "notificationName"    # Ljava/lang/String;
    .param p2, "notifyContext"    # Ljava/lang/Object;

    .prologue
    .line 138
    iget-object v3, p0, Lorg/puremvc/java/multicore/core/view/View;->observerMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 140
    .local v2, "observers":Ljava/util/List;, "Ljava/util/List<Lorg/puremvc/java/multicore/interfaces/IObserver;>;"
    if-eqz v2, :cond_2

    .line 142
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 143
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/puremvc/java/multicore/patterns/observer/Observer;

    .line 144
    .local v1, "observer":Lorg/puremvc/java/multicore/patterns/observer/Observer;
    invoke-virtual {v1, p2}, Lorg/puremvc/java/multicore/patterns/observer/Observer;->compareNotifyContext(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 145
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 142
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 150
    .end local v1    # "observer":Lorg/puremvc/java/multicore/patterns/observer/Observer;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_2

    .line 151
    iget-object v3, p0, Lorg/puremvc/java/multicore/core/view/View;->observerMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method public retrieveMediator(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IMediator;
    .locals 1
    .param p1, "mediatorName"    # Ljava/lang/String;

    .prologue
    .line 267
    iget-object v0, p0, Lorg/puremvc/java/multicore/core/view/View;->mediatorMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/puremvc/java/multicore/interfaces/IMediator;

    return-object v0
.end method
