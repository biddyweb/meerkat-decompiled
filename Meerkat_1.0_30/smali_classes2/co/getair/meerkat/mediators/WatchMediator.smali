.class public Lco/getair/meerkat/mediators/WatchMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "WatchMediator.java"


# instance fields
.field private addCommentButton:Landroid/widget/ImageButton;

.field private addCommentContainer:Landroid/view/View;

.field private addCommentEditText:Landroid/widget/EditText;

.field private addCommentHandleTextView:Landroid/widget/TextView;

.field private addCommentSendButton:Landroid/widget/Button;

.field private broadcastDescriptionTextView:Landroid/widget/TextView;

.field private broadcastTrendingTextView:Landroid/view/View;

.field private broadcasterContainer:Landroid/view/View;

.field private broadcasterHandleTextView:Landroid/widget/TextView;

.field private broadcasterImage:Landroid/widget/ImageView;

.field private broadcasterLocationTextView:Landroid/widget/TextView;

.field private broadcasterNameTextView:Landroid/widget/TextView;

.field private context:Landroid/content/Context;

.field currentWatchers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lco/getair/meerkat/dtos/watch_broadcast/Watcher;",
            ">;"
        }
    .end annotation
.end field

.field private homeButton:Landroid/widget/ImageButton;

.field private interactionsContainer:Landroid/view/View;

.field private likeButton:Landroid/widget/ImageButton;

.field private optOutTweetsButton:Landroid/widget/ToggleButton;

.field private reportButton:Landroid/widget/ImageButton;

.field private restreamButton:Landroid/widget/ImageButton;

.field private rootView:Landroid/view/View;

.field private saySomethingNiceButton:Landroid/widget/ImageButton;

.field private streamEndedHomeButton:Landroid/widget/ImageButton;

.field private streamEndedOverylay:Landroid/view/View;

.field private streamEndedWatchedTextView:Landroid/widget/TextView;

.field private videoPlayerView:Lco/getair/meerkat/video/VideoPlayerView;

.field private watcherCountTextView:Landroid/widget/TextView;

.field private watchersList:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 101
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    .line 105
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->context:Landroid/content/Context;

    .line 107
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00c1

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/VideoPlayerView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->videoPlayerView:Lco/getair/meerkat/video/VideoPlayerView;

    .line 109
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00cf

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->interactionsContainer:Landroid/view/View;

    .line 110
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d1

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->homeButton:Landroid/widget/ImageButton;

    .line 111
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d2

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->likeButton:Landroid/widget/ImageButton;

    .line 112
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d3

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->restreamButton:Landroid/widget/ImageButton;

    .line 113
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d0

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentButton:Landroid/widget/ImageButton;

    .line 115
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e0080

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentContainer:Landroid/view/View;

    .line 116
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d4

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentHandleTextView:Landroid/widget/TextView;

    .line 117
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d5

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentEditText:Landroid/widget/EditText;

    .line 118
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d6

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentSendButton:Landroid/widget/Button;

    .line 119
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e0081

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ToggleButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->optOutTweetsButton:Landroid/widget/ToggleButton;

    .line 120
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->optOutTweetsButton:Landroid/widget/ToggleButton;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 122
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d7

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->streamEndedOverylay:Landroid/view/View;

    .line 123
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00d9

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->streamEndedWatchedTextView:Landroid/widget/TextView;

    .line 124
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00da

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->saySomethingNiceButton:Landroid/widget/ImageButton;

    .line 125
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00db

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->streamEndedHomeButton:Landroid/widget/ImageButton;

    .line 127
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00c4

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterContainer:Landroid/view/View;

    .line 128
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00c5

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/makeramen/roundedimageview/RoundedImageView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterImage:Landroid/widget/ImageView;

    .line 129
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00c6

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterNameTextView:Landroid/widget/TextView;

    .line 130
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00c7

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterHandleTextView:Landroid/widget/TextView;

    .line 131
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00c9

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    .line 132
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00ca

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcastDescriptionTextView:Landroid/widget/TextView;

    .line 134
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00cd

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->watchersList:Landroid/widget/LinearLayout;

    .line 135
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00cb

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->watcherCountTextView:Landroid/widget/TextView;

    .line 137
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00ce

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcastTrendingTextView:Landroid/view/View;

    .line 139
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00c8

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->reportButton:Landroid/widget/ImageButton;

    .line 141
    new-instance v1, Lco/getair/meerkat/proxies/GraphProxy;

    const-string v2, "graphProxy"

    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lco/getair/meerkat/proxies/GraphProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v1}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v0

    .line 142
    .local v0, "user":Lco/getair/meerkat/dtos/User;
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentHandleTextView:Landroid/widget/TextView;

    const-string v2, "@%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->homeButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$1;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->likeButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$2;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$2;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 158
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->restreamButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$3;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$3;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$4;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$4;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 172
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentSendButton:Landroid/widget/Button;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$5;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$5;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 179
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentEditText:Landroid/widget/EditText;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$6;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$6;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 187
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentEditText:Landroid/widget/EditText;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$7;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$7;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 202
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->saySomethingNiceButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$8;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$8;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->streamEndedHomeButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$9;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$9;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->reportButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$10;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$10;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->optOutTweetsButton:Landroid/widget/ToggleButton;

    new-instance v2, Lco/getair/meerkat/mediators/WatchMediator$11;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/WatchMediator$11;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 234
    invoke-virtual {p0, v5}, Lco/getair/meerkat/mediators/WatchMediator;->setBroadcastInfoVisibility(Z)V

    .line 235
    invoke-virtual {p0, v5}, Lco/getair/meerkat/mediators/WatchMediator;->setCommentsVisibility(Z)V

    .line 236
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/WatchMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/WatchMediator;

    .prologue
    .line 57
    invoke-direct {p0}, Lco/getair/meerkat/mediators/WatchMediator;->finishWatchingStream()V

    return-void
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/WatchMediator;)Lco/getair/meerkat/facades/WatchActivityFacade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/WatchMediator;

    .prologue
    .line 57
    invoke-direct {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getWatchActivityFacade()Lco/getair/meerkat/facades/WatchActivityFacade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/WatchMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/WatchMediator;

    .prologue
    .line 57
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/WatchMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/WatchMediator;

    .prologue
    .line 57
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method private finishWatchingStream()V
    .locals 2

    .prologue
    .line 490
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/WatchActivityFacade;

    .line 491
    .local v0, "watchActivityFacade":Lco/getair/meerkat/facades/WatchActivityFacade;
    invoke-virtual {v0}, Lco/getair/meerkat/facades/WatchActivityFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 492
    return-void
.end method

.method private getWatchActivityFacade()Lco/getair/meerkat/facades/WatchActivityFacade;
    .locals 2

    .prologue
    .line 239
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 241
    .local v0, "ownerActivity":Landroid/app/Activity;
    invoke-static {v0}, Lco/getair/meerkat/facades/WatchActivityFacade;->getInst(Landroid/app/Activity;)Lco/getair/meerkat/facades/WatchActivityFacade;

    move-result-object v1

    return-object v1
.end method

.method private showToastError(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 365
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 366
    .local v0, "activity":Landroid/app/Activity;
    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 367
    return-void
.end method

.method private updateWatchersCount(II)V
    .locals 6
    .param p1, "currentNumberOfWatchers"    # I
    .param p2, "totalNumberOfWatchers"    # I

    .prologue
    .line 565
    iget-object v2, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 566
    .local v0, "res":Landroid/content/res/Resources;
    const v2, 0x7f090095

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 567
    .local v1, "watchersLabeltext":Ljava/lang/String;
    iget-object v2, p0, Lco/getair/meerkat/mediators/WatchMediator;->watcherCountTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 568
    return-void
.end method

.method private updateWatchersList(Ljava/util/ArrayList;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/getair/meerkat/dtos/watch_broadcast/Watcher;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 496
    .local p1, "newWatchersList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/WatchMediator;->currentWatchers:Ljava/util/HashMap;

    if-nez v11, :cond_0

    .line 498
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lco/getair/meerkat/mediators/WatchMediator;->currentWatchers:Ljava/util/HashMap;

    .line 501
    :cond_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/WatchMediator;->currentWatchers:Ljava/util/HashMap;

    invoke-virtual {v11}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;>;"
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 502
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 503
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 504
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 508
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_3
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;

    .line 510
    .local v8, "watcher":Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/mediators/WatchMediator;->currentWatchers:Ljava/util/HashMap;

    iget-object v13, v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->id:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_3

    .line 511
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/mediators/WatchMediator;->currentWatchers:Ljava/util/HashMap;

    iget-object v13, v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->id:Ljava/lang/String;

    invoke-virtual {v12, v13, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 515
    .end local v8    # "watcher":Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
    :cond_4
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/WatchMediator;->watchersList:Landroid/widget/LinearLayout;

    invoke-virtual {v11}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 517
    new-instance v1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    .line 518
    .local v1, "builder":Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 519
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 520
    invoke-static {}, Lco/getair/meerkat/proxies/ResourcesProxy;->getInstance()Lco/getair/meerkat/proxies/ResourcesProxy;

    move-result-object v11

    invoke-virtual {v11}, Lco/getair/meerkat/proxies/ResourcesProxy;->getUserPhotoPlaceholder()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageForEmptyUri(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 521
    invoke-static {}, Lco/getair/meerkat/proxies/ResourcesProxy;->getInstance()Lco/getair/meerkat/proxies/ResourcesProxy;

    move-result-object v11

    invoke-virtual {v11}, Lco/getair/meerkat/proxies/ResourcesProxy;->getUserPhotoPlaceholder()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 522
    invoke-static {}, Lco/getair/meerkat/proxies/ResourcesProxy;->getInstance()Lco/getair/meerkat/proxies/ResourcesProxy;

    move-result-object v11

    invoke-virtual {v11}, Lco/getair/meerkat/proxies/ResourcesProxy;->getUserPhotoPlaceholder()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 523
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v6

    .line 526
    .local v6, "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/WatchMediator;->currentWatchers:Ljava/util/HashMap;

    invoke-virtual {v11}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_5
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 528
    .local v9, "watcherId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/WatchMediator;->currentWatchers:Ljava/util/HashMap;

    invoke-virtual {v11, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;

    .line 530
    .restart local v8    # "watcher":Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/mediators/WatchMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v11

    check-cast v11, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v11}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v7

    .line 531
    .local v7, "ownerActivity":Landroid/app/Activity;
    new-instance v10, Lcom/makeramen/roundedimageview/RoundedImageView;

    invoke-direct {v10, v7}, Lcom/makeramen/roundedimageview/RoundedImageView;-><init>(Landroid/content/Context;)V

    .line 533
    .local v10, "watcherView":Lcom/makeramen/roundedimageview/RoundedImageView;
    new-instance v5, Landroid/util/DisplayMetrics;

    invoke-direct {v5}, Landroid/util/DisplayMetrics;-><init>()V

    .line 534
    .local v5, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v7}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v11

    invoke-interface {v11}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v11

    invoke-virtual {v11, v5}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 536
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v11, 0x42200000    # 40.0f

    iget v13, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v11, v13

    float-to-int v11, v11

    const/high16 v13, 0x42200000    # 40.0f

    iget v14, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v13, v14

    float-to-int v13, v13

    invoke-direct {v4, v11, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 537
    .local v4, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v11, 0x5

    const/4 v13, 0x0

    const/4 v14, 0x5

    const/4 v15, 0x0

    invoke-virtual {v4, v11, v13, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 538
    invoke-virtual {v10, v4}, Lcom/makeramen/roundedimageview/RoundedImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 540
    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Lcom/makeramen/roundedimageview/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 541
    const/high16 v11, 0x42b40000    # 90.0f

    invoke-virtual {v10, v11}, Lcom/makeramen/roundedimageview/RoundedImageView;->setCornerRadius(F)V

    .line 543
    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/makeramen/roundedimageview/RoundedImageView;->setClickable(Z)V

    .line 544
    invoke-virtual {v10, v8}, Lcom/makeramen/roundedimageview/RoundedImageView;->setTag(Ljava/lang/Object;)V

    .line 554
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/WatchMediator;->watchersList:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 556
    iget-object v11, v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->profileThumbImage:Ljava/lang/String;

    if-eqz v11, :cond_5

    .line 558
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v11

    iget-object v13, v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->profileThumbImage:Ljava/lang/String;

    invoke-virtual {v11, v13, v10, v6}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    goto :goto_2

    .line 562
    .end local v4    # "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v5    # "metrics":Landroid/util/DisplayMetrics;
    .end local v7    # "ownerActivity":Landroid/app/Activity;
    .end local v8    # "watcher":Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
    .end local v9    # "watcherId":Ljava/lang/String;
    .end local v10    # "watcherView":Lcom/makeramen/roundedimageview/RoundedImageView;
    :cond_6
    return-void
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 11
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v8, 0x1

    const/4 v10, 0x0

    .line 268
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventPlaylistArrived"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 269
    iget-object v6, p0, Lco/getair/meerkat/mediators/WatchMediator;->videoPlayerView:Lco/getair/meerkat/video/VideoPlayerView;

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v6, v5}, Lco/getair/meerkat/video/VideoPlayerView;->watchStream(Ljava/lang/String;)V

    .line 272
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventBroadcastInfoArrived"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 273
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    invoke-virtual {p0, v5}, Lco/getair/meerkat/mediators/WatchMediator;->refreshBroadcastInfo(Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;)V

    .line 276
    :cond_1
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventStreamHasEnded"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 277
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->interactionsContainer:Landroid/view/View;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 278
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->streamEndedOverylay:Landroid/view/View;

    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    .line 280
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->videoPlayerView:Lco/getair/meerkat/video/VideoPlayerView;

    invoke-virtual {v5}, Lco/getair/meerkat/video/VideoPlayerView;->stopProgressBar()V

    .line 285
    :cond_2
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventEndWatchSaySomethingNiceButtonClicked"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 287
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    .line 289
    .local v1, "broadcastSummary":Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    new-instance v2, Landroid/widget/EditText;

    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->context:Landroid/content/Context;

    invoke-direct {v2, v5}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 290
    .local v2, "input":Landroid/widget/EditText;
    invoke-virtual {v2, v8}, Landroid/widget/EditText;->setInputType(I)V

    .line 292
    new-instance v5, Landroid/app/AlertDialog$Builder;

    iget-object v6, p0, Lco/getair/meerkat/mediators/WatchMediator;->context:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v6, p0, Lco/getair/meerkat/mediators/WatchMediator;->context:Landroid/content/Context;

    const v7, 0x7f090016

    new-array v8, v8, [Ljava/lang/Object;

    .line 293
    invoke-virtual {v1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getTwitterHandle()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 294
    invoke-virtual {v5, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f0900c7

    new-instance v7, Lco/getair/meerkat/mediators/WatchMediator$13;

    invoke-direct {v7, p0, v1, v2}, Lco/getair/meerkat/mediators/WatchMediator$13;-><init>(Lco/getair/meerkat/mediators/WatchMediator;Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;Landroid/widget/EditText;)V

    .line 295
    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f090022

    new-instance v7, Lco/getair/meerkat/mediators/WatchMediator$12;

    invoke-direct {v7, p0}, Lco/getair/meerkat/mediators/WatchMediator$12;-><init>(Lco/getair/meerkat/mediators/WatchMediator;)V

    .line 311
    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 317
    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 319
    .local v0, "alarmDialog":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 323
    .end local v0    # "alarmDialog":Landroid/app/AlertDialog;
    .end local v1    # "broadcastSummary":Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;
    .end local v2    # "input":Landroid/widget/EditText;
    :cond_3
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventStreamRestreamed"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 324
    invoke-virtual {p0, v10}, Lco/getair/meerkat/mediators/WatchMediator;->setRestreamVisibility(Z)V

    .line 327
    :cond_4
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventStreamRestreamError"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 328
    const-string v5, "Error restreaming - Please try again"

    invoke-direct {p0, v5}, Lco/getair/meerkat/mediators/WatchMediator;->showToastError(Ljava/lang/String;)V

    .line 331
    :cond_5
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventStreamLiked"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 332
    invoke-virtual {p0, v10}, Lco/getair/meerkat/mediators/WatchMediator;->setLikeVisibility(Z)V

    .line 335
    :cond_6
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventStreamLikeError"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 336
    const-string v5, "Error liking stream - Please try again"

    invoke-direct {p0, v5}, Lco/getair/meerkat/mediators/WatchMediator;->showToastError(Ljava/lang/String;)V

    .line 339
    :cond_7
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventCommentAdded"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 343
    :cond_8
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventStreamWatchersReceived"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 344
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 345
    .local v3, "watchers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    invoke-direct {p0, v3}, Lco/getair/meerkat/mediators/WatchMediator;->updateWatchersList(Ljava/util/ArrayList;)V

    .line 348
    .end local v3    # "watchers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    :cond_9
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventCommentAddedError"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 349
    const-string v5, "Error adding stream - Please try again"

    invoke-direct {p0, v5}, Lco/getair/meerkat/mediators/WatchMediator;->showToastError(Ljava/lang/String;)V

    .line 352
    :cond_a
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventStreamWatchersCountUpdated"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 353
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;

    .line 354
    .local v4, "watchersCountParams":Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
    invoke-virtual {v4}, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;->getCurrentWatchersCount()I

    move-result v5

    invoke-virtual {v4}, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;->getTotalWatchersCount()I

    move-result v6

    invoke-direct {p0, v5, v6}, Lco/getair/meerkat/mediators/WatchMediator;->updateWatchersCount(II)V

    .line 357
    .end local v4    # "watchersCountParams":Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
    :cond_b
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "eventDismissWatchScreen"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 358
    invoke-direct {p0}, Lco/getair/meerkat/mediators/WatchMediator;->finishWatchingStream()V

    .line 360
    :cond_c
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 246
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventPlaylistArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventBroadcastInfoArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "eventStreamHasEnded"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "eventLikeGotClicked"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "eventStreamRestreamed"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "eventStreamRestreamError"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "eventStreamLiked"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "eventStreamLikeError"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "eventCommentAdded"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "eventCommentAddedError"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "eventStreamWatchersReceived"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "eventStreamWatchersCountUpdated"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "eventEndWatchSaySomethingNiceButtonClicked"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "eventDismissWatchScreen"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRemove()V
    .locals 2

    .prologue
    .line 574
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->videoPlayerView:Lco/getair/meerkat/video/VideoPlayerView;

    invoke-virtual {v1}, Lco/getair/meerkat/video/VideoPlayerView;->cleanVideoView()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 580
    :goto_0
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRemove()V

    .line 581
    return-void

    .line 576
    :catch_0
    move-exception v0

    .line 577
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public refreshBroadcastInfo(Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;)V
    .locals 11
    .param p1, "broadcastSummary"    # Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 372
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getLocation()Ljava/lang/String;

    move-result-object v0

    .line 373
    .local v0, "broadcastLocation":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 375
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getLocation()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 380
    :goto_0
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getCaption()Ljava/lang/String;

    move-result-object v2

    .line 381
    .local v2, "caption":Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 382
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcastDescriptionTextView:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 387
    :goto_1
    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v1

    .line 388
    .local v1, "broadcaster":Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterNameTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getDisplayName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterHandleTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getTwitterHandle()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 391
    new-instance v5, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    .line 392
    invoke-virtual {v5, v6}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v5

    .line 393
    invoke-virtual {v5, v6}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v5

    .line 394
    invoke-virtual {v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v3

    .line 396
    .local v3, "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v5

    invoke-virtual {v1}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getImageUrl()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterImage:Landroid/widget/ImageView;

    invoke-virtual {v5, v9, v10, v3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 398
    invoke-direct {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getWatchActivityFacade()Lco/getair/meerkat/facades/WatchActivityFacade;

    move-result-object v5

    const-string v9, "watchProxy"

    invoke-virtual {v5, v9}, Lco/getair/meerkat/facades/WatchActivityFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/proxies/WatchProxy;

    .line 400
    .local v4, "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    invoke-virtual {v4}, Lco/getair/meerkat/proxies/WatchProxy;->didLikeStream()Z

    move-result v5

    if-nez v5, :cond_2

    move v5, v6

    :goto_2
    invoke-virtual {p0, v5}, Lco/getair/meerkat/mediators/WatchMediator;->setLikeVisibility(Z)V

    .line 401
    invoke-virtual {v4}, Lco/getair/meerkat/proxies/WatchProxy;->didRestream()Z

    move-result v5

    if-nez v5, :cond_3

    move v5, v6

    :goto_3
    invoke-virtual {p0, v5}, Lco/getair/meerkat/mediators/WatchMediator;->setRestreamVisibility(Z)V

    .line 403
    invoke-virtual {p0, v6}, Lco/getair/meerkat/mediators/WatchMediator;->setBroadcastInfoVisibility(Z)V

    .line 405
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcastTrendingTextView:Landroid/view/View;

    invoke-virtual {p1}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->isTrending()Z

    move-result v6

    if-eqz v6, :cond_4

    :goto_4
    invoke-virtual {v5, v7}, Landroid/view/View;->setVisibility(I)V

    .line 408
    return-void

    .line 377
    .end local v1    # "broadcaster":Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;
    .end local v2    # "caption":Ljava/lang/String;
    .end local v3    # "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .end local v4    # "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    :cond_0
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 384
    .restart local v2    # "caption":Ljava/lang/String;
    :cond_1
    iget-object v5, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcastDescriptionTextView:Landroid/widget/TextView;

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .restart local v1    # "broadcaster":Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;
    .restart local v3    # "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .restart local v4    # "watchProxy":Lco/getair/meerkat/proxies/WatchProxy;
    :cond_2
    move v5, v7

    .line 400
    goto :goto_2

    :cond_3
    move v5, v7

    .line 401
    goto :goto_3

    :cond_4
    move v7, v8

    .line 405
    goto :goto_4
.end method

.method public sendComment()V
    .locals 5

    .prologue
    .line 472
    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 473
    .local v0, "commentText":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 475
    const-string v3, "eventAddComment"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v0, v4}, Lco/getair/meerkat/mediators/WatchMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 477
    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentEditText:Landroid/widget/EditText;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 478
    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->clearFocus()V

    .line 480
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    .line 482
    .local v2, "watchActivity":Landroid/app/Activity;
    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 483
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator;->rootView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 485
    .end local v1    # "imm":Landroid/view/inputmethod/InputMethodManager;
    .end local v2    # "watchActivity":Landroid/app/Activity;
    :cond_0
    return-void
.end method

.method public setBroadcastInfoVisibility(Z)V
    .locals 3
    .param p1, "visible"    # Z

    .prologue
    .line 414
    if-eqz p1, :cond_1

    .line 416
    const/4 v0, 0x0

    .line 421
    .local v0, "visibility":I
    :goto_0
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterContainer:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 422
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcastDescriptionTextView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 425
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    iget-object v2, p0, Lco/getair/meerkat/mediators/WatchMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v0, 0x8

    .end local v0    # "visibility":I
    :cond_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 426
    return-void

    .line 418
    :cond_1
    const/16 v0, 0x8

    .restart local v0    # "visibility":I
    goto :goto_0
.end method

.method public setCommentsVisibility(Z)V
    .locals 4
    .param p1, "visible"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v3, 0x0

    .line 454
    if-eqz p1, :cond_1

    .line 456
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 457
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->interactionsContainer:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 459
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 461
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/WatchMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 462
    .local v0, "keyboard":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 468
    .end local v0    # "keyboard":Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    :goto_0
    return-void

    .line 465
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->addCommentContainer:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 466
    iget-object v1, p0, Lco/getair/meerkat/mediators/WatchMediator;->interactionsContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public setLikeVisibility(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 443
    if-eqz p1, :cond_0

    .line 445
    iget-object v0, p0, Lco/getair/meerkat/mediators/WatchMediator;->likeButton:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 450
    :goto_0
    return-void

    .line 448
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/WatchMediator;->likeButton:Landroid/widget/ImageButton;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_0
.end method

.method public setRestreamVisibility(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 431
    if-eqz p1, :cond_0

    .line 433
    iget-object v0, p0, Lco/getair/meerkat/mediators/WatchMediator;->restreamButton:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 439
    :goto_0
    return-void

    .line 436
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/WatchMediator;->restreamButton:Landroid/widget/ImageButton;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_0
.end method
