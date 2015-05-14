.class public Lco/getair/meerkat/views/NavigationBar;
.super Landroid/widget/FrameLayout;
.source "NavigationBar.java"


# instance fields
.field private backButton:Landroid/widget/ImageButton;

.field private facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;

.field private leaderBoardButton:Landroid/widget/ImageButton;

.field private logoImageView:Landroid/widget/ImageView;

.field private profileInfoView:Landroid/widget/LinearLayout;

.field private scoreTextView:Landroid/widget/TextView;

.field private searchButton:Landroid/widget/ImageButton;

.field private titleTextView:Landroid/widget/TextView;

.field private usernameTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 45
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lco/getair/meerkat/views/NavigationBar;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/getair/meerkat/views/NavigationBar;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 54
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/views/NavigationBar;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/views/NavigationBar;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/views/NavigationBar;

    .prologue
    .line 32
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/views/NavigationBar;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/views/NavigationBar;

    .prologue
    .line 32
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->logoImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 60
    const-string v3, "layout_inflater"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 61
    .local v1, "layoutInflater":Landroid/view/LayoutInflater;
    const v3, 0x7f040041

    invoke-virtual {v1, v3, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 63
    const v3, 0x7f0e014b

    invoke-virtual {p0, v3}, Lco/getair/meerkat/views/NavigationBar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->profileInfoView:Landroid/widget/LinearLayout;

    .line 64
    const v3, 0x7f0e0150

    invoke-virtual {p0, v3}, Lco/getair/meerkat/views/NavigationBar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->logoImageView:Landroid/widget/ImageView;

    .line 65
    const v3, 0x7f0e014a

    invoke-virtual {p0, v3}, Lco/getair/meerkat/views/NavigationBar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->titleTextView:Landroid/widget/TextView;

    .line 66
    const v3, 0x7f0e014c

    invoke-virtual {p0, v3}, Lco/getair/meerkat/views/NavigationBar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->usernameTextView:Landroid/widget/TextView;

    .line 67
    const v3, 0x7f0e014d

    invoke-virtual {p0, v3}, Lco/getair/meerkat/views/NavigationBar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->scoreTextView:Landroid/widget/TextView;

    .line 68
    const v3, 0x7f0e014f

    invoke-virtual {p0, v3}, Lco/getair/meerkat/views/NavigationBar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->leaderBoardButton:Landroid/widget/ImageButton;

    .line 69
    const v3, 0x7f0e014e

    invoke-virtual {p0, v3}, Lco/getair/meerkat/views/NavigationBar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->searchButton:Landroid/widget/ImageButton;

    .line 70
    const v3, 0x7f0e0149

    invoke-virtual {p0, v3}, Lco/getair/meerkat/views/NavigationBar;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->backButton:Landroid/widget/ImageButton;

    .line 72
    iget-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->backButton:Landroid/widget/ImageButton;

    new-instance v4, Lco/getair/meerkat/views/NavigationBar$1;

    invoke-direct {v4, p0}, Lco/getair/meerkat/views/NavigationBar$1;-><init>(Lco/getair/meerkat/views/NavigationBar;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    iget-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->profileInfoView:Landroid/widget/LinearLayout;

    new-instance v4, Lco/getair/meerkat/views/NavigationBar$2;

    invoke-direct {v4, p0}, Lco/getair/meerkat/views/NavigationBar$2;-><init>(Lco/getair/meerkat/views/NavigationBar;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    iget-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->leaderBoardButton:Landroid/widget/ImageButton;

    new-instance v4, Lco/getair/meerkat/views/NavigationBar$3;

    invoke-direct {v4, p0}, Lco/getair/meerkat/views/NavigationBar$3;-><init>(Lco/getair/meerkat/views/NavigationBar;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    iget-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->searchButton:Landroid/widget/ImageButton;

    new-instance v4, Lco/getair/meerkat/views/NavigationBar$4;

    invoke-direct {v4, p0}, Lco/getair/meerkat/views/NavigationBar$4;-><init>(Lco/getair/meerkat/views/NavigationBar;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    invoke-virtual {p0}, Lco/getair/meerkat/views/NavigationBar;->loadUsername()V

    .line 111
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v3

    const-string v4, "inboxProxy"

    invoke-virtual {v3, v4}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/InboxProxy;

    .line 112
    .local v0, "inboxProxy":Lco/getair/meerkat/proxies/InboxProxy;
    const/4 v2, 0x0

    .line 114
    .local v2, "score":I
    :try_start_0
    const-string v3, "score"

    invoke-virtual {v0, v3}, Lco/getair/meerkat/proxies/InboxProxy;->getBucket(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    const-string v4, "o"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :goto_0
    invoke-virtual {p0}, Lco/getair/meerkat/views/NavigationBar;->loadScore()V

    .line 121
    iget-object v3, p0, Lco/getair/meerkat/views/NavigationBar;->logoImageView:Landroid/widget/ImageView;

    new-instance v4, Lco/getair/meerkat/views/NavigationBar$5;

    invoke-direct {v4, p0}, Lco/getair/meerkat/views/NavigationBar$5;-><init>(Lco/getair/meerkat/views/NavigationBar;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    return-void

    .line 115
    :catch_0
    move-exception v3

    goto :goto_0
.end method


# virtual methods
.method public getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;

    return-object v0
.end method

.method public hideBackButton()V
    .locals 2

    .prologue
    .line 212
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->backButton:Landroid/widget/ImageButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 213
    return-void
.end method

.method public loadScore()V
    .locals 5

    .prologue
    .line 216
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->scoreTextView:Landroid/widget/TextView;

    const-string v1, "Score: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Lco/getair/meerkat/proxies/ScoreProxy;->getScore()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    return-void
.end method

.method public loadUsername()V
    .locals 6

    .prologue
    .line 220
    new-instance v1, Lco/getair/meerkat/proxies/GraphProxy;

    const-string v2, "graphProxy"

    invoke-virtual {p0}, Lco/getair/meerkat/views/NavigationBar;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lco/getair/meerkat/proxies/GraphProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v1}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v0

    .line 221
    .local v0, "user":Lco/getair/meerkat/dtos/User;
    iget-object v1, p0, Lco/getair/meerkat/views/NavigationBar;->usernameTextView:Landroid/widget/TextView;

    const-string v2, "@%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 223
    return-void
.end method

.method public setFacade(Lorg/puremvc/java/multicore/patterns/facade/Facade;)V
    .locals 0
    .param p1, "facade"    # Lorg/puremvc/java/multicore/patterns/facade/Facade;

    .prologue
    .line 137
    iput-object p1, p0, Lco/getair/meerkat/views/NavigationBar;->facade:Lorg/puremvc/java/multicore/patterns/facade/Facade;

    .line 138
    return-void
.end method

.method public setLeaderboardVisible(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "visible"    # Ljava/lang/Boolean;

    .prologue
    .line 169
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->leaderBoardButton:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 175
    :goto_0
    return-void

    .line 173
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->leaderBoardButton:Landroid/widget/ImageButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_0
.end method

.method public setLogoVisible(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "visible"    # Ljava/lang/Boolean;

    .prologue
    .line 159
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->logoImageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 165
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->logoImageView:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method public setProfileInfoVisible(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "visible"    # Ljava/lang/Boolean;

    .prologue
    .line 149
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->profileInfoView:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 155
    :goto_0
    return-void

    .line 153
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->profileInfoView:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method public setSearchVisible(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "visible"    # Ljava/lang/Boolean;

    .prologue
    .line 179
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->searchButton:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 185
    :goto_0
    return-void

    .line 183
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->searchButton:Landroid/widget/ImageButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_0
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x8

    .line 189
    if-nez p1, :cond_0

    .line 191
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 192
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->backButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 205
    :goto_0
    return-void

    .line 194
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 198
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->backButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 199
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 201
    :cond_1
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->backButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 202
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->titleTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method public showBackButton()V
    .locals 2

    .prologue
    .line 208
    iget-object v0, p0, Lco/getair/meerkat/views/NavigationBar;->backButton:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 209
    return-void
.end method
