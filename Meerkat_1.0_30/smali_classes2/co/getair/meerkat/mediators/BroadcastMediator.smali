.class public Lco/getair/meerkat/mediators/BroadcastMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "BroadcastMediator.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;,
        Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;
    }
.end annotation


# static fields
.field private static final COVER_IMAGE_CAPTURE_DELAY:I = 0xbb8

.field private static final NAME:Ljava/lang/String; = "BroadcastMediator"

.field private static final PIPE_BUFFER:I = 0x1e8480


# instance fields
.field private addCommentButton:Landroid/widget/ImageButton;

.field private addCommentContainer:Landroid/view/View;

.field private addCommentEditText:Landroid/widget/EditText;

.field private addCommentHandleTextView:Landroid/widget/TextView;

.field private addCommentSendButton:Landroid/widget/Button;

.field private broadcastCaptionTextView:Landroid/widget/TextView;

.field private broadcastEndedContainer:Landroid/view/View;

.field private broadcastEndedHomeButton:Landroid/widget/ImageButton;

.field private broadcastEndedWatchedCountTextView:Landroid/widget/TextView;

.field private broadcastTrendingTextView:Landroid/view/View;

.field private broadcasterContainer:Landroid/view/View;

.field private broadcasterHandleTextView:Landroid/widget/TextView;

.field private broadcasterImage:Landroid/widget/ImageView;

.field private broadcasterLocationTextView:Landroid/widget/TextView;

.field private broadcasterNameTextView:Landroid/widget/TextView;

.field chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

.field private context:Landroid/content/Context;

.field private currentBuilder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

.field private currentCameraDirection:I

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

.field private didEndBroadcasting:Z

.field private didSendCoverImage:Z

.field private flashlightSwitchButton:Landroid/widget/ImageButton;

.field private flipCameraButton:Landroid/widget/ImageButton;

.field private homeButton:Landroid/widget/ImageButton;

.field public inPipe:Ljava/io/PipedInputStream;

.field private interactionsContainer:Landroid/view/View;

.field private lowConnectivityContainer:Landroid/view/View;

.field private lowConnectivityNoAudioContainer:Landroid/view/View;

.field private mediaServerUrl:Ljava/lang/String;

.field private optOutTweetsButton:Landroid/widget/ToggleButton;

.field public outPipe:Ljava/io/PipedOutputStream;

.field recording:Z

.field private rootView:Landroid/view/ViewGroup;

.field surfaceReady:Z

.field private surfaceView:Landroid/view/SurfaceView;

.field totalNumberOfWatchers:I

.field private watcherCountTextView:Landroid/widget/TextView;

.field private watchersList:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 6
    .param p1, "viewComponent"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 159
    invoke-static {}, Lco/getair/meerkat/mediators/BroadcastMediator;->NAME()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p1}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    iput v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentCameraDirection:I

    .line 84
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->didSendCoverImage:Z

    .line 92
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceReady:Z

    .line 93
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    .line 98
    new-instance v1, Ljava/io/PipedInputStream;

    const v2, 0x1e8480

    invoke-direct {v1, v2}, Ljava/io/PipedInputStream;-><init>(I)V

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->inPipe:Ljava/io/PipedInputStream;

    .line 102
    iput v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->totalNumberOfWatchers:I

    .line 148
    const/4 v1, 0x0

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->mediaServerUrl:Ljava/lang/String;

    .line 152
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->didEndBroadcasting:Z

    .line 161
    check-cast p1, Landroid/view/ViewGroup;

    .end local p1    # "viewComponent":Ljava/lang/Object;
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    .line 163
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->context:Landroid/content/Context;

    .line 165
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e006f

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/SurfaceView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceView:Landroid/view/SurfaceView;

    .line 166
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 168
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e007b

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->interactionsContainer:Landroid/view/View;

    .line 169
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e007d

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->homeButton:Landroid/widget/ImageButton;

    .line 170
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e007e

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->flipCameraButton:Landroid/widget/ImageButton;

    .line 171
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e007f

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->flashlightSwitchButton:Landroid/widget/ImageButton;

    .line 172
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e007c

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentButton:Landroid/widget/ImageButton;

    .line 174
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0080

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentContainer:Landroid/view/View;

    .line 175
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0083

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentHandleTextView:Landroid/widget/TextView;

    .line 176
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0084

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentEditText:Landroid/widget/EditText;

    .line 177
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0085

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentSendButton:Landroid/widget/Button;

    .line 178
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0081

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ToggleButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->optOutTweetsButton:Landroid/widget/ToggleButton;

    .line 179
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->optOutTweetsButton:Landroid/widget/ToggleButton;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 181
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e00c2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->lowConnectivityNoAudioContainer:Landroid/view/View;

    .line 182
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e00c3

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->lowConnectivityContainer:Landroid/view/View;

    .line 184
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0070

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterContainer:Landroid/view/View;

    .line 185
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0071

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/makeramen/roundedimageview/RoundedImageView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterImage:Landroid/widget/ImageView;

    .line 186
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0072

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterNameTextView:Landroid/widget/TextView;

    .line 187
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0073

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterHandleTextView:Landroid/widget/TextView;

    .line 188
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0074

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    .line 189
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0075

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastCaptionTextView:Landroid/widget/TextView;

    .line 191
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0078

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->watchersList:Landroid/widget/LinearLayout;

    .line 192
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0076

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->watcherCountTextView:Landroid/widget/TextView;

    .line 194
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0086

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastEndedContainer:Landroid/view/View;

    .line 195
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0087

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastEndedWatchedCountTextView:Landroid/widget/TextView;

    .line 196
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    const v2, 0x7f0e0089

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastEndedHomeButton:Landroid/widget/ImageButton;

    .line 200
    new-instance v1, Lco/getair/meerkat/proxies/GraphProxy;

    const-string v2, "graphProxy"

    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lco/getair/meerkat/proxies/GraphProxy;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v1}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v0

    .line 201
    .local v0, "user":Lco/getair/meerkat/dtos/User;
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentHandleTextView:Landroid/widget/TextView;

    const-string v2, "@%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->homeButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$1;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->flipCameraButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$2;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$2;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->flashlightSwitchButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$3;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$3;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 224
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$4;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$4;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentSendButton:Landroid/widget/Button;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$5;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$5;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentEditText:Landroid/widget/EditText;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$6;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$6;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 246
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentEditText:Landroid/widget/EditText;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$7;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$7;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 260
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->optOutTweetsButton:Landroid/widget/ToggleButton;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$8;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$8;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 271
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastEndedHomeButton:Landroid/widget/ImageButton;

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$9;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$9;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 278
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->showBroadcasterInfo()V

    .line 279
    invoke-direct {p0, v5, v5}, Lco/getair/meerkat/mediators/BroadcastMediator;->updateWatchersCount(II)V

    .line 280
    return-void
.end method

.method public static NAME()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    const-string v0, "BroadcastMediator"

    return-object v0
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/BroadcastMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 78
    invoke-direct {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->stopBroadcast()V

    return-void
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/BroadcastMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 78
    invoke-direct {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->toggleTorchMode()V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/BroadcastMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 78
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/BroadcastMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 78
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$402(Lco/getair/meerkat/mediators/BroadcastMediator;Z)Z
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;
    .param p1, "x1"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->didEndBroadcasting:Z

    return p1
.end method

.method static synthetic access$502(Lco/getair/meerkat/mediators/BroadcastMediator;Z)Z
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;
    .param p1, "x1"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->didSendCoverImage:Z

    return p1
.end method

.method static synthetic access$600(Lco/getair/meerkat/mediators/BroadcastMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 78
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lco/getair/meerkat/mediators/BroadcastMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 78
    invoke-direct {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->handleConnectionIssues()V

    return-void
.end method

.method static synthetic access$800(Lco/getair/meerkat/mediators/BroadcastMediator;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 78
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->mediaServerUrl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lco/getair/meerkat/mediators/BroadcastMediator;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/BroadcastMediator;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-direct {p0, p1}, Lco/getair/meerkat/mediators/BroadcastMediator;->startSubmission(Ljava/lang/String;)V

    return-void
.end method

.method private broadcastCutOff()V
    .locals 4

    .prologue
    .line 384
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 385
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f09001a

    .line 386
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f090019

    .line 387
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0900ac

    .line 388
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lco/getair/meerkat/mediators/BroadcastMediator$12;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$12;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 393
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 394
    return-void
.end method

.method private getApplicationContext()Landroid/content/Context;
    .locals 2

    .prologue
    .line 725
    :try_start_0
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 729
    :goto_0
    return-object v1

    .line 726
    :catch_0
    move-exception v0

    .line 727
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 729
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private handleConnectionIssues()V
    .locals 5

    .prologue
    .line 776
    :try_start_0
    const-string v2, "BroadcastMediator"

    const-string v3, "Connection Issues"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 777
    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->outPipe:Ljava/io/PipedOutputStream;

    invoke-virtual {v2}, Ljava/io/PipedOutputStream;->close()V

    .line 778
    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->inPipe:Ljava/io/PipedInputStream;

    invoke-virtual {v2}, Ljava/io/PipedInputStream;->close()V

    .line 780
    new-instance v2, Ljava/io/PipedInputStream;

    const v3, 0x1e8480

    invoke-direct {v2, v3}, Ljava/io/PipedInputStream;-><init>(I)V

    iput-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->inPipe:Ljava/io/PipedInputStream;

    .line 781
    new-instance v2, Ljava/io/PipedOutputStream;

    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->inPipe:Ljava/io/PipedInputStream;

    invoke-direct {v2, v3}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    iput-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->outPipe:Ljava/io/PipedOutputStream;

    .line 783
    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentBuilder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    iget-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->outPipe:Ljava/io/PipedOutputStream;

    invoke-virtual {v3, v4}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;->createRecoveryBuilder(Ljava/io/OutputStream;)Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    move-result-object v3

    iput-object v3, v2, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->builder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    .line 785
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 787
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lco/getair/meerkat/mediators/BroadcastMediator$16;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$16;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    .line 796
    .local v1, "runable":Ljava/lang/Runnable;
    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 803
    .end local v0    # "handler":Landroid/os/Handler;
    .end local v1    # "runable":Ljava/lang/Runnable;
    :goto_0
    return-void

    .line 799
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private revealAllBroadcastScreen(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "caption"    # Ljava/lang/String;
    .param p2, "location"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 398
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 399
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 400
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 405
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 406
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastCaptionTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 407
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastCaptionTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 412
    :goto_1
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 413
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->flipCameraButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 414
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->flashlightSwitchButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 415
    return-void

    .line 402
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterLocationTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 409
    :cond_1
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastCaptionTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method private setLowConnectivityNoAudioVisible(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 285
    if-eqz p1, :cond_0

    .line 287
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->lowConnectivityNoAudioContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 291
    :goto_0
    return-void

    .line 289
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->lowConnectivityNoAudioContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private setLowConnectivityVisible(Z)V
    .locals 2
    .param p1, "visible"    # Z

    .prologue
    .line 295
    if-eqz p1, :cond_0

    .line 297
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->lowConnectivityContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 301
    :goto_0
    return-void

    .line 299
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->lowConnectivityContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method private startAdaptiveBitrateMonitor()V
    .locals 3

    .prologue
    .line 807
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/mediators/BroadcastMediator$17;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$17;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$18;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$18;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-static {v0, v1, v2}, Lcom/nanotasks/Tasks;->executeInBackground(Landroid/content/Context;Lcom/nanotasks/BackgroundWork;Lcom/nanotasks/Completion;)V

    .line 837
    return-void
.end method

.method private startSubmission(Ljava/lang/String;)V
    .locals 3
    .param p1, "streamURL"    # Ljava/lang/String;

    .prologue
    .line 734
    invoke-direct {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lco/getair/meerkat/mediators/BroadcastMediator$14;

    invoke-direct {v1, p0, p1}, Lco/getair/meerkat/mediators/BroadcastMediator$14;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;Ljava/lang/String;)V

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$15;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$15;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-static {v0, v1, v2}, Lcom/nanotasks/Tasks;->executeInBackground(Landroid/content/Context;Lcom/nanotasks/BackgroundWork;Lcom/nanotasks/Completion;)V

    .line 772
    return-void
.end method

.method private stopBroadcast()V
    .locals 4

    .prologue
    .line 312
    const/4 v1, 0x0

    iput-boolean v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceReady:Z

    .line 314
    iget-boolean v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    if-eqz v1, :cond_0

    .line 315
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 316
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f09001f

    .line 317
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09001c

    .line 318
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09001e

    .line 319
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lco/getair/meerkat/mediators/BroadcastMediator$11;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$11;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f09001d

    .line 326
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lco/getair/meerkat/mediators/BroadcastMediator$10;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$10;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 332
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 336
    .end local v0    # "context":Landroid/content/Context;
    :goto_0
    return-void

    .line 334
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->leaveBroadcast()V

    goto :goto_0
.end method

.method private toggleTorchMode()V
    .locals 2

    .prologue
    .line 306
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.camera.flash"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 307
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->toggleFlashMode()V

    .line 309
    :cond_0
    return-void
.end method

.method private updateWatchersCount(II)V
    .locals 6
    .param p1, "currentNumberOfWatchers"    # I
    .param p2, "totalNumberOfWatchers"    # I

    .prologue
    .line 559
    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 560
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

    .line 561
    .local v1, "watchersLabeltext":Ljava/lang/String;
    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->watcherCountTextView:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 563
    iput p2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->totalNumberOfWatchers:I

    .line 564
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
    .line 493
    .local p1, "newWatchersList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentWatchers:Ljava/util/HashMap;

    if-nez v11, :cond_0

    .line 494
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentWatchers:Ljava/util/HashMap;

    .line 497
    :cond_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentWatchers:Ljava/util/HashMap;

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

    .line 498
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 499
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 500
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 504
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

    .line 506
    .local v8, "watcher":Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentWatchers:Ljava/util/HashMap;

    iget-object v13, v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->id:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_3

    .line 507
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentWatchers:Ljava/util/HashMap;

    iget-object v13, v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->id:Ljava/lang/String;

    invoke-virtual {v12, v13, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 511
    .end local v8    # "watcher":Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
    :cond_4
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->watchersList:Landroid/widget/LinearLayout;

    invoke-virtual {v11}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 513
    new-instance v1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    .line 514
    .local v1, "builder":Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 515
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 516
    invoke-static {}, Lco/getair/meerkat/proxies/ResourcesProxy;->getInstance()Lco/getair/meerkat/proxies/ResourcesProxy;

    move-result-object v11

    invoke-virtual {v11}, Lco/getair/meerkat/proxies/ResourcesProxy;->getUserPhotoPlaceholder()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageForEmptyUri(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 517
    invoke-static {}, Lco/getair/meerkat/proxies/ResourcesProxy;->getInstance()Lco/getair/meerkat/proxies/ResourcesProxy;

    move-result-object v11

    invoke-virtual {v11}, Lco/getair/meerkat/proxies/ResourcesProxy;->getUserPhotoPlaceholder()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 518
    invoke-static {}, Lco/getair/meerkat/proxies/ResourcesProxy;->getInstance()Lco/getair/meerkat/proxies/ResourcesProxy;

    move-result-object v11

    invoke-virtual {v11}, Lco/getair/meerkat/proxies/ResourcesProxy;->getUserPhotoPlaceholder()Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    .line 519
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v6

    .line 522
    .local v6, "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentWatchers:Ljava/util/HashMap;

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

    .line 523
    .local v9, "watcherId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentWatchers:Ljava/util/HashMap;

    invoke-virtual {v11, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;

    .line 525
    .restart local v8    # "watcher":Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v11

    check-cast v11, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v11}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v7

    .line 526
    .local v7, "ownerActivity":Landroid/app/Activity;
    new-instance v10, Lcom/makeramen/roundedimageview/RoundedImageView;

    invoke-direct {v10, v7}, Lcom/makeramen/roundedimageview/RoundedImageView;-><init>(Landroid/content/Context;)V

    .line 528
    .local v10, "watcherView":Lcom/makeramen/roundedimageview/RoundedImageView;
    new-instance v5, Landroid/util/DisplayMetrics;

    invoke-direct {v5}, Landroid/util/DisplayMetrics;-><init>()V

    .line 529
    .local v5, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v7}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v11

    invoke-interface {v11}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v11

    invoke-virtual {v11, v5}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 531
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

    .line 532
    .local v4, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v11, 0x5

    const/4 v13, 0x0

    const/4 v14, 0x5

    const/4 v15, 0x0

    invoke-virtual {v4, v11, v13, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 533
    invoke-virtual {v10, v4}, Lcom/makeramen/roundedimageview/RoundedImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 535
    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Lcom/makeramen/roundedimageview/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 536
    const/high16 v11, 0x42b40000    # 90.0f

    invoke-virtual {v10, v11}, Lcom/makeramen/roundedimageview/RoundedImageView;->setCornerRadius(F)V

    .line 538
    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/makeramen/roundedimageview/RoundedImageView;->setClickable(Z)V

    .line 539
    invoke-virtual {v10, v8}, Lcom/makeramen/roundedimageview/RoundedImageView;->setTag(Ljava/lang/Object;)V

    .line 549
    move-object/from16 v0, p0

    iget-object v11, v0, Lco/getair/meerkat/mediators/BroadcastMediator;->watchersList:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 551
    iget-object v11, v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->profileThumbImage:Ljava/lang/String;

    if-eqz v11, :cond_5

    .line 552
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v11

    iget-object v13, v8, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->profileThumbImage:Ljava/lang/String;

    invoke-virtual {v11, v13, v10, v6}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    goto :goto_2

    .line 556
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
.method public finishBroadcasting()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 629
    :try_start_0
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->stopChunkedRecorder()V

    .line 631
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastEndedWatchedCountTextView:Landroid/widget/TextView;

    const-string v1, "%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->totalNumberOfWatchers:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 632
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastEndedContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 638
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    .line 641
    :goto_0
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastEndedWatchedCountTextView:Landroid/widget/TextView;

    const-string v1, "%d"

    new-array v2, v6, [Ljava/lang/Object;

    iget v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->totalNumberOfWatchers:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 642
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastEndedContainer:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 644
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceReady:Z

    .line 645
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    .line 646
    return-void

    .line 634
    :catch_0
    move-exception v0

    .line 638
    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    goto :goto_0

    :catchall_0
    move-exception v0

    iput-boolean v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    throw v0
.end method

.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 5
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 341
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventBroadcastBegan"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 342
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;

    .line 343
    .local v0, "broadcastBeganParams":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->getCaption()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;->getLocationText()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lco/getair/meerkat/mediators/BroadcastMediator;->revealAllBroadcastScreen(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    .end local v0    # "broadcastBeganParams":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastBeganParams;
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventStreamWatchersReceived"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 348
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    .line 349
    .local v1, "watchers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    invoke-direct {p0, v1}, Lco/getair/meerkat/mediators/BroadcastMediator;->updateWatchersList(Ljava/util/ArrayList;)V

    .line 352
    .end local v1    # "watchers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/dtos/watch_broadcast/Watcher;>;"
    :cond_1
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventStreamWatchersCountUpdated"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 353
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;

    .line 354
    .local v2, "watchersCountParams":Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
    invoke-virtual {v2}, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;->getCurrentWatchersCount()I

    move-result v3

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;->getTotalWatchersCount()I

    move-result v4

    invoke-direct {p0, v3, v4}, Lco/getair/meerkat/mediators/BroadcastMediator;->updateWatchersCount(II)V

    .line 357
    .end local v2    # "watchersCountParams":Lco/getair/meerkat/dtos/watch_broadcast/WatchersCountParams;
    :cond_2
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "broadcastActivityResumed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 358
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->ownerResumed()V

    .line 361
    :cond_3
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "broadcastActivityPaused"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 362
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->ownerPaused()V

    .line 365
    :cond_4
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventMediaServerUrlArrived"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 366
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "?mkfr="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->mediaServerUrl:Ljava/lang/String;

    .line 368
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->startBroadcast()V

    .line 371
    :cond_5
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventStreamHasEnded"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 372
    iget-boolean v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->didEndBroadcasting:Z

    if-nez v3, :cond_6

    .line 373
    invoke-direct {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcastCutOff()V

    .line 377
    :cond_6
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "eventDismissBroadcastScreen"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 378
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->finishBroadcasting()V

    .line 379
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->leaveBroadcast()V

    .line 381
    :cond_7
    return-void
.end method

.method public leaveBroadcast()V
    .locals 1

    .prologue
    .line 650
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 651
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 419
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventBroadcastBegan"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventStreamWatchersReceived"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "eventStreamWatchersCountUpdated"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "broadcastActivityResumed"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "broadcastActivityPaused"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "eventMediaServerUrlArrived"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "eventStreamHasEnded"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "eventDismissBroadcastScreen"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public ownerPaused()V
    .locals 0

    .prologue
    .line 439
    invoke-direct {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->stopBroadcast()V

    .line 440
    return-void
.end method

.method public ownerResumed()V
    .locals 0

    .prologue
    .line 434
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->finishBroadcasting()V

    .line 435
    return-void
.end method

.method public sendComment()V
    .locals 5

    .prologue
    .line 478
    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 479
    .local v0, "commentText":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 480
    const-string v3, "eventAddComment"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v0, v4}, Lco/getair/meerkat/mediators/BroadcastMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 482
    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentEditText:Landroid/widget/EditText;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 483
    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->clearFocus()V

    .line 485
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v2

    .line 487
    .local v2, "ownerActivity":Landroid/app/Activity;
    const-string v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 488
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 490
    .end local v1    # "imm":Landroid/view/inputmethod/InputMethodManager;
    .end local v2    # "ownerActivity":Landroid/app/Activity;
    :cond_0
    return-void
.end method

.method public setCameraDisplayOrientation()V
    .locals 6

    .prologue
    .line 568
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 570
    .local v3, "rotation":I
    const/4 v0, 0x0

    .line 571
    .local v0, "degrees":I
    packed-switch v3, :pswitch_data_0

    .line 578
    :goto_0
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 579
    .local v1, "info":Landroid/hardware/Camera$CameraInfo;
    iget v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentCameraDirection:I

    invoke-static {v4, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 582
    iget v4, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 583
    iget v4, v1, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v4, v0

    rem-int/lit16 v2, v4, 0x168

    .line 584
    .local v2, "result":I
    rsub-int v4, v2, 0x168

    rem-int/lit16 v2, v4, 0x168

    .line 589
    :goto_1
    iget-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-virtual {v4, v2}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->setCameraDisplayOrientation(I)V

    .line 590
    return-void

    .line 572
    .end local v1    # "info":Landroid/hardware/Camera$CameraInfo;
    .end local v2    # "result":I
    :pswitch_0
    const/4 v0, 0x0

    goto :goto_0

    .line 573
    :pswitch_1
    const/16 v0, 0x5a

    goto :goto_0

    .line 574
    :pswitch_2
    const/16 v0, 0xb4

    goto :goto_0

    .line 575
    :pswitch_3
    const/16 v0, 0x10e

    goto :goto_0

    .line 586
    .restart local v1    # "info":Landroid/hardware/Camera$CameraInfo;
    :cond_0
    iget v4, v1, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v4, v0

    add-int/lit16 v4, v4, 0x168

    rem-int/lit16 v2, v4, 0x168

    .restart local v2    # "result":I
    goto :goto_1

    .line 571
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public setCommentsVisibility(Z)V
    .locals 4
    .param p1, "visible"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v3, 0x0

    .line 463
    if-eqz p1, :cond_1

    .line 464
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 465
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->interactionsContainer:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 467
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 468
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 469
    .local v0, "keyboard":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 475
    .end local v0    # "keyboard":Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    :goto_0
    return-void

    .line 472
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->addCommentContainer:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 473
    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->interactionsContainer:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public showBroadcasterInfo()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 443
    invoke-static {}, Lco/getair/meerkat/MeerkatApplication;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/facades/ApplicationFacade;->getInst(Ljava/lang/String;)Lco/getair/meerkat/facades/ApplicationFacade;

    move-result-object v3

    const-string v4, "graphProxy"

    invoke-virtual {v3, v4}, Lco/getair/meerkat/facades/ApplicationFacade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/GraphProxy;

    .line 444
    .local v0, "graphProxy":Lco/getair/meerkat/proxies/GraphProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/proxies/GraphProxy;->getMyUser()Lco/getair/meerkat/dtos/User;

    move-result-object v2

    .line 446
    .local v2, "user":Lco/getair/meerkat/dtos/User;
    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterNameTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/User;->getDisplayName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 447
    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterHandleTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/User;->getUsername()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 449
    new-instance v3, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    .line 450
    invoke-virtual {v3, v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v3

    .line 451
    invoke-virtual {v3, v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v3

    .line 452
    invoke-virtual {v3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v1

    .line 454
    .local v1, "options":Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v3

    invoke-virtual {v2}, Lco/getair/meerkat/dtos/User;->getThumbnailImageUrl()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->broadcasterImage:Landroid/widget/ImageView;

    invoke-virtual {v3, v4, v5, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 460
    return-void
.end method

.method public startBroadcast()V
    .locals 6

    .prologue
    .line 594
    iget-boolean v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceReady:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->mediaServerUrl:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 624
    :cond_0
    :goto_0
    return-void

    .line 599
    :cond_1
    :try_start_0
    iget v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentCameraDirection:I

    invoke-virtual {p0, v1}, Lco/getair/meerkat/mediators/BroadcastMediator;->startChunkedHWRecorder(I)V

    .line 601
    const/4 v1, 0x1

    iput-boolean v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    .line 603
    iget-boolean v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->didSendCoverImage:Z

    if-nez v1, :cond_0

    .line 605
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lco/getair/meerkat/mediators/BroadcastMediator$13;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/BroadcastMediator$13;-><init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    const-wide/16 v4, 0xbb8

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 621
    :catch_0
    move-exception v0

    .line 622
    .local v0, "throwable":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public startChunkedHWRecorder(I)V
    .locals 6
    .param p1, "cameraId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 695
    new-instance v4, Ljava/io/PipedInputStream;

    const v5, 0x1e8480

    invoke-direct {v4, v5}, Ljava/io/PipedInputStream;-><init>(I)V

    iput-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->inPipe:Ljava/io/PipedInputStream;

    .line 696
    new-instance v4, Ljava/io/PipedOutputStream;

    iget-object v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->inPipe:Ljava/io/PipedInputStream;

    invoke-direct {v4, v5}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    iput-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->outPipe:Ljava/io/PipedOutputStream;

    .line 700
    new-instance v4, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    iget-object v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->outPipe:Ljava/io/PipedOutputStream;

    invoke-direct {v4, v5}, Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;-><init>(Ljava/io/OutputStream;)V

    iput-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentBuilder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    .line 702
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v4

    check-cast v4, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v4}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 703
    .local v0, "display":Landroid/view/Display;
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 704
    .local v2, "size":Landroid/graphics/Point;
    invoke-virtual {v0, v2}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 705
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 706
    .local v3, "width":I
    iget v1, v2, Landroid/graphics/Point;->y:I

    .line 708
    .local v1, "height":I
    new-instance v4, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-object v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentBuilder:Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;

    invoke-direct {v4, v5, v3, v1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;-><init>(Lco/getair/meerkat/video/broadcast/mp4writer/MeerkatMp4Builder;II)V

    iput-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    .line 709
    iget-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-virtual {v4, p1}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->setCameraId(I)V

    .line 711
    iget-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    move-result-object v5

    invoke-virtual {v4, v5}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->setDisplayEGLContext(Landroid/opengl/EGLContext;)V

    .line 712
    iget-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    iget-object v5, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v5}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v5

    invoke-virtual {v4, v5}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->setSurfaceHolder(Landroid/view/SurfaceHolder;)V

    .line 714
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->setCameraDisplayOrientation()V

    .line 716
    iget-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-static {v4}, Lco/getair/meerkat/mediators/BroadcastMediator$ChunkedHWRecorderWrapper;->runTest(Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;)V

    .line 718
    iget-object v4, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->mediaServerUrl:Ljava/lang/String;

    invoke-direct {p0, v4}, Lco/getair/meerkat/mediators/BroadcastMediator;->startSubmission(Ljava/lang/String;)V

    .line 719
    return-void
.end method

.method public stopChunkedRecorder()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 686
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->chunkedHWRecorder:Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder;->stopRecording()V

    .line 691
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 853
    const/4 v0, 0x1

    iput-boolean v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceReady:Z

    .line 854
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->startBroadcast()V

    .line 855
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 849
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 859
    const-string v0, ""

    const-string v1, "Surface destroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 860
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceReady:Z

    .line 861
    return-void
.end method

.method public toggleCameraClicked()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 657
    :try_start_0
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->stopChunkedRecorder()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 664
    iput-boolean v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    .line 668
    :goto_0
    new-instance v0, Landroid/view/SurfaceView;

    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 669
    .local v0, "newSurfaceView":Landroid/view/SurfaceView;
    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 670
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v2

    invoke-interface {v2, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 672
    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    iget-object v3, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 673
    iget-object v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->rootView:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 675
    iput-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->surfaceView:Landroid/view/SurfaceView;

    .line 678
    iget v2, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentCameraDirection:I

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    iput v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->currentCameraDirection:I

    .line 681
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator;->startBroadcast()V

    .line 683
    return-void

    .line 659
    .end local v0    # "newSurfaceView":Landroid/view/SurfaceView;
    :catch_0
    move-exception v2

    .line 664
    iput-boolean v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    goto :goto_0

    :catchall_0
    move-exception v2

    iput-boolean v1, p0, Lco/getair/meerkat/mediators/BroadcastMediator;->recording:Z

    throw v2
.end method
