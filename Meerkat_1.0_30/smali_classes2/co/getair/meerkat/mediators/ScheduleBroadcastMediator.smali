.class public Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "ScheduleBroadcastMediator.java"


# instance fields
.field private addedPhotoImageView:Landroid/widget/ImageView;

.field broadcastImage:Landroid/graphics/Bitmap;

.field private navigationBar:Lco/getair/meerkat/views/NavigationBar;

.field private progressBar:Landroid/widget/ProgressBar;

.field private rootView:Landroid/view/View;

.field private scheduleButton:Landroid/widget/Button;

.field timeOfBroadcast:Ljava/util/Date;

.field private timeTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 79
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 81
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->rootView:Landroid/view/View;

    .line 83
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->rootView:Landroid/view/View;

    const v3, 0x7f0e00b6

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/views/NavigationBar;

    iput-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    .line 85
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->rootView:Landroid/view/View;

    const v3, 0x7f0e00b7

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 86
    .local v1, "pickTimeView":Landroid/view/View;
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->rootView:Landroid/view/View;

    const v3, 0x7f0e00b9

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 88
    .local v0, "addPhotoView":Landroid/view/View;
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->rootView:Landroid/view/View;

    const v3, 0x7f0e00b8

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->timeTextView:Landroid/widget/TextView;

    .line 89
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->rootView:Landroid/view/View;

    const v3, 0x7f0e00ba

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->addedPhotoImageView:Landroid/widget/ImageView;

    .line 90
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->rootView:Landroid/view/View;

    const v3, 0x7f0e00bc

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->scheduleButton:Landroid/widget/Button;

    .line 91
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->rootView:Landroid/view/View;

    const v3, 0x7f0e00bb

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ProgressBar;

    iput-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->progressBar:Landroid/widget/ProgressBar;

    .line 93
    new-instance v2, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$1;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$1;-><init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    new-instance v2, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$2;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$2;-><init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 107
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->scheduleButton:Landroid/widget/Button;

    new-instance v3, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$3;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$3;-><init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    iget-object v2, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->progressBar:Landroid/widget/ProgressBar;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 115
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    .prologue
    .line 53
    invoke-direct {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->showDatePicker()V

    return-void
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    .prologue
    .line 53
    invoke-direct {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->addPhoto()V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    .prologue
    .line 53
    invoke-direct {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->scheduleBroadcast()V

    return-void
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    .prologue
    .line 53
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->timeTextView:Landroid/widget/TextView;

    return-object v0
.end method

.method private addPhoto()V
    .locals 1

    .prologue
    .line 222
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    invoke-virtual {v0}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->requestPhotoFromUser()V

    .line 223
    return-void
.end method

.method private scheduleBroadcast()V
    .locals 0

    .prologue
    .line 253
    invoke-direct {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->startSchedulingBroadcast()V

    .line 254
    return-void
.end method

.method private showDatePicker()V
    .locals 4

    .prologue
    .line 181
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    .line 182
    .local v0, "scheduleBroadcastActivity":Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
    invoke-static {}, Lco/getair/meerkat/utilities/TimePickerFragment;->newInstance()Lco/getair/meerkat/utilities/TimePickerFragment;

    move-result-object v1

    .line 183
    .local v1, "timePickerFragment":Lco/getair/meerkat/utilities/TimePickerFragment;
    new-instance v2, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$5;-><init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V

    invoke-virtual {v1, v2}, Lco/getair/meerkat/utilities/TimePickerFragment;->setDateSelectedRunnable(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 217
    invoke-virtual {v0}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string v3, "datePicker"

    invoke-virtual {v1, v2, v3}, Lco/getair/meerkat/utilities/TimePickerFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 218
    return-void
.end method

.method private startSchedulingBroadcast()V
    .locals 6

    .prologue
    .line 229
    iget-object v3, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->timeOfBroadcast:Ljava/util/Date;

    if-nez v3, :cond_0

    .line 231
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 232
    .local v1, "context":Landroid/content/Context;
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "Please select a broadcast date"

    .line 233
    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v4, "Ok"

    new-instance v5, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$6;

    invoke-direct {v5, p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$6;-><init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V

    .line 234
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 238
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 249
    .end local v1    # "context":Landroid/content/Context;
    :goto_0
    return-void

    .line 241
    :cond_0
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v3}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;

    .line 242
    .local v0, "activity":Lco/getair/meerkat/activities/ScheduleBroadcastActivity;
    new-instance v2, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;

    invoke-virtual {v0}, Lco/getair/meerkat/activities/ScheduleBroadcastActivity;->getBroadcastName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->timeOfBroadcast:Ljava/util/Date;

    iget-object v5, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->broadcastImage:Landroid/graphics/Bitmap;

    invoke-direct {v2, v3, v4, v5}, Lco/getair/meerkat/dtos/ScheduleBroadcastParams;-><init>(Ljava/lang/String;Ljava/util/Date;Landroid/graphics/Bitmap;)V

    .line 244
    .local v2, "scheduleBroadcastParams":Lco/getair/meerkat/dtos/ScheduleBroadcastParams;
    const-string v3, "scheduleBroadcastStartedScheduling"

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v2, v4}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 247
    iget-object v3, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->scheduleButton:Landroid/widget/Button;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 248
    iget-object v3, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->progressBar:Landroid/widget/ProgressBar;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 4
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 134
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "scheduleBroadcastScheduled"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 137
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 140
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "scheduleBroadcastScheduledError"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 142
    iget-object v1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->scheduleButton:Landroid/widget/Button;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 143
    iget-object v1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->progressBar:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 145
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 146
    .local v0, "context":Landroid/content/Context;
    const v1, 0x7f090082

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 149
    .end local v0    # "context":Landroid/content/Context;
    :cond_1
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "scheduleBroadcastImageReceived"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 151
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->broadcastImage:Landroid/graphics/Bitmap;

    .line 152
    iget-object v1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->broadcastImage:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_2

    .line 154
    iget-object v1, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->addedPhotoImageView:Landroid/widget/ImageView;

    const v2, 0x7f0201db

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 159
    :cond_2
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "scheduleBroadcastImageCancelled"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 164
    :cond_3
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "scheduleBroadcastImageFailed"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 166
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 167
    .restart local v0    # "context":Landroid/content/Context;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Error Adding Image"

    .line 168
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "There was an error adding the image - please try again."

    .line 169
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Ok"

    new-instance v3, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$4;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator$4;-><init>(Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;)V

    .line 170
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 174
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 176
    .end local v0    # "context":Landroid/content/Context;
    :cond_4
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 121
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "scheduleBroadcastImageReceived"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "scheduleBroadcastImageCancelled"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "scheduleBroadcastImageFailed"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "scheduleBroadcastScheduled"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "scheduleBroadcastScheduledError"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRegister()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 68
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRegister()V

    .line 70
    iget-object v0, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setProfileInfoVisible(Ljava/lang/Boolean;)V

    .line 71
    iget-object v0, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setLeaderboardVisible(Ljava/lang/Boolean;)V

    .line 72
    iget-object v0, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setLogoVisible(Ljava/lang/Boolean;)V

    .line 73
    iget-object v0, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setSearchVisible(Ljava/lang/Boolean;)V

    .line 74
    iget-object v0, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {v0}, Lco/getair/meerkat/views/NavigationBar;->showBackButton()V

    .line 75
    iget-object v0, p0, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->navigationBar:Lco/getair/meerkat/views/NavigationBar;

    invoke-virtual {p0}, Lco/getair/meerkat/mediators/ScheduleBroadcastMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/views/NavigationBar;->setFacade(Lorg/puremvc/java/multicore/patterns/facade/Facade;)V

    .line 76
    return-void
.end method
