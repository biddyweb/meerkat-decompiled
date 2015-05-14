.class public Lcom/instabug/library/Instabug;
.super Ljava/lang/Object;
.source "Instabug.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/Instabug$a;,
        Lcom/instabug/library/Instabug$b;,
        Lcom/instabug/library/Instabug$SdkThemeSource;,
        Lcom/instabug/library/Instabug$GestureMode;,
        Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;,
        Lcom/instabug/library/Instabug$IBGInvocationMode;,
        Lcom/instabug/library/Instabug$IBGInvocationEvent;,
        Lcom/instabug/library/Instabug$SdkThemingMode;
    }
.end annotation


# static fields
.field public static final ARGS_PRIMARY_COLOR:Ljava/lang/String; = "PRIMARY_COLOR"

.field public static final ARGS_SECONDARY_COLOR:Ljava/lang/String; = "SECONDARY_COLOR"

.field public static DEBUG:Z = false

.field public static final INSTABUG_FEEDBACK_BUG:I = 0x1

.field public static final INSTABUG_FEEDBACK_FEEDBACK:I = 0x2

.field private static INSTANCE:Lcom/instabug/library/Instabug; = null

.field public static final INVOCATION_NONE:I = 0x0

.field public static final INVOCATION_OVERFLOW:I = 0x2

.field public static final INVOCATION_SHAKE:I = 0x1

.field public static final SDK_LEVEL:Ljava/lang/String; = "SDK Level "

.field public static final SDK_VERSION:Ljava/lang/String; = "1.3.2"


# instance fields
.field private mDelegate:Lcom/instabug/library/h;

.field private mInternalDelegate:Lcom/instabug/library/Instabug$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x0

    sput-boolean v0, Lcom/instabug/library/Instabug;->DEBUG:Z

    return-void
.end method

.method constructor <init>(Lcom/instabug/library/h;)V
    .locals 1

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    iput-object p1, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    .line 218
    new-instance v0, Lcom/instabug/library/Instabug$a;

    invoke-direct {v0, p0}, Lcom/instabug/library/Instabug$a;-><init>(Lcom/instabug/library/Instabug;)V

    iput-object v0, p0, Lcom/instabug/library/Instabug;->mInternalDelegate:Lcom/instabug/library/Instabug$a;

    .line 219
    return-void
.end method

.method static synthetic access$000(Lcom/instabug/library/Instabug;)Lcom/instabug/library/h;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    return-object v0
.end method

.method private static getAppTokenFromMetadata(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 204
    const-string v0, "com.instabug.ProductionMode"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 205
    const-string v1, "com.instabug.AppToken"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 206
    const-string v0, "com.instabug.AppToken"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 213
    :goto_0
    return-object v0

    .line 207
    :cond_0
    if-eqz v0, :cond_1

    const-string v0, "com.instabug.ProductionAppToken"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 208
    const-string v0, "com.instabug.ProductionAppToken"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 209
    :cond_1
    const-string v0, "com.instabug.DevelopmentAppToken"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 210
    const-string v0, "com.instabug.DevelopmentAppToken"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 213
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getInstance()Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 144
    sget-object v0, Lcom/instabug/library/Instabug;->INSTANCE:Lcom/instabug/library/Instabug;

    if-nez v0, :cond_0

    .line 145
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You must call Instabug.initialize() in your Application class first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_0
    sget-object v0, Lcom/instabug/library/Instabug;->INSTANCE:Lcom/instabug/library/Instabug;

    return-object v0
.end method

.method public static initialize(Landroid/app/Application;Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 160
    const-string v0, "Initializing Instabug SDK"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 162
    if-nez p1, :cond_0

    .line 163
    const-string v0, "com.instabug.library"

    const-string v1, "Instabug application token couldn\'t be retrieved, please make sure you\'re initialize(Context,String) with a non-null token"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Instabug application token not found"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    :cond_0
    new-instance v0, Lcom/instabug/library/h;

    new-instance v1, Lcom/instabug/library/internal/module/a;

    invoke-direct {v1, p0}, Lcom/instabug/library/internal/module/a;-><init>(Landroid/app/Application;)V

    invoke-direct {v0, p0, v1, p1}, Lcom/instabug/library/h;-><init>(Landroid/app/Application;Lcom/instabug/library/internal/module/a;Ljava/lang/String;)V

    .line 169
    new-instance v1, Lcom/instabug/library/Instabug;

    invoke-direct {v1, v0}, Lcom/instabug/library/Instabug;-><init>(Lcom/instabug/library/h;)V

    .line 171
    sput-object v1, Lcom/instabug/library/Instabug;->INSTANCE:Lcom/instabug/library/Instabug;

    return-object v1
.end method

.method public static initialize(Landroid/content/Context;)Lcom/instabug/library/Instabug;
    .locals 4

    .prologue
    .line 184
    const-string v0, "Initializing Instabug SDK"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 186
    sget-object v0, Lcom/instabug/library/Instabug;->INSTANCE:Lcom/instabug/library/Instabug;

    if-eqz v0, :cond_0

    .line 187
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SDK Already Initialized. Please use Instabug.getInstance() calls after Instabug.initialize()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 189
    :cond_0
    new-instance v0, Lcom/instabug/library/util/g;

    invoke-direct {v0}, Lcom/instabug/library/util/g;-><init>()V

    invoke-static {p0}, Lcom/instabug/library/util/g;->a(Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v0

    .line 191
    invoke-static {v0}, Lcom/instabug/library/Instabug;->getAppTokenFromMetadata(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    .line 192
    if-nez v1, :cond_1

    .line 193
    const-string v0, "com.instabug.library"

    const-string v1, "Instabug application token couldn\'t be retrieved, please make sure you\'re initialize(Context,String) with a non-null token"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Instabug application token not found"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 197
    :cond_1
    new-instance v2, Lcom/instabug/library/h;

    move-object v0, p0

    check-cast v0, Landroid/app/Application;

    new-instance v3, Lcom/instabug/library/internal/module/a;

    check-cast p0, Landroid/app/Application;

    invoke-direct {v3, p0}, Lcom/instabug/library/internal/module/a;-><init>(Landroid/app/Application;)V

    invoke-direct {v2, v0, v3, v1}, Lcom/instabug/library/h;-><init>(Landroid/app/Application;Lcom/instabug/library/internal/module/a;Ljava/lang/String;)V

    .line 199
    new-instance v0, Lcom/instabug/library/Instabug;

    invoke-direct {v0, v2}, Lcom/instabug/library/Instabug;-><init>(Lcom/instabug/library/h;)V

    .line 200
    sput-object v0, Lcom/instabug/library/Instabug;->INSTANCE:Lcom/instabug/library/Instabug;

    return-object v0
.end method


# virtual methods
.method public activityDestroyed(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->c(Landroid/app/Activity;)V

    .line 294
    return-void
.end method

.method public activityPaused(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->b(Landroid/app/Activity;)V

    .line 276
    return-void
.end method

.method public addMapView(Landroid/view/View;Lcom/google/android/gms/maps/GoogleMap;)V
    .locals 2

    .prologue
    .line 349
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/h;->a(Landroid/view/View;Lcom/google/android/gms/maps/GoogleMap;)V

    .line 350
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\naddMapView();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    return-void
.end method

.method public attachFileAtLocation(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 777
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->b(Ljava/lang/String;)V

    .line 778
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nattachFileAtLocation();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 779
    return-object p0
.end method

.method public clearLog()V
    .locals 2

    .prologue
    .line 506
    invoke-static {}, Lcom/instabug/library/util/InstabugLogger;->clear()V

    .line 507
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nclearLog();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    return-void
.end method

.method public displayFeedbackDialog()V
    .locals 2

    .prologue
    .line 516
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->i()V

    .line 517
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ndisplayFeedbackDialog();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 518
    return-void
.end method

.method public enableEmailField(ZZ)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 844
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/h;->a(ZZ)V

    .line 845
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nenableEmailField("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 846
    return-object p0
.end method

.method public getAnnotationActivityTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1421
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->B()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getAttachmentPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 798
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->p()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCommentHint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1367
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->v()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCommentRequiredError()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1358
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->u()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 1496
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1385
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDialog()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 311
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->j()Landroid/app/Dialog;

    move-result-object v0

    return-object v0
.end method

.method public getEmailHint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1376
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->w()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFeedbackPopupColors()Lcom/instabug/library/dialog/d$a;
    .locals 1

    .prologue
    .line 1302
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->v()Lcom/instabug/library/dialog/d$a;

    move-result-object v0

    return-object v0
.end method

.method public getFeedbackQuestion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1322
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->v()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGestureMode()Lcom/instabug/library/Instabug$GestureMode;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->a()Lcom/instabug/library/Instabug$GestureMode;

    move-result-object v0

    return-object v0
.end method

.method public getIncorrectEmailError()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1349
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->t()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMode()Z
    .locals 1

    .prologue
    .line 1488
    const/4 v0, 0x0

    return v0
.end method

.method public getPleaseWaitMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1311
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->r()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPostBugReportMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1331
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    iget-object v0, v0, Lcom/instabug/library/x;->c:Ljava/lang/String;

    return-object v0
.end method

.method public getPostFeedbackMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1340
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    iget-object v0, v0, Lcom/instabug/library/x;->b:Ljava/lang/String;

    return-object v0
.end method

.method public getSettingsBundle()Lcom/instabug/library/x;
    .locals 1

    .prologue
    .line 1531
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    return-object v0
.end method

.method public getUserData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 659
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->m()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasAttachment()Z
    .locals 1

    .prologue
    .line 794
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->l()Z

    move-result v0

    return v0
.end method

.method iG()Lcom/instabug/library/Instabug$a;
    .locals 1

    .prologue
    .line 1527
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mInternalDelegate:Lcom/instabug/library/Instabug$a;

    return-object v0
.end method

.method public invoke()V
    .locals 2

    .prologue
    .line 446
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->f()V

    .line 447
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ninvoke();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 448
    return-void
.end method

.method public invokeBugReporter()V
    .locals 2

    .prologue
    .line 458
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->g()V

    .line 459
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ninvokeBugReporter();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    return-void
.end method

.method public invokeFeedbackProcess()V
    .locals 2

    .prologue
    .line 411
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->f()V

    .line 412
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ninvokeFeedbackProcess();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    return-void
.end method

.method public invokeFeedbackProcess(I)V
    .locals 2

    .prologue
    .line 424
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ninvokeFeedbackProcess("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    packed-switch p1, :pswitch_data_0

    .line 433
    invoke-virtual {p0}, Lcom/instabug/library/Instabug;->invoke()V

    .line 435
    :goto_0
    return-void

    .line 427
    :pswitch_0
    invoke-virtual {p0}, Lcom/instabug/library/Instabug;->invokeBugReporter()V

    goto :goto_0

    .line 430
    :pswitch_1
    invoke-virtual {p0}, Lcom/instabug/library/Instabug;->invokeFeedbackSender()V

    goto :goto_0

    .line 425
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public invokeFeedbackSender()V
    .locals 2

    .prologue
    .line 469
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->h()V

    .line 470
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ninvokeFeedbackSender();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 471
    return-void
.end method

.method public invokeFeedbackSenderViaEmail()V
    .locals 2

    .prologue
    .line 481
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->h()V

    .line 482
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\ninvokeFeedbackSenderViaEmail();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    return-void
.end method

.method public isAutomaticallyDetectingColors()Z
    .locals 1

    .prologue
    .line 1492
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->E()Z

    move-result v0

    return v0
.end method

.method public isCommentRequired()Z
    .locals 1

    .prologue
    .line 1393
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->y()Z

    move-result v0

    return v0
.end method

.method isCrashReportingEnabled()Z
    .locals 1

    .prologue
    .line 1077
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->m()Z

    move-result v0

    return v0
.end method

.method public isEmailEnabled()Z
    .locals 1

    .prologue
    .line 1411
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->A()Z

    move-result v0

    return v0
.end method

.method public isEmailRequired()Z
    .locals 1

    .prologue
    .line 1403
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->z()Z

    move-result v0

    return v0
.end method

.method public isEnableOverflowMenuItem()Z
    .locals 1

    .prologue
    .line 1431
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->C()Z

    move-result v0

    return v0
.end method

.method public isShowIntroDialog()Z
    .locals 1

    .prologue
    .line 709
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->o()Z

    move-result v0

    return v0
.end method

.method public isShowPostFeedbackToast()Z
    .locals 1

    .prologue
    .line 1479
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->D()Z

    move-result v0

    return v0
.end method

.method public isTrackingUserSteps()Z
    .locals 1

    .prologue
    .line 833
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->n()Z

    move-result v0

    return v0
.end method

.method public log(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 496
    invoke-static {p1}, Lcom/instabug/library/util/InstabugLogger;->log(Ljava/lang/String;)V

    .line 497
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nlog();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 498
    return-void
.end method

.method public onDestroy(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->c(Landroid/app/Activity;)V

    .line 285
    return-void
.end method

.method public onPause(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->b(Landroid/app/Activity;)V

    .line 264
    return-void
.end method

.method public onResume(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Landroid/app/Activity;)V

    .line 230
    return-void
.end method

.method public reportBug(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Lcom/instabug/library/Instabug$b;)V
    .locals 2

    .prologue
    .line 605
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/instabug/library/h;->a(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Lcom/instabug/library/Instabug$b;)V

    .line 606
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nreportBug(...);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    return-void
.end method

.method public reportCaughtException(Ljava/lang/Exception;)V
    .locals 2

    .prologue
    .line 642
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nreportCaughtException(...);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    invoke-virtual {p0, p1}, Lcom/instabug/library/Instabug;->reportException(Ljava/lang/Throwable;)V

    .line 644
    return-void
.end method

.method public reportException(Ljava/lang/Throwable;)V
    .locals 2

    .prologue
    .line 630
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nreportException(...);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 631
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Ljava/lang/Throwable;)V

    .line 632
    return-void
.end method

.method public resetFileAttachment()Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 788
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->k()V

    .line 789
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nresetFileAttachment();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    return-object p0
.end method

.method public sendFeedback(Ljava/lang/String;Ljava/lang/String;Lcom/instabug/library/Instabug$b;)V
    .locals 2

    .prologue
    .line 617
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2, p3}, Lcom/instabug/library/h;->a(Ljava/lang/String;Ljava/lang/String;Lcom/instabug/library/Instabug$b;)V

    .line 618
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsendFeedback(...);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 620
    return-void
.end method

.method public setActivity(Landroid/app/Activity;)V
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Landroid/app/Activity;)V

    .line 241
    return-void
.end method

.method public setAnnotationActivityClass(Ljava/lang/Class;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 361
    invoke-static {p1}, Lcom/instabug/library/h;->a(Ljava/lang/Class;)V

    .line 362
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetAnnotationActivityClass("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    return-object p0
.end method

.method public setBugHeaderText(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1031
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->n()[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 1032
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetBugHeaderText("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1033
    return-object p0
.end method

.method public setCommentFieldHint(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 966
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->f(Ljava/lang/String;)V

    .line 967
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetCommentFieldHint("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 968
    return-object p0
.end method

.method public setCommentIsRequired(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 857
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->b(Z)V

    .line 858
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetCommentIsRequired("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 859
    return-object p0
.end method

.method public setCommentPlaceholder(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 952
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->f(Ljava/lang/String;)V

    .line 953
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetCommentPlaceHolder("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 954
    return-object p0
.end method

.method public setCommentRequired(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 871
    invoke-virtual {p0, p1}, Lcom/instabug/library/Instabug;->setCommentIsRequired(Z)Lcom/instabug/library/Instabug;

    .line 872
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetCommentRequired("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 873
    return-object p0
.end method

.method public setCommentRequired(ZLjava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 886
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->b(Z)V

    .line 887
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p2}, Lcom/instabug/library/h;->a(Ljava/lang/String;)V

    .line 888
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetCommentRequired("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 889
    return-object p0
.end method

.method public setCrashReportingEnabled(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1072
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetCrashReportingEnabled("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1073
    invoke-virtual {p0, p1}, Lcom/instabug/library/Instabug;->setIsTrackingCrashes(Z)Lcom/instabug/library/Instabug;

    move-result-object v0

    return-object v0
.end method

.method public setDebugEnabled(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 250
    sput-boolean p1, Lcom/instabug/library/Instabug;->DEBUG:Z

    .line 251
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "setDebugEnabled("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    return-object p0
.end method

.method public setDefaultEmail(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 912
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->d(Ljava/lang/String;)V

    .line 913
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetDefaultEmail();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 914
    return-object p0
.end method

.method public setDefaultInvocationMode(Lcom/instabug/library/Instabug$IBGInvocationMode;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/Instabug$IBGInvocationMode;)V

    .line 299
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetDefaultInvocationMode("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/instabug/library/Instabug$IBGInvocationMode;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    return-object p0
.end method

.method public setDialog(Landroid/app/Dialog;)V
    .locals 1

    .prologue
    .line 321
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Landroid/app/Dialog;)V

    .line 322
    return-void
.end method

.method public setEmailFieldHint(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 939
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->e(Ljava/lang/String;)V

    .line 940
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetEmailFieldHint("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 941
    return-object p0
.end method

.method public setEmailIsRequired(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1100
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->f(Z)V

    .line 1101
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetEmailIsRequired("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1102
    return-object p0
.end method

.method public setEmailPlaceholder(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 925
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->e(Ljava/lang/String;)V

    .line 926
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetEmailPlaceholder("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 927
    return-object p0
.end method

.method public setEnableOverflowMenuItem(Z)Lcom/instabug/library/Instabug;
    .locals 3

    .prologue
    .line 1442
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->d(Z)V

    .line 1443
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nsetEnabledOverflowMenuItem("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1444
    return-object p0
.end method

.method public setFeedbackHeaderText(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1045
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->n()[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 1046
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetFeedbackHeaderText("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1047
    return-object p0
.end method

.method public setFeedbackPopupColors(III)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1296
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2, p3}, Lcom/instabug/library/h;->a(III)V

    .line 1297
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetFeedbackPopupColors("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1298
    return-object p0
.end method

.method public setFeedbackQuestion(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1017
    invoke-virtual {p0, p1}, Lcom/instabug/library/Instabug;->setCommentPlaceholder(Ljava/lang/String;)Lcom/instabug/library/Instabug;

    .line 1018
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetFeedbackQuestion("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1019
    return-object p0
.end method

.method public setFloatingButtonBackColor(I)Lcom/instabug/library/Instabug;
    .locals 3

    .prologue
    .line 1173
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    iget-object v1, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    if-nez v1, :cond_0

    new-instance v1, Lcom/instabug/library/invoker/a$d;

    invoke-direct {v1}, Lcom/instabug/library/invoker/a$d;-><init>()V

    iput-object v1, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    iget-object v1, v0, Lcom/instabug/library/h;->a:Lcom/instabug/library/invoker/a;

    iget-object v2, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    invoke-virtual {v1, v2}, Lcom/instabug/library/invoker/a;->a(Lcom/instabug/library/invoker/a$d;)V

    :cond_0
    iget-object v0, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    iput p1, v0, Lcom/instabug/library/invoker/a$d;->b:I

    .line 1174
    return-object p0
.end method

.method public setFloatingButtonEdge(Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;)Lcom/instabug/library/Instabug;
    .locals 3

    .prologue
    .line 1152
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    iget-object v1, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    if-nez v1, :cond_0

    new-instance v1, Lcom/instabug/library/invoker/a$d;

    invoke-direct {v1}, Lcom/instabug/library/invoker/a$d;-><init>()V

    iput-object v1, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    iget-object v1, v0, Lcom/instabug/library/h;->a:Lcom/instabug/library/invoker/a;

    iget-object v2, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    invoke-virtual {v1, v2}, Lcom/instabug/library/invoker/a;->a(Lcom/instabug/library/invoker/a$d;)V

    :cond_0
    iget-object v0, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    iput-object p1, v0, Lcom/instabug/library/invoker/a$d;->c:Lcom/instabug/library/Instabug$IBGFloatingButtonEdge;

    .line 1153
    return-object p0
.end method

.method public setFloatingButtonForeColor(I)Lcom/instabug/library/Instabug;
    .locals 3

    .prologue
    .line 1184
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    iget-object v1, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    if-nez v1, :cond_0

    new-instance v1, Lcom/instabug/library/invoker/a$d;

    invoke-direct {v1}, Lcom/instabug/library/invoker/a$d;-><init>()V

    iput-object v1, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    iget-object v1, v0, Lcom/instabug/library/h;->a:Lcom/instabug/library/invoker/a;

    iget-object v2, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    invoke-virtual {v1, v2}, Lcom/instabug/library/invoker/a;->a(Lcom/instabug/library/invoker/a$d;)V

    :cond_0
    iget-object v0, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    iput p1, v0, Lcom/instabug/library/invoker/a$d;->a:I

    .line 1185
    return-object p0
.end method

.method public setFloatingButtonOffsetFromTop(I)Lcom/instabug/library/Instabug;
    .locals 3

    .prologue
    .line 1162
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    iget-object v1, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    if-nez v1, :cond_0

    new-instance v1, Lcom/instabug/library/invoker/a$d;

    invoke-direct {v1}, Lcom/instabug/library/invoker/a$d;-><init>()V

    iput-object v1, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    iget-object v1, v0, Lcom/instabug/library/h;->a:Lcom/instabug/library/invoker/a;

    iget-object v2, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    invoke-virtual {v1, v2}, Lcom/instabug/library/invoker/a;->a(Lcom/instabug/library/invoker/a$d;)V

    :cond_0
    iget-object v0, v0, Lcom/instabug/library/h;->b:Lcom/instabug/library/invoker/a$d;

    iput p1, v0, Lcom/instabug/library/invoker/a$d;->d:I

    .line 1163
    return-object p0
.end method

.method public setGLSurfaceView(Landroid/opengl/GLSurfaceView;)V
    .locals 2

    .prologue
    .line 336
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Landroid/opengl/GLSurfaceView;)V

    .line 337
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetGLSurfaceView();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    return-void
.end method

.method public setGestureInvocationMode(Lcom/instabug/library/Instabug$GestureMode;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 697
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/Instabug$GestureMode;)V

    .line 698
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetGestureInvocationMode("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/instabug/library/Instabug$GestureMode;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 699
    return-object p0
.end method

.method public setInvalidCommentAlertText(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 899
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Ljava/lang/String;)V

    .line 900
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetInvalidCommentAlertText("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 901
    return-object p0
.end method

.method public setInvalidEmailMessage(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1003
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->g(Ljava/lang/String;)V

    .line 1004
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetInvalidEmailMessage();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1005
    return-object p0
.end method

.method public setInvocationEvent(I)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 672
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    and-int/lit8 v1, p1, 0x2

    if-lez v1, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/instabug/library/h;->d(Z)V

    :cond_0
    and-int/lit8 v1, p1, 0x1

    if-lez v1, :cond_1

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventShake:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    invoke-virtual {v0, v1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/Instabug$IBGInvocationEvent;)V

    .line 673
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetInvocationEvent("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 674
    return-object p0
.end method

.method public setInvocationEvent(Lcom/instabug/library/Instabug$IBGInvocationEvent;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 684
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Lcom/instabug/library/Instabug$IBGInvocationEvent;)V

    .line 685
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetInvocationEvent("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/instabug/library/Instabug$IBGInvocationEvent;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 686
    return-object p0
.end method

.method public setIsTrackingCrashes(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1059
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->d(Z)V

    .line 1060
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetIsTrackingCrashes("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1061
    return-object p0
.end method

.method public setIsTrackingUserSteps(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 809
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->c(Z)V

    .line 810
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetIsTrackingUserSteps("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 811
    return-object p0
.end method

.method public setPostBugReportMessage(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 991
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->h(Ljava/lang/String;)V

    .line 992
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetPostBugReportMessage("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 993
    return-object p0
.end method

.method public setPostFeedbackMessage(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 979
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->g(Ljava/lang/String;)V

    .line 980
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetPostFeedbackMessage("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 981
    return-object p0
.end method

.method public setPreReportRunnable(Ljava/lang/Runnable;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1142
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetPreReportRunnable();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1143
    invoke-virtual {p0, p1}, Lcom/instabug/library/Instabug;->setPreSendingRunnable(Ljava/lang/Runnable;)Lcom/instabug/library/Instabug;

    move-result-object v0

    return-object v0
.end method

.method public setPreSendingRunnable(Ljava/lang/Runnable;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1127
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->a(Ljava/lang/Runnable;)V

    .line 1128
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetPreSendingRunnable();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1129
    return-object p0
.end method

.method public setPromptColors(II)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1507
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/h;->a(II)V

    .line 1508
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetPromptColors("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1509
    return-object p0
.end method

.method public setSDKColorResources(II)Lcom/instabug/library/Instabug;
    .locals 6

    .prologue
    .line 1278
    const v1, -0x333334

    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->t()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    .line 1279
    invoke-virtual {v0}, Lcom/instabug/library/h;->t()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    .line 1280
    invoke-virtual {v0}, Lcom/instabug/library/h;->t()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    .line 1281
    invoke-virtual {v0}, Lcom/instabug/library/h;->t()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    move-object v0, p0

    .line 1278
    invoke-virtual/range {v0 .. v5}, Lcom/instabug/library/Instabug;->setSdkStyleColors(IIIII)Lcom/instabug/library/Instabug;

    .line 1282
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "setSDKColorResources("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1283
    return-object p0
.end method

.method public setSDKColors(II)Lcom/instabug/library/Instabug;
    .locals 6

    .prologue
    .line 1263
    const v1, -0x333334

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/instabug/library/Instabug;->setSdkStyleColors(IIIII)Lcom/instabug/library/Instabug;

    .line 1264
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetSDKColors("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1265
    return-object p0
.end method

.method public setSdkStyle(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;I)Lcom/instabug/library/Instabug;
    .locals 6

    .prologue
    .line 1229
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/instabug/library/h;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;I)V

    .line 1230
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetSdkStyle();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1231
    return-object p0
.end method

.method public setSdkStyleColors(IIIII)Lcom/instabug/library/Instabug;
    .locals 6

    .prologue
    .line 1206
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/instabug/library/h;->a(IIIII)V

    .line 1207
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetSdkStyleColors();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1208
    return-object p0
.end method

.method public setSdkThemingMode(Lcom/instabug/library/Instabug$SdkThemingMode;Lcom/instabug/library/Instabug$SdkThemeSource;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1246
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/h;->a(Lcom/instabug/library/Instabug$SdkThemingMode;Lcom/instabug/library/Instabug$SdkThemeSource;)V

    .line 1247
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetSdkThemingMode "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/instabug/library/Instabug$SdkThemingMode;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/instabug/library/Instabug$SdkThemeSource;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1248
    return-object p0
.end method

.method public setShakingThreshold(F)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 397
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(F)V

    .line 398
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetShakingThreshold("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    return-object p0
.end method

.method public setShowIntroDialog(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 749
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Z)V

    .line 750
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetShowIntroDialog("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 751
    return-object p0
.end method

.method public setShowIntroDialog(ZLjava/lang/Class;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 764
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/h;->a(ZLjava/lang/Class;)V

    .line 765
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetShowIntroDialog("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Activity);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 766
    return-object p0
.end method

.method public setShowPostFeedbackToast(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1470
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetShowPostFeedbackToast("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1471
    invoke-virtual {p0, p1}, Lcom/instabug/library/Instabug;->setWillShowFeedbackSentAlert(Z)Lcom/instabug/library/Instabug;

    move-result-object v0

    return-object v0
.end method

.method public setShowTutorial(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1114
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetShowTutorial("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1115
    invoke-virtual {p0, p1}, Lcom/instabug/library/Instabug;->setWillShowTutorialAlert(Z)Lcom/instabug/library/Instabug;

    move-result-object v0

    return-object v0
.end method

.method public setSubmitButtonText(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 385
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->i(Ljava/lang/String;)V

    .line 386
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetSubmitButtonText("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    return-object p0
.end method

.method public setTrackUserSteps(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 822
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetTrackUserSteps("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 823
    invoke-virtual {p0, p1}, Lcom/instabug/library/Instabug;->setIsTrackingUserSteps(Z)Lcom/instabug/library/Instabug;

    move-result-object v0

    return-object v0
.end method

.method public setUserData(Ljava/lang/String;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 653
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->c(Ljava/lang/String;)V

    .line 654
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetUserData(...);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 655
    return-object p0
.end method

.method public setWillShowEmailField(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1094
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->e(Z)V

    .line 1095
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetWillShowEmailField("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1096
    return-object p0
.end method

.method public setWillShowFeedbackSentAlert(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 1456
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->g(Z)V

    .line 1457
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetWillShowFeedbackSentAlert("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1458
    return-object p0
.end method

.method public setWillShowStartAlert(Z)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 719
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Z)V

    .line 720
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetWillShowStartAlert("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 721
    return-object p0
.end method

.method public setWillShowStartAlert(ZLjava/lang/Class;)Lcom/instabug/library/Instabug;
    .locals 2

    .prologue
    .line 735
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/h;->a(ZLjava/lang/Class;)V

    .line 736
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nsetWillShowStartAlert("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Activity);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 737
    return-object p0
.end method

.method public setWillShowTutorialAlert(Z)Lcom/instabug/library/Instabug;
    .locals 3

    .prologue
    .line 1088
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->e(Z)V

    .line 1089
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\nsetShowTutorial("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1090
    return-object p0
.end method

.method public showAnimatedTutorial(Landroid/app/Activity;)V
    .locals 6

    .prologue
    .line 590
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/instabug/library/o;

    invoke-direct {v2, v0, p1}, Lcom/instabug/library/o;-><init>(Lcom/instabug/library/h;Landroid/app/Activity;)V

    const-wide/16 v4, 0x2ee

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 591
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nshowAnimatedTutorial();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    return-void
.end method

.method public showDiscoveryDialog()V
    .locals 2

    .prologue
    .line 577
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->e()V

    .line 578
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nshowDiscoveryDialog();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    return-void
.end method

.method public showStartAlert()V
    .locals 2

    .prologue
    .line 567
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->e()V

    .line 568
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nshowStartAlert();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    return-void
.end method

.method public startAnnotationActivity(Ljava/io/File;)V
    .locals 2

    .prologue
    .line 531
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Ljava/io/File;)V

    .line 532
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nstartAnnotationActivity(File);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    return-void
.end method

.method public terminate()V
    .locals 2

    .prologue
    .line 374
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nterminate();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    return-void
.end method

.method public viewTapped(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 556
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0, p1}, Lcom/instabug/library/h;->a(Landroid/view/View;)V

    .line 557
    iget-object v0, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v0}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nviewTapped(View);"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    return-void
.end method

.method public viewToBitmap(Landroid/view/View;)Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 543
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 544
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 545
    invoke-virtual {p1, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 546
    iget-object v1, p0, Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;

    invoke-virtual {v1}, Lcom/instabug/library/h;->s()Lcom/instabug/library/x;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/x;->F()Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nviewToBitmap();"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    return-object v0
.end method
