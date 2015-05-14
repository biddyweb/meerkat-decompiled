.class public Lco/getair/meerkat/mediators/FeedMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "FeedMediator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    }
.end annotation


# static fields
.field private static final MEERKAT_HASHTAG:Ljava/lang/String; = "#meerkat"

.field private static final MEERKAT_HASHTAG_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final context:Landroid/content/Context;

.field private feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

.field private feedLiveListView:Landroid/widget/ListView;

.field private goLiveButton:Landroid/widget/Button;

.field private handler:Landroid/os/Handler;

.field private lastFocussedPosition:I

.field private liveCount:I

.field private navigationBar:Lco/getair/meerkat/views/NavigationBar;

.field private progressBar:Landroid/widget/ProgressBar;

.field private rootView:Landroid/view/View;

.field private scheduledCount:I

.field private searchingForUser:Z

.field private shouldFilterStreams:Z

.field private swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 78
    const-string v0, "(^|\\s)%s\\b"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "#meerkat"

    aput-object v3, v1, v2

    .line 79
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/mediators/FeedMediator;->MEERKAT_HASHTAG_PATTERN:Ljava/util/regex/Pattern;

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 108
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    iput v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I

    .line 93
    iput v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I

    .line 94
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->shouldFilterStreams:Z

    .line 95
    iput-boolean v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->searchingForUser:Z

    .line 97
    const/4 v0, -0x1

    iput v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->lastFocussedPosition:I

    .line 110
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->handler:Landroid/os/Handler;

    .line 112
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    .line 114
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    .line 116
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e0092

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/views/NavigationBar;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    .line 117
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v0}, Lco/getair/meerkat/views/NavigationBar;->loadScore()V

    .line 118
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v0}, Lco/getair/meerkat/views/NavigationBar;->loadUsername()V

    .line 120
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e0090

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->progressBar:Landroid/widget/ProgressBar;

    .line 122
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e0091

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->feedLiveListView:Landroid/widget/ListView;

    .line 123
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->feedLiveListView:Landroid/widget/ListView;

    new-instance v1, Lco/getair/meerkat/mediators/FeedMediator$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/FeedMediator$1;-><init>(Lco/getair/meerkat/mediators/FeedMediator;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 150
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e008b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->goLiveButton:Landroid/widget/Button;

    .line 151
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->goLiveButton:Landroid/widget/Button;

    new-instance v1, Lco/getair/meerkat/mediators/FeedMediator$2;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/FeedMediator$2;-><init>(Lco/getair/meerkat/mediators/FeedMediator;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e008d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    .line 159
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    new-instance v1, Lco/getair/meerkat/mediators/FeedMediator$3;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/FeedMediator$3;-><init>(Lco/getair/meerkat/mediators/FeedMediator;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroid/support/v4/widget/SwipeRefreshLayout$OnRefreshListener;)V

    .line 166
    new-instance v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;-><init>(Lco/getair/meerkat/mediators/FeedMediator;Landroid/content/Context;)V

    iput-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    .line 167
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->clear()V

    .line 169
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->feedLiveListView:Landroid/widget/ListView;

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 170
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/FeedMediator;)Landroid/widget/ListView;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->feedLiveListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/FeedMediator;Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/feed/BroadcastSummary;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator;->openWatchForFeed(Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V

    return-void
.end method

.method static synthetic access$1002(Lco/getair/meerkat/mediators/FeedMediator;Z)Z
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # Z

    .prologue
    .line 71
    iput-boolean p1, p0, Lco/getair/meerkat/mediators/FeedMediator;->searchingForUser:Z

    return p1
.end method

.method static synthetic access$1100(Lco/getair/meerkat/mediators/FeedMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/FeedMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Lco/getair/meerkat/mediators/FeedMediator;I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # I

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator;->getCountStringOrEmpty(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1400(Lco/getair/meerkat/mediators/FeedMediator;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator;->scheduleBroadcast(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1500(Lco/getair/meerkat/mediators/FeedMediator;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator;->startBroadcast(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/FeedMediator;Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/feed/BroadcastSummary;

    .prologue
    .line 71
    invoke-direct {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator;->openShareScheduledStream(Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/FeedMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator;->refreshFeed()V

    return-void
.end method

.method static synthetic access$400(Lco/getair/meerkat/mediators/FeedMediator;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$500(Lco/getair/meerkat/mediators/FeedMediator;)Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->feedAdapter:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    return-object v0
.end method

.method static synthetic access$600(Lco/getair/meerkat/mediators/FeedMediator;)I
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    iget v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I

    return v0
.end method

.method static synthetic access$602(Lco/getair/meerkat/mediators/FeedMediator;I)I
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # I

    .prologue
    .line 71
    iput p1, p0, Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I

    return p1
.end method

.method static synthetic access$608(Lco/getair/meerkat/mediators/FeedMediator;)I
    .locals 2
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    iget v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->liveCount:I

    return v0
.end method

.method static synthetic access$700(Lco/getair/meerkat/mediators/FeedMediator;)I
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    iget v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I

    return v0
.end method

.method static synthetic access$702(Lco/getair/meerkat/mediators/FeedMediator;I)I
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # I

    .prologue
    .line 71
    iput p1, p0, Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I

    return p1
.end method

.method static synthetic access$708(Lco/getair/meerkat/mediators/FeedMediator;)I
    .locals 2
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    iget v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->scheduledCount:I

    return v0
.end method

.method static synthetic access$800(Lco/getair/meerkat/mediators/FeedMediator;Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;II)I
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;
    .param p1, "x1"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    .param p2, "x2"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 71
    invoke-direct {p0, p1, p2, p3, p4}, Lco/getair/meerkat/mediators/FeedMediator;->binarySearch(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;II)I

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lco/getair/meerkat/mediators/FeedMediator;)Landroid/support/v4/widget/SwipeRefreshLayout;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 71
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    return-object v0
.end method

.method private binarySearch(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;II)I
    .locals 6
    .param p1, "item"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    .param p2, "arrayToFill"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;
    .param p3, "startIndex"    # I
    .param p4, "endIndex"    # I

    .prologue
    .line 362
    move v1, p3

    .line 363
    .local v1, "lo":I
    move v0, p4

    .line 365
    .local v0, "hi":I
    :goto_0
    if-gt v1, v0, :cond_1

    .line 366
    add-int v5, v1, v0

    div-int/lit8 v2, v5, 0x2

    .line 367
    .local v2, "mid":I
    invoke-virtual {p2, v2}, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getDataItem(I)Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    move-result-object v4

    .line 368
    .local v4, "value":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    invoke-virtual {v4, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->compareTo(Ljava/lang/Object;)I

    move-result v3

    .line 370
    .local v3, "result":I
    if-gez v3, :cond_0

    .line 371
    add-int/lit8 v1, v2, 0x1

    goto :goto_0

    .line 372
    :cond_0
    if-lez v3, :cond_2

    .line 373
    add-int/lit8 v0, v2, -0x1

    goto :goto_0

    .end local v2    # "mid":I
    .end local v3    # "result":I
    .end local v4    # "value":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;
    :cond_1
    move v2, v1

    .line 378
    :cond_2
    return v2
.end method

.method private buildShareText(Lco/getair/meerkat/dtos/feed/BroadcastSummary;)Ljava/lang/String;
    .locals 12
    .param p1, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/BroadcastSummary;

    .prologue
    .line 956
    new-instance v1, Ljava/util/Date;

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->getEndTime()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    mul-long/2addr v8, v10

    invoke-direct {v1, v8, v9}, Ljava/util/Date;-><init>(J)V

    .line 958
    .local v1, "broadcastStartDate":Ljava/util/Date;
    new-instance v7, Lorg/ocpsoft/prettytime/PrettyTime;

    invoke-direct {v7}, Lorg/ocpsoft/prettytime/PrettyTime;-><init>()V

    invoke-virtual {v7, v1}, Lorg/ocpsoft/prettytime/PrettyTime;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 960
    .local v3, "futureTimeString":Ljava/lang/String;
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->getCaption()Ljava/lang/String;

    move-result-object v0

    .line 963
    .local v0, "broadcastCaption":Ljava/lang/String;
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v7

    .line 964
    invoke-virtual {v7}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getUsername()Ljava/lang/String;

    move-result-object v6

    .line 967
    .local v6, "username":Ljava/lang/String;
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lco/getair/meerkat/utilities/MeerkatUrlBuilder;->scheduledBroadcast(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 970
    .local v2, "broadcastUrl":Landroid/net/Uri;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 971
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    .line 972
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 973
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    .line 974
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 977
    .local v5, "sb":Ljava/lang/StringBuilder;
    sget-object v7, Lco/getair/meerkat/mediators/FeedMediator;->MEERKAT_HASHTAG_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    .line 978
    .local v4, "hasMeerkatHashtag":Z
    if-nez v4, :cond_0

    .line 979
    const-string v7, "#meerkat"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 980
    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 983
    :cond_0
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 985
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method private getCountStringOrEmpty(I)Ljava/lang/String;
    .locals 1
    .param p1, "count"    # I

    .prologue
    .line 952
    if-lez p1, :cond_0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method private openShareScheduledStream(Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V
    .locals 4
    .param p1, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/BroadcastSummary;

    .prologue
    .line 388
    invoke-direct {p0, p1}, Lco/getair/meerkat/mediators/FeedMediator;->buildShareText(Lco/getair/meerkat/dtos/feed/BroadcastSummary;)Ljava/lang/String;

    move-result-object v0

    .line 390
    .local v0, "text":Ljava/lang/String;
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "android.intent.action.SEND"

    .line 391
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "text/plain"

    .line 392
    invoke-virtual {v2, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "android.intent.extra.TEXT"

    .line 393
    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 390
    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 394
    return-void
.end method

.method private openWatchForFeed(Lco/getair/meerkat/dtos/feed/BroadcastSummary;)V
    .locals 3
    .param p1, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/BroadcastSummary;

    .prologue
    .line 384
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/BroadcastSummary;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lco/getair/meerkat/activities/WatchActivity;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 385
    return-void
.end method

.method private refreshFeed()V
    .locals 4

    .prologue
    .line 173
    new-instance v0, Lco/getair/meerkat/commands/feed/GetLiveParams;

    iget-boolean v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->shouldFilterStreams:Z

    invoke-direct {v0, v1}, Lco/getair/meerkat/commands/feed/GetLiveParams;-><init>(Z)V

    .line 174
    .local v0, "getLiveParams":Lco/getair/meerkat/commands/feed/GetLiveParams;
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/FeedMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    const-string v2, "feedGetLive"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method private scheduleBroadcast(Ljava/lang/String;)V
    .locals 3
    .param p1, "broadcastName"    # Ljava/lang/String;

    .prologue
    .line 995
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    const-class v2, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 996
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "broadcastName"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 997
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 998
    return-void
.end method

.method private startBroadcast(Ljava/lang/String;)V
    .locals 4
    .param p1, "caption"    # Ljava/lang/String;

    .prologue
    .line 990
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/FeedMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    const-string v1, "commandGoLive"

    new-instance v2, Lco/getair/meerkat/dtos/GoLiveParams;

    invoke-direct {v2, p1}, Lco/getair/meerkat/dtos/GoLiveParams;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 991
    return-void
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 8
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const v7, 0x7f0900ac

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 208
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "feedGetLive"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 209
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v5}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 212
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "feedLiveArrived"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 214
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->handler:Landroid/os/Handler;

    new-instance v2, Lco/getair/meerkat/mediators/FeedMediator$4;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/FeedMediator$4;-><init>(Lco/getair/meerkat/mediators/FeedMediator;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 227
    :cond_1
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "feedScheduledArrived"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 230
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->handler:Landroid/os/Handler;

    new-instance v2, Lco/getair/meerkat/mediators/FeedMediator$5;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/FeedMediator$5;-><init>(Lco/getair/meerkat/mediators/FeedMediator;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 243
    :cond_2
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "feedLiveArrivedError"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 244
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->progressBar:Landroid/widget/ProgressBar;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 247
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->rootView:Landroid/view/View;

    const/high16 v2, -0x10000

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 250
    :cond_3
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "newStreamArrived"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 251
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->handler:Landroid/os/Handler;

    new-instance v2, Lco/getair/meerkat/mediators/FeedMediator$6;

    invoke-direct {v2, p0, p1}, Lco/getair/meerkat/mediators/FeedMediator$6;-><init>(Lco/getair/meerkat/mediators/FeedMediator;Lorg/puremvc/java/multicore/interfaces/INotification;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 276
    :cond_4
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "navigationBarProfileViewClicked"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 279
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    const-class v4, Lco/getair/meerkat/activities/ProfileActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 283
    :cond_5
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "navigationBarLeaderboardClicked"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 286
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    const-class v4, Lco/getair/meerkat/activities/UserListActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v3, "listSourceBundleKey"

    const-string v4, "leaderboard"

    .line 287
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "listTitleBundleKey"

    const-string v4, "Leaderboard"

    .line 288
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "listShowScoreBundleKey"

    .line 289
    invoke-virtual {v2, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    .line 286
    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 292
    :cond_6
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "navigationBarSearchClicked"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 294
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 295
    .local v0, "input":Landroid/widget/EditText;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Search for users to follow"

    .line 296
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 297
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Follow"

    new-instance v3, Lco/getair/meerkat/mediators/FeedMediator$8;

    invoke-direct {v3, p0, v0}, Lco/getair/meerkat/mediators/FeedMediator$8;-><init>(Lco/getair/meerkat/mediators/FeedMediator;Landroid/widget/EditText;)V

    .line 298
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f090022

    new-instance v3, Lco/getair/meerkat/mediators/FeedMediator$7;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/FeedMediator$7;-><init>(Lco/getair/meerkat/mediators/FeedMediator;)V

    .line 308
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 313
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 316
    .end local v0    # "input":Landroid/widget/EditText;
    :cond_7
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "eventUserNotFound"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    iget-boolean v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->searchingForUser:Z

    if-eqz v1, :cond_8

    .line 317
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/FeedMediator;->searchingForUser:Z

    .line 319
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "User not found"

    .line 320
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Try another name please"

    .line 321
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/mediators/FeedMediator$9;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/FeedMediator$9;-><init>(Lco/getair/meerkat/mediators/FeedMediator;)V

    .line 322
    invoke-virtual {v1, v7, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 326
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 329
    :cond_8
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "followSuccessfull"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    iget-boolean v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->searchingForUser:Z

    if-eqz v1, :cond_9

    .line 330
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/FeedMediator;->searchingForUser:Z

    .line 332
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Success!"

    .line 333
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/mediators/FeedMediator$10;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/FeedMediator$10;-><init>(Lco/getair/meerkat/mediators/FeedMediator;)V

    .line 334
    invoke-virtual {v1, v7, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 338
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 341
    :cond_9
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "scoreInboxItemsArrived"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 342
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v1}, Lco/getair/meerkat/views/NavigationBar;->loadScore()V

    .line 345
    :cond_a
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "eventFeedFilteringEnabled"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 346
    iput-boolean v6, p0, Lco/getair/meerkat/mediators/FeedMediator;->shouldFilterStreams:Z

    .line 347
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator;->refreshFeed()V

    .line 350
    :cond_b
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "eventFeedFilteringDisabled"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 351
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/FeedMediator;->shouldFilterStreams:Z

    .line 352
    invoke-direct {p0}, Lco/getair/meerkat/mediators/FeedMediator;->refreshFeed()V

    .line 355
    :cond_c
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "eventFeedResumed"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 356
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v1}, Lco/getair/meerkat/views/NavigationBar;->loadScore()V

    .line 357
    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v1}, Lco/getair/meerkat/views/NavigationBar;->loadUsername()V

    .line 359
    :cond_d
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 179
    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "feedGetLive"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "feedLiveArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "feedScheduledArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "feedLiveArrivedError"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "newStreamArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "navigationBarProfileViewClicked"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "navigationBarLeaderboardClicked"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "navigationBarSearchClicked"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "scheduledEventCommentPressed"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "followSuccessfull"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "eventUserNotFound"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "scoreInboxItemsArrived"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "eventFeedFilteringEnabled"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "eventFeedFilteringDisabled"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "eventFeedResumed"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRegister()V
    .locals 2

    .prologue
    .line 102
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRegister()V

    .line 104
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {p0}, Lco/getair/meerkat/mediators/FeedMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setFacade(Lorg/puremvc/java/multicore/patterns/facade/Facade;)V

    .line 105
    return-void
.end method
