.class public Lco/getair/meerkat/mediators/AddressbookUploadMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "AddressbookUploadMediator.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "AddressbookUploadMediator"


# instance fields
.field private rootView:Landroid/view/View;

.field private uploadContactsButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    .line 46
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->rootView:Landroid/view/View;

    .line 50
    iget-object v0, p0, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->rootView:Landroid/view/View;

    const v1, 0x7f0e006c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->uploadContactsButton:Landroid/widget/Button;

    .line 52
    iget-object v0, p0, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->uploadContactsButton:Landroid/widget/Button;

    new-instance v1, Lco/getair/meerkat/mediators/AddressbookUploadMediator$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/AddressbookUploadMediator$1;-><init>(Lco/getair/meerkat/mediators/AddressbookUploadMediator;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/AddressbookUploadMediator;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/AddressbookUploadMediator;

    .prologue
    .line 33
    invoke-direct {p0}, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public static getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    const-string v0, "AddressbookUploadMediator"

    return-object v0
.end method

.method private getOwnerActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 79
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 72
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "eventSendActivationCodeFail"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    :cond_0
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method
