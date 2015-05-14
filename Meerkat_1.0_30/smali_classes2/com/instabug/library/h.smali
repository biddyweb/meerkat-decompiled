.class final Lcom/instabug/library/h;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Lcom/instabug/library/invoker/a$e;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/h$a;,
        Lcom/instabug/library/h$b;
    }
.end annotation


# static fields
.field private static c:Lcom/instabug/library/internal/theming/a;

.field private static d:Lcom/instabug/library/Instabug$SdkThemingMode;

.field private static i:Ljava/lang/Class;

.field private static y:Lcom/instabug/library/internal/module/d;


# instance fields
.field private A:Lcom/instabug/library/model/b;

.field private B:Landroid/app/Activity;

.field private C:Lcom/instabug/library/dialog/d$a;

.field private D:Lcom/instabug/library/network/toolbox/b;

.field private E:Lcom/instabug/library/Instabug$IBGInvocationMode;

.field a:Lcom/instabug/library/invoker/a;

.field b:Lcom/instabug/library/invoker/a$d;

.field private e:Lcom/instabug/library/Instabug$GestureMode;

.field private f:Lcom/instabug/library/invoker/c;

.field private g:Lcom/instabug/library/util/j;

.field private h:Landroid/app/Application;

.field private j:Ljava/lang/ref/WeakReference;

.field private k:Landroid/opengl/GLSurfaceView;

.field private l:Lcom/instabug/library/Instabug$SdkThemingMode;

.field private m:Lcom/instabug/library/Instabug$SdkThemeSource;

.field private n:Z

.field private o:Z

.field private p:J

.field private q:J

.field private r:J

.field private s:Landroid/app/Dialog;

.field private t:Landroid/app/ProgressDialog;

.field private u:Lcom/instabug/library/x;

.field private v:Lcom/instabug/library/a;

.field private w:Lcom/instabug/library/internal/storage/s;

.field private x:Ljava/util/List;

.field private z:Lcom/instabug/library/internal/theming/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 76
    const-class v0, Lcom/instabug/library/InstabugFeedbackActivity;

    sput-object v0, Lcom/instabug/library/h;->i:Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>(Landroid/app/Application;Lcom/instabug/library/internal/module/a;Ljava/lang/String;)V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    sget-object v0, Lcom/instabug/library/Instabug$GestureMode;->NONE:Lcom/instabug/library/Instabug$GestureMode;

    iput-object v0, p0, Lcom/instabug/library/h;->e:Lcom/instabug/library/Instabug$GestureMode;

    .line 80
    sget-object v0, Lcom/instabug/library/Instabug$SdkThemingMode;->AUTO:Lcom/instabug/library/Instabug$SdkThemingMode;

    iput-object v0, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    .line 81
    sget-object v0, Lcom/instabug/library/Instabug$SdkThemeSource;->OWN_THEME:Lcom/instabug/library/Instabug$SdkThemeSource;

    iput-object v0, p0, Lcom/instabug/library/h;->m:Lcom/instabug/library/Instabug$SdkThemeSource;

    .line 83
    new-instance v0, Lcom/instabug/library/invoker/a;

    invoke-direct {v0, p0}, Lcom/instabug/library/invoker/a;-><init>(Lcom/instabug/library/invoker/a$e;)V

    iput-object v0, p0, Lcom/instabug/library/h;->a:Lcom/instabug/library/invoker/a;

    .line 86
    iput-boolean v6, p0, Lcom/instabug/library/h;->o:Z

    .line 100
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    .line 109
    iput-object v7, p0, Lcom/instabug/library/h;->C:Lcom/instabug/library/dialog/d$a;

    .line 111
    sget-object v0, Lcom/instabug/library/Instabug$IBGInvocationMode;->IBGInvocationModeNA:Lcom/instabug/library/Instabug$IBGInvocationMode;

    iput-object v0, p0, Lcom/instabug/library/h;->E:Lcom/instabug/library/Instabug$IBGInvocationMode;

    .line 116
    iput-object p1, p0, Lcom/instabug/library/h;->h:Landroid/app/Application;

    .line 118
    new-instance v0, Lcom/instabug/library/i;

    invoke-direct {v0, p0}, Lcom/instabug/library/i;-><init>(Lcom/instabug/library/h;)V

    .line 126
    invoke-virtual {p2}, Lcom/instabug/library/internal/module/a;->a()Lcom/instabug/library/a;

    move-result-object v1

    iput-object v1, p0, Lcom/instabug/library/h;->v:Lcom/instabug/library/a;

    .line 128
    invoke-virtual {p2}, Lcom/instabug/library/internal/module/a;->b()Lcom/instabug/library/internal/module/d;

    move-result-object v1

    sput-object v1, Lcom/instabug/library/h;->y:Lcom/instabug/library/internal/module/d;

    .line 129
    sget-object v1, Lcom/instabug/library/h;->y:Lcom/instabug/library/internal/module/d;

    invoke-virtual {v1}, Lcom/instabug/library/internal/module/d;->c()Lcom/instabug/library/x;

    move-result-object v1

    iput-object v1, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    .line 130
    iget-object v1, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    iput-object p3, v1, Lcom/instabug/library/x;->a:Ljava/lang/String;

    .line 132
    invoke-virtual {p2, v0}, Lcom/instabug/library/internal/module/a;->a(Lcom/instabug/library/invoker/c$a;)Lcom/instabug/library/invoker/c;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/h;->f:Lcom/instabug/library/invoker/c;

    .line 134
    new-instance v0, Lcom/instabug/library/util/j;

    sget-object v1, Lcom/instabug/library/h;->y:Lcom/instabug/library/internal/module/d;

    .line 135
    invoke-virtual {v1}, Lcom/instabug/library/internal/module/d;->b()Lcom/instabug/library/internal/storage/a;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/instabug/library/util/j;-><init>(Lcom/instabug/library/internal/storage/a;)V

    iput-object v0, p0, Lcom/instabug/library/h;->g:Lcom/instabug/library/util/j;

    .line 138
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/instabug/library/network/UploadCacheService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 139
    const-string v1, "com.instabug.token"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    new-instance v1, Lcom/instabug/library/util/b;

    invoke-virtual {p2}, Lcom/instabug/library/internal/module/a;->b()Lcom/instabug/library/internal/module/d;

    move-result-object v2

    invoke-virtual {v2}, Lcom/instabug/library/internal/module/d;->c()Lcom/instabug/library/x;

    move-result-object v2

    invoke-virtual {p2}, Lcom/instabug/library/internal/module/a;->c()Lcom/instabug/library/internal/module/c;

    move-result-object v3

    invoke-virtual {v3}, Lcom/instabug/library/internal/module/c;->a()Lcom/instabug/library/network/restapi/a;

    move-result-object v3

    invoke-virtual {p2}, Lcom/instabug/library/internal/module/a;->b()Lcom/instabug/library/internal/module/d;

    move-result-object v4

    invoke-virtual {v4}, Lcom/instabug/library/internal/module/d;->a()Lcom/instabug/library/internal/device/a;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/instabug/library/util/b;-><init>(Lcom/instabug/library/x;Lcom/instabug/library/network/restapi/a;Lcom/instabug/library/internal/device/a;)V

    .line 143
    invoke-virtual {p2}, Lcom/instabug/library/internal/module/a;->d()Lcom/instabug/library/util/crash/a;

    move-result-object v2

    .line 144
    invoke-static {v2}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 146
    sget-object v2, Lcom/instabug/library/h;->y:Lcom/instabug/library/internal/module/d;

    invoke-virtual {v2}, Lcom/instabug/library/internal/module/d;->e()Lcom/instabug/library/internal/storage/s;

    move-result-object v2

    iput-object v2, p0, Lcom/instabug/library/h;->w:Lcom/instabug/library/internal/storage/s;

    .line 147
    sget-object v2, Lcom/instabug/library/h;->y:Lcom/instabug/library/internal/module/d;

    invoke-virtual {v2}, Lcom/instabug/library/internal/module/d;->d()Lcom/instabug/library/model/b;

    move-result-object v2

    iput-object v2, p0, Lcom/instabug/library/h;->A:Lcom/instabug/library/model/b;

    .line 149
    iget-object v2, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {p1}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "instabug"

    invoke-virtual {p1, v5, v6}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/instabug/library/x;->a(Landroid/content/res/Resources;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    .line 152
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v2, v3, :cond_2

    .line 154
    new-instance v2, Lcom/instabug/library/util/e;

    invoke-direct {v2}, Lcom/instabug/library/util/e;-><init>()V

    .line 155
    invoke-direct {p0, v2, v0}, Lcom/instabug/library/h;->a(Landroid/app/Application$ActivityLifecycleCallbacks;Landroid/content/Intent;)V

    .line 160
    :goto_0
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->G()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Device is not registered. Registering.."

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    new-instance v0, Lcom/instabug/library/n;

    invoke-direct {v0, p0}, Lcom/instabug/library/n;-><init>(Lcom/instabug/library/h;)V

    invoke-virtual {v1, v0}, Lcom/instabug/library/util/b;->a(Lcom/instabug/library/util/b$a;)V

    :cond_0
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->H()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "This is the app\'s first run.."

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/instabug/library/h;->n:Z

    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, v6}, Lcom/instabug/library/x;->i(Z)V

    .line 161
    :cond_1
    return-void

    .line 157
    :cond_2
    invoke-direct {p0, v7, v0}, Lcom/instabug/library/h;->a(Landroid/app/Application$ActivityLifecycleCallbacks;Landroid/content/Intent;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/instabug/library/h;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/h;->t:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic a(Lcom/instabug/library/h;)Lcom/instabug/library/x;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    return-object v0
.end method

.method private a(Landroid/app/Activity;Lcom/instabug/library/h$b;)V
    .locals 6

    .prologue
    .line 524
    const-string v0, "ScreenshotProcessor: Starting Screenshot Capture"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 525
    new-instance v0, Lcom/instabug/library/util/h;

    iget-object v1, p0, Lcom/instabug/library/h;->j:Ljava/lang/ref/WeakReference;

    if-nez v1, :cond_0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/instabug/library/h;->k:Landroid/opengl/GLSurfaceView;

    iget-object v4, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    sget-object v1, Lcom/instabug/library/h;->y:Lcom/instabug/library/internal/module/d;

    invoke-virtual {v1}, Lcom/instabug/library/internal/module/d;->a()Lcom/instabug/library/internal/device/a;

    move-result-object v5

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/instabug/library/util/h;-><init>(Landroid/app/Activity;Landroid/app/Dialog;Landroid/opengl/GLSurfaceView;Ljava/util/List;Lcom/instabug/library/internal/device/a;)V

    .line 526
    iget-object v1, p0, Lcom/instabug/library/h;->g:Lcom/instabug/library/util/j;

    new-instance v2, Lcom/instabug/library/t;

    invoke-direct {v2, p0, p2}, Lcom/instabug/library/t;-><init>(Lcom/instabug/library/h;Lcom/instabug/library/h$b;)V

    invoke-virtual {v1, v0, v2}, Lcom/instabug/library/util/j;->a(Lcom/instabug/library/util/h;Lcom/instabug/library/util/j$a;)V

    .line 547
    return-void

    .line 525
    :cond_0
    iget-object v1, p0, Lcom/instabug/library/h;->j:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Dialog;

    move-object v2, v1

    goto :goto_0
.end method

.method public static a(Landroid/app/Activity;Ljava/lang/Class;Lcom/instabug/library/internal/theming/a;Lcom/instabug/library/Instabug$SdkThemingMode;Ljava/io/File;)V
    .locals 3

    .prologue
    .line 164
    sput-object p2, Lcom/instabug/library/h;->c:Lcom/instabug/library/internal/theming/a;

    .line 165
    sput-object p3, Lcom/instabug/library/h;->d:Lcom/instabug/library/Instabug$SdkThemingMode;

    .line 166
    invoke-static {p0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 167
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Annotation Activity Class not found. Please initialize the SDK properly"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 169
    const-string v0, "com.instabug.snapshot_file_path"

    invoke-virtual {p4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    const-string v2, "com.instabug.load_own_theme"

    if-nez p2, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 171
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 172
    return-void

    .line 170
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private a(Landroid/app/Application$ActivityLifecycleCallbacks;Landroid/content/Intent;)V
    .locals 2

    .prologue
    .line 198
    if-eqz p1, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 199
    iget-object v0, p0, Lcom/instabug/library/h;->h:Landroid/app/Application;

    invoke-virtual {v0, p1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 202
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/h;->h:Landroid/app/Application;

    invoke-virtual {v0, p2}, Landroid/app/Application;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 204
    return-void
.end method

.method private a(Lcom/instabug/library/h$b;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 448
    const-string v0, "Starting Instabug process"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 449
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/instabug/library/h;->o:Z

    .line 450
    invoke-direct {p0}, Lcom/instabug/library/h;->y()V

    .line 451
    invoke-virtual {p0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    .line 452
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    .line 453
    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->b(Landroid/app/Activity;)V

    .line 454
    iget-object v1, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v3}, Lcom/instabug/library/x;->q()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v4, v4}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/instabug/library/h;->t:Landroid/app/ProgressDialog;

    .line 456
    iget-object v1, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    sget-object v2, Lcom/instabug/library/Instabug$SdkThemingMode;->MANUAL:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/instabug/library/h;->m:Lcom/instabug/library/Instabug$SdkThemeSource;

    sget-object v2, Lcom/instabug/library/Instabug$SdkThemeSource;->CALLER_THEME:Lcom/instabug/library/Instabug$SdkThemeSource;

    if-ne v1, v2, :cond_0

    .line 457
    invoke-direct {p0}, Lcom/instabug/library/h;->z()Lcom/instabug/library/internal/theming/a;

    move-result-object v1

    iput-object v1, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    .line 460
    :cond_0
    iget-object v1, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 461
    invoke-direct {p0, v0, p1}, Lcom/instabug/library/h;->a(Landroid/app/Activity;Lcom/instabug/library/h$b;)V

    .line 470
    :cond_1
    :goto_0
    return-void

    .line 463
    :cond_2
    const-string v1, "Invoking advanced screenshot capturing"

    invoke-static {v1}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 464
    new-instance v1, Lcom/instabug/library/h$a;

    invoke-direct {v1, p0, v0, p1}, Lcom/instabug/library/h$a;-><init>(Lcom/instabug/library/h;Landroid/app/Activity;Lcom/instabug/library/h$b;)V

    .line 465
    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/layer/c;

    invoke-interface {v0, v1}, Lcom/instabug/library/internal/layer/c;->a(Lcom/instabug/library/internal/layer/c$a;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/instabug/library/h;Landroid/app/Activity;Lcom/instabug/library/h$b;)V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Lcom/instabug/library/h;->a(Landroid/app/Activity;Lcom/instabug/library/h$b;)V

    return-void
.end method

.method static synthetic a(Lcom/instabug/library/h;Ljava/io/File;)V
    .locals 4

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/instabug/library/activity/a;

    iget-object v2, p0, Lcom/instabug/library/h;->D:Lcom/instabug/library/network/toolbox/b;

    new-instance v3, Lcom/instabug/library/q;

    invoke-direct {v3, p0, p1}, Lcom/instabug/library/q;-><init>(Lcom/instabug/library/h;Ljava/io/File;)V

    invoke-direct {v1, v0, v2, v3}, Lcom/instabug/library/activity/a;-><init>(Landroid/app/Activity;Lcom/instabug/library/network/toolbox/b;Lcom/instabug/library/activity/a$a;)V

    iput-object v1, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    :cond_0
    return-void
.end method

.method public static a(Ljava/lang/Class;)V
    .locals 0

    .prologue
    .line 706
    sput-object p0, Lcom/instabug/library/h;->i:Ljava/lang/Class;

    .line 707
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/h;Z)Z
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/h;->o:Z

    return v0
.end method

.method static synthetic b(Lcom/instabug/library/h;)Landroid/app/Application;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->h:Landroid/app/Application;

    return-object v0
.end method

.method public static b()Lcom/instabug/library/internal/theming/a;
    .locals 1

    .prologue
    .line 183
    sget-object v0, Lcom/instabug/library/h;->c:Lcom/instabug/library/internal/theming/a;

    return-object v0
.end method

.method static synthetic c(Lcom/instabug/library/h;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    return-object v0
.end method

.method public static c()Lcom/instabug/library/Instabug$SdkThemingMode;
    .locals 1

    .prologue
    .line 187
    sget-object v0, Lcom/instabug/library/h;->d:Lcom/instabug/library/Instabug$SdkThemingMode;

    return-object v0
.end method

.method static synthetic d(Lcom/instabug/library/h;)Lcom/instabug/library/internal/theming/a;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    return-object v0
.end method

.method static synthetic e(Lcom/instabug/library/h;)Lcom/instabug/library/Instabug$SdkThemingMode;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    return-object v0
.end method

.method static synthetic f(Lcom/instabug/library/h;)Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic g(Lcom/instabug/library/h;)Landroid/app/ProgressDialog;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->t:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic h(Lcom/instabug/library/h;)Lcom/instabug/library/Instabug$SdkThemeSource;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->m:Lcom/instabug/library/Instabug$SdkThemeSource;

    return-object v0
.end method

.method static synthetic i(Lcom/instabug/library/h;)Ljava/util/List;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    return-object v0
.end method

.method static synthetic x()Ljava/lang/Class;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/instabug/library/h;->i:Ljava/lang/Class;

    return-object v0
.end method

.method private y()V
    .locals 2

    .prologue
    .line 389
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    .line 390
    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/layer/c;

    .line 391
    invoke-interface {v0}, Lcom/instabug/library/internal/layer/c;->a()Z

    move-result v0

    if-nez v0, :cond_0

    .line 392
    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 394
    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    .line 396
    goto :goto_0

    .line 397
    :cond_1
    return-void
.end method

.method private z()Lcom/instabug/library/internal/theming/a;
    .locals 2

    .prologue
    .line 400
    iget-object v0, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    sget-object v1, Lcom/instabug/library/Instabug$SdkThemingMode;->MIN_SDK_14:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-ne v0, v1, :cond_0

    .line 401
    const-string v0, "Explicitly loading Native Theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 402
    new-instance v0, Lcom/instabug/library/internal/theming/d;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/d;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/d;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    .line 440
    :goto_0
    return-object v0

    .line 403
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    sget-object v1, Lcom/instabug/library/Instabug$SdkThemingMode;->APPCOMPAT_V7:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-ne v0, v1, :cond_1

    .line 404
    const-string v0, "Explicitly loading AppCompat Theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 405
    new-instance v0, Lcom/instabug/library/internal/theming/b;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/b;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/b;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    goto :goto_0

    .line 406
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    sget-object v1, Lcom/instabug/library/Instabug$SdkThemingMode;->SHERLOCK:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-ne v0, v1, :cond_2

    .line 407
    const-string v0, "Explicitly loading ActionBarSherlock Material Theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 408
    new-instance v0, Lcom/instabug/library/internal/theming/e;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/e;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/e;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    goto :goto_0

    .line 409
    :cond_2
    iget-object v0, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    sget-object v1, Lcom/instabug/library/Instabug$SdkThemingMode;->APP_COMPAT_MATERIAL:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-ne v0, v1, :cond_3

    .line 410
    const-string v0, "Explicitly loading AppCompat Material Theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 411
    new-instance v0, Lcom/instabug/library/internal/theming/c;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/c;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/c;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    goto :goto_0

    .line 415
    :cond_3
    :try_start_0
    const-string v0, "android.support.v7.widget.Toolbar"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 416
    const-string v0, "AppCompat Material found, loading theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 417
    new-instance v0, Lcom/instabug/library/internal/theming/c;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/c;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/c;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 422
    :try_start_1
    const-string v0, "android.support.v7.app.ActionBarActivity"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 423
    const-string v0, "AppCompat found, loading theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 424
    new-instance v0, Lcom/instabug/library/internal/theming/b;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/b;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/b;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 429
    :try_start_2
    const-string v0, "com.actionbarsherlock.app.SherlockActivity"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 430
    const-string v0, "ActionBarSherlock found, loading theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 431
    new-instance v0, Lcom/instabug/library/internal/theming/b;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/b;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/b;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v0

    goto/16 :goto_0

    .line 435
    :catch_2
    move-exception v0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_4

    .line 436
    const-string v0, "No ActionBar libraries found, loading native theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 437
    new-instance v0, Lcom/instabug/library/internal/theming/b;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/b;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/b;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    goto/16 :goto_0

    .line 440
    :cond_4
    const/4 v0, 0x0

    goto/16 :goto_0
.end method


# virtual methods
.method public final a()Lcom/instabug/library/Instabug$GestureMode;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/instabug/library/h;->e:Lcom/instabug/library/Instabug$GestureMode;

    return-object v0
.end method

.method public final a(F)V
    .locals 1

    .prologue
    .line 918
    iget-object v0, p0, Lcom/instabug/library/h;->f:Lcom/instabug/library/invoker/c;

    invoke-virtual {v0, p1}, Lcom/instabug/library/invoker/c;->a(F)V

    .line 919
    return-void
.end method

.method public final a(II)V
    .locals 1

    .prologue
    .line 900
    new-instance v0, Lcom/instabug/library/network/toolbox/b;

    invoke-direct {v0}, Lcom/instabug/library/network/toolbox/b;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/h;->D:Lcom/instabug/library/network/toolbox/b;

    .line 901
    iget-object v0, p0, Lcom/instabug/library/h;->D:Lcom/instabug/library/network/toolbox/b;

    iput p1, v0, Lcom/instabug/library/network/toolbox/b;->a:I

    .line 902
    iget-object v0, p0, Lcom/instabug/library/h;->D:Lcom/instabug/library/network/toolbox/b;

    iput p2, v0, Lcom/instabug/library/network/toolbox/b;->b:I

    .line 903
    return-void
.end method

.method public final a(III)V
    .locals 1

    .prologue
    .line 885
    new-instance v0, Lcom/instabug/library/dialog/d$a;

    invoke-direct {v0}, Lcom/instabug/library/dialog/d$a;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/h;->C:Lcom/instabug/library/dialog/d$a;

    .line 886
    iget-object v0, p0, Lcom/instabug/library/h;->C:Lcom/instabug/library/dialog/d$a;

    iput p1, v0, Lcom/instabug/library/dialog/d$a;->a:I

    .line 887
    iget-object v0, p0, Lcom/instabug/library/h;->C:Lcom/instabug/library/dialog/d$a;

    iput p2, v0, Lcom/instabug/library/dialog/d$a;->b:I

    .line 888
    iget-object v0, p0, Lcom/instabug/library/h;->C:Lcom/instabug/library/dialog/d$a;

    iput p3, v0, Lcom/instabug/library/dialog/d$a;->c:I

    .line 889
    return-void
.end method

.method public final a(IIIII)V
    .locals 2

    .prologue
    .line 805
    sget-object v0, Lcom/instabug/library/Instabug$SdkThemingMode;->MANUAL:Lcom/instabug/library/Instabug$SdkThemingMode;

    iput-object v0, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    .line 806
    new-instance v0, Lcom/instabug/library/internal/theming/a;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/a;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    .line 807
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 808
    iget-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v1, v0, Lcom/instabug/library/internal/theming/a;->a:Landroid/graphics/drawable/Drawable;

    .line 809
    iget-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    iput p3, v0, Lcom/instabug/library/internal/theming/a;->c:I

    .line 810
    iget-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, p4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v1, v0, Lcom/instabug/library/internal/theming/a;->b:Landroid/graphics/drawable/Drawable;

    .line 811
    return-void
.end method

.method public final a(Landroid/app/Activity;)V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 308
    iput-object p1, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    .line 309
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;

    .line 310
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/instabug/library/h;->h:Landroid/app/Application;

    invoke-virtual {v2}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/instabug/library/h;->h:Landroid/app/Application;

    const-string v4, "instabug"

    invoke-virtual {v3, v4, v5}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/instabug/library/x;->a(Landroid/content/res/Resources;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    .line 311
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->e()Lcom/instabug/library/Instabug$IBGInvocationEvent;

    move-result-object v0

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventShake:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    if-ne v0, v1, :cond_0

    .line 312
    iget-object v0, p0, Lcom/instabug/library/h;->f:Lcom/instabug/library/invoker/c;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/instabug/library/invoker/c;->a(Z)V

    .line 315
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->e()Lcom/instabug/library/Instabug$IBGInvocationEvent;

    move-result-object v0

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventFloatingButton:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    if-ne v0, v1, :cond_1

    .line 316
    iget-object v0, p0, Lcom/instabug/library/h;->a:Lcom/instabug/library/invoker/a;

    invoke-virtual {v0, p1}, Lcom/instabug/library/invoker/a;->a(Landroid/app/Activity;)V

    .line 319
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->l()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 320
    iget-object v0, p0, Lcom/instabug/library/h;->v:Lcom/instabug/library/a;

    iget-object v1, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "activity"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    :cond_2
    iget-boolean v0, p0, Lcom/instabug/library/h;->n:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->g()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->h()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->h()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 324
    :cond_3
    iput-boolean v5, p0, Lcom/instabug/library/h;->n:Z

    .line 325
    invoke-virtual {p0}, Lcom/instabug/library/h;->e()V

    .line 328
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/instabug/library/h;->q:J

    .line 329
    return-void
.end method

.method public final a(Landroid/app/Dialog;)V
    .locals 3

    .prologue
    .line 680
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/instabug/library/h;->j:Ljava/lang/ref/WeakReference;

    .line 681
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->l()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 682
    iget-object v0, p0, Lcom/instabug/library/h;->v:Lcom/instabug/library/a;

    iget-object v1, p0, Lcom/instabug/library/h;->j:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "dialog"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    :cond_0
    return-void
.end method

.method public final a(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Lcom/instabug/library/Instabug$b;)V
    .locals 3

    .prologue
    const/16 v1, 0xbe

    .line 256
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    .line 257
    const-string v0, "Email field too long, sending first set of characters only"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->c(Ljava/lang/String;)V

    .line 258
    const/4 v0, 0x0

    invoke-virtual {p3, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    .line 261
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/h;->A:Lcom/instabug/library/model/b;

    const/4 v1, 0x1

    invoke-virtual {v0, p3, p2, p1, v1}, Lcom/instabug/library/model/b;->a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;

    move-result-object v0

    .line 262
    iget-object v1, p0, Lcom/instabug/library/h;->w:Lcom/instabug/library/internal/storage/s;

    new-instance v2, Lcom/instabug/library/p;

    invoke-direct {v2, p0, p4}, Lcom/instabug/library/p;-><init>(Lcom/instabug/library/h;Lcom/instabug/library/Instabug$b;)V

    invoke-interface {v1, v0, v2}, Lcom/instabug/library/internal/storage/s;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 273
    return-void
.end method

.method public final a(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;I)V
    .locals 1

    .prologue
    .line 849
    sget-object v0, Lcom/instabug/library/Instabug$SdkThemingMode;->MANUAL:Lcom/instabug/library/Instabug$SdkThemingMode;

    iput-object v0, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    .line 850
    new-instance v0, Lcom/instabug/library/internal/theming/a;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/a;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    .line 851
    iget-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    iput-object p2, v0, Lcom/instabug/library/internal/theming/a;->a:Landroid/graphics/drawable/Drawable;

    .line 853
    iget-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    iput p3, v0, Lcom/instabug/library/internal/theming/a;->c:I

    .line 854
    iget-object v0, p0, Lcom/instabug/library/h;->z:Lcom/instabug/library/internal/theming/a;

    iput-object p4, v0, Lcom/instabug/library/internal/theming/a;->b:Landroid/graphics/drawable/Drawable;

    .line 855
    return-void
.end method

.method public final a(Landroid/opengl/GLSurfaceView;)V
    .locals 0

    .prologue
    .line 686
    iput-object p1, p0, Lcom/instabug/library/h;->k:Landroid/opengl/GLSurfaceView;

    .line 687
    return-void
.end method

.method public final a(Landroid/view/View;)V
    .locals 5

    .prologue
    .line 276
    if-eqz p1, :cond_1

    .line 277
    const/4 v0, 0x0

    .line 278
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    if-lez v1, :cond_0

    .line 280
    :try_start_0
    iget-object v1, p0, Lcom/instabug/library/h;->h:Landroid/app/Application;

    invoke-virtual {v1}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 285
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v1}, Lcom/instabug/library/x;->l()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 286
    iget-object v1, p0, Lcom/instabug/library/h;->v:Lcom/instabug/library/a;

    iget-object v2, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/instabug/library/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 288
    :cond_1
    return-void

    .line 281
    :catch_0
    move-exception v1

    .line 282
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public final a(Landroid/view/View;Lcom/google/android/gms/maps/GoogleMap;)V
    .locals 2

    .prologue
    .line 700
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/layer/c;

    invoke-interface {v0}, Lcom/instabug/library/internal/layer/c;->b()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/internal/layer/c;

    invoke-interface {v0}, Lcom/instabug/library/internal/layer/c;->b()Landroid/view/View;

    move-result-object v0

    if-ne v0, p1, :cond_1

    iget-object v0, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 701
    :cond_0
    new-instance v0, Lcom/instabug/library/internal/layer/a;

    invoke-direct {v0, p1, p2}, Lcom/instabug/library/internal/layer/a;-><init>(Landroid/view/View;Lcom/google/android/gms/maps/GoogleMap;)V

    .line 702
    iget-object v1, p0, Lcom/instabug/library/h;->x:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 703
    return-void

    .line 700
    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method

.method public final a(Lcom/instabug/library/Instabug$GestureMode;)V
    .locals 0

    .prologue
    .line 175
    iput-object p1, p0, Lcom/instabug/library/h;->e:Lcom/instabug/library/Instabug$GestureMode;

    .line 176
    return-void
.end method

.method public final a(Lcom/instabug/library/Instabug$IBGInvocationEvent;)V
    .locals 1

    .prologue
    .line 896
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->a(Lcom/instabug/library/Instabug$IBGInvocationEvent;)V

    .line 897
    return-void
.end method

.method public final a(Lcom/instabug/library/Instabug$IBGInvocationMode;)V
    .locals 0

    .prologue
    .line 922
    iput-object p1, p0, Lcom/instabug/library/h;->E:Lcom/instabug/library/Instabug$IBGInvocationMode;

    .line 923
    return-void
.end method

.method public final a(Lcom/instabug/library/Instabug$SdkThemingMode;Lcom/instabug/library/Instabug$SdkThemeSource;)V
    .locals 0

    .prologue
    .line 859
    iput-object p1, p0, Lcom/instabug/library/h;->l:Lcom/instabug/library/Instabug$SdkThemingMode;

    .line 860
    iput-object p2, p0, Lcom/instabug/library/h;->m:Lcom/instabug/library/Instabug$SdkThemeSource;

    .line 861
    return-void
.end method

.method public final a(Ljava/io/File;)V
    .locals 3

    .prologue
    .line 291
    invoke-virtual {p0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 292
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/h;->o:Z

    .line 293
    sget-object v0, Lcom/instabug/library/h;->i:Ljava/lang/Class;

    if-nez v0, :cond_0

    .line 294
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Annotation Activity Class not found. Please initialize the SDK properly"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 295
    :cond_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    sget-object v2, Lcom/instabug/library/h;->i:Ljava/lang/Class;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 296
    const-string v1, "com.instabug.snapshot_file_path"

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 297
    iget-object v1, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 298
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 769
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->c(Ljava/lang/String;)V

    .line 770
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Lcom/instabug/library/Instabug$b;)V
    .locals 3

    .prologue
    const/16 v1, 0xbe

    .line 648
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    .line 649
    const-string v0, "Email field too long, sending first set of characters only"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->c(Ljava/lang/String;)V

    .line 650
    const/4 v0, 0x0

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 653
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/h;->A:Lcom/instabug/library/model/b;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, p2, p1, v1, v2}, Lcom/instabug/library/model/b;->a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;

    move-result-object v0

    .line 654
    iget-object v1, p0, Lcom/instabug/library/h;->w:Lcom/instabug/library/internal/storage/s;

    new-instance v2, Lcom/instabug/library/k;

    invoke-direct {v2, p0, p3}, Lcom/instabug/library/k;-><init>(Lcom/instabug/library/h;Lcom/instabug/library/Instabug$b;)V

    invoke-interface {v1, v0, v2}, Lcom/instabug/library/internal/storage/s;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 665
    return-void
.end method

.method public final a(Ljava/lang/Throwable;)V
    .locals 5

    .prologue
    .line 710
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 712
    :try_start_0
    const-string v1, "error"

    invoke-static {p1}, Lcom/instabug/library/Instabug$a;->b(Ljava/lang/Throwable;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 713
    iget-object v1, p0, Lcom/instabug/library/h;->A:Lcom/instabug/library/model/b;

    iget-object v2, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v2}, Lcom/instabug/library/x;->x()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x3

    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/instabug/library/model/b;->a(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)Lcom/instabug/library/model/a;

    move-result-object v0

    .line 714
    iget-object v1, p0, Lcom/instabug/library/h;->w:Lcom/instabug/library/internal/storage/s;

    new-instance v2, Lcom/instabug/library/l;

    invoke-direct {v2, p0}, Lcom/instabug/library/l;-><init>(Lcom/instabug/library/h;)V

    invoke-interface {v1, v0, v2}, Lcom/instabug/library/internal/storage/s;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 728
    :goto_0
    return-void

    .line 725
    :catch_0
    move-exception v0

    .line 726
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public final a(Z)V
    .locals 1

    .prologue
    .line 745
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->a(Z)V

    .line 746
    return-void
.end method

.method public final a(ZLjava/lang/Class;)V
    .locals 1

    .prologue
    .line 749
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/x;->a(ZLjava/lang/Class;)V

    .line 750
    return-void
.end method

.method public final a(ZZ)V
    .locals 1

    .prologue
    .line 777
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1, p2}, Lcom/instabug/library/x;->a(ZZ)V

    .line 778
    return-void
.end method

.method public final b(Landroid/app/Activity;)V
    .locals 8

    .prologue
    .line 341
    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    if-nez v0, :cond_1

    .line 342
    const-string v0, "No activity was set earlier than this call. Doing nothing"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->d(Ljava/lang/String;)V

    .line 385
    :cond_0
    :goto_0
    return-void

    .line 346
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 347
    const-string v0, "You\'re trying to pause an activity that is not the current activity! Please make sure you\'re calling onPause and onResume on every activity"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 351
    :cond_2
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->e()Lcom/instabug/library/Instabug$IBGInvocationEvent;

    move-result-object v0

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventShake:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    if-ne v0, v1, :cond_3

    .line 352
    iget-object v0, p0, Lcom/instabug/library/h;->f:Lcom/instabug/library/invoker/c;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/instabug/library/invoker/c;->a(Z)V

    .line 355
    :cond_3
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->e()Lcom/instabug/library/Instabug$IBGInvocationEvent;

    move-result-object v0

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventFloatingButton:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    if-ne v0, v1, :cond_4

    .line 356
    iget-object v0, p0, Lcom/instabug/library/h;->a:Lcom/instabug/library/invoker/a;

    invoke-virtual {v0}, Lcom/instabug/library/invoker/a;->a()V

    .line 361
    :cond_4
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->l()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 362
    iget-object v0, p0, Lcom/instabug/library/h;->v:Lcom/instabug/library/a;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "pause"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/instabug/library/h;->p:J

    .line 365
    iget-wide v0, p0, Lcom/instabug/library/h;->p:J

    iput-wide v0, p0, Lcom/instabug/library/h;->r:J

    .line 366
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    iget-wide v2, v0, Lcom/instabug/library/x;->d:J

    iget-wide v4, p0, Lcom/instabug/library/h;->r:J

    iget-wide v6, p0, Lcom/instabug/library/h;->q:J

    sub-long/2addr v4, v6

    add-long/2addr v2, v4

    iput-wide v2, v0, Lcom/instabug/library/x;->d:J

    .line 369
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/h;->t:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/instabug/library/h;->t:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 370
    iget-object v0, p0, Lcom/instabug/library/h;->t:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 371
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/h;->t:Landroid/app/ProgressDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 378
    :cond_6
    :goto_1
    :try_start_1
    iget-object v0, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 379
    iget-object v0, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 380
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 382
    :catch_0
    move-exception v0

    .line 383
    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 373
    :catch_1
    move-exception v0

    .line 374
    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 789
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->b(Ljava/lang/String;)V

    .line 790
    return-void
.end method

.method public final b(Z)V
    .locals 1

    .prologue
    .line 773
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->c(Z)V

    .line 774
    return-void
.end method

.method public final c(Landroid/app/Activity;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 668
    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 669
    iput-object v1, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    .line 670
    iput-object v1, p0, Lcom/instabug/library/h;->s:Landroid/app/Dialog;

    .line 671
    invoke-direct {p0}, Lcom/instabug/library/h;->y()V

    .line 673
    :cond_0
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 801
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->a(Ljava/lang/String;)V

    .line 802
    return-void
.end method

.method public final c(Z)V
    .locals 1

    .prologue
    .line 781
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->b(Z)V

    .line 782
    return-void
.end method

.method public final d()Lcom/instabug/library/internal/storage/s;
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lcom/instabug/library/h;->w:Lcom/instabug/library/internal/storage/s;

    return-object v0
.end method

.method public final d(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 829
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->d(Ljava/lang/String;)V

    .line 830
    return-void
.end method

.method public final d(Z)V
    .locals 1

    .prologue
    .line 868
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->f(Z)V

    .line 870
    return-void
.end method

.method public final e()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x5dc

    .line 551
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->e()Lcom/instabug/library/Instabug$IBGInvocationEvent;

    move-result-object v0

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventTwoFingersSwipeLeft:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    if-ne v0, v1, :cond_1

    .line 552
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 553
    new-instance v1, Lcom/instabug/library/u;

    invoke-direct {v1, p0}, Lcom/instabug/library/u;-><init>(Lcom/instabug/library/h;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 581
    :cond_0
    :goto_0
    return-void

    .line 566
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->e()Lcom/instabug/library/Instabug$IBGInvocationEvent;

    move-result-object v0

    sget-object v1, Lcom/instabug/library/Instabug$IBGInvocationEvent;->IBGInvocationEventShake:Lcom/instabug/library/Instabug$IBGInvocationEvent;

    if-ne v0, v1, :cond_0

    .line 567
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 568
    new-instance v1, Lcom/instabug/library/v;

    invoke-direct {v1, p0}, Lcom/instabug/library/v;-><init>(Lcom/instabug/library/h;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public final e(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 833
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->e(Ljava/lang/String;)V

    .line 834
    return-void
.end method

.method public final e(Z)V
    .locals 1

    .prologue
    .line 910
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->j(Z)V

    .line 911
    return-void
.end method

.method public final f()V
    .locals 3

    .prologue
    .line 584
    iget-boolean v0, p0, Lcom/instabug/library/h;->o:Z

    if-eqz v0, :cond_0

    .line 604
    :goto_0
    return-void

    .line 587
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->l()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 588
    iget-object v1, p0, Lcom/instabug/library/h;->v:Lcom/instabug/library/a;

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    .line 589
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_1
    const-string v2, "feedback"

    .line 588
    invoke-virtual {v1, v0, v2}, Lcom/instabug/library/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    :cond_1
    sget-object v0, Lcom/instabug/library/m;->a:[I

    iget-object v1, p0, Lcom/instabug/library/h;->E:Lcom/instabug/library/Instabug$IBGInvocationMode;

    invoke-virtual {v1}, Lcom/instabug/library/Instabug$IBGInvocationMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 595
    :pswitch_0
    new-instance v0, Lcom/instabug/library/w;

    invoke-direct {v0, p0}, Lcom/instabug/library/w;-><init>(Lcom/instabug/library/h;)V

    invoke-direct {p0, v0}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h$b;)V

    goto :goto_0

    .line 589
    :cond_2
    const-string v0, "Unknown Activity"

    goto :goto_1

    .line 598
    :pswitch_1
    invoke-virtual {p0}, Lcom/instabug/library/h;->g()V

    goto :goto_0

    .line 601
    :pswitch_2
    invoke-virtual {p0}, Lcom/instabug/library/h;->h()V

    goto :goto_0

    .line 593
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public final f(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 837
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->f(Ljava/lang/String;)V

    .line 838
    return-void
.end method

.method public final f(Z)V
    .locals 1

    .prologue
    .line 914
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->k(Z)V

    .line 915
    return-void
.end method

.method public final g()V
    .locals 1

    .prologue
    .line 617
    iget-boolean v0, p0, Lcom/instabug/library/h;->o:Z

    if-eqz v0, :cond_0

    .line 628
    :goto_0
    return-void

    .line 620
    :cond_0
    new-instance v0, Lcom/instabug/library/j;

    invoke-direct {v0, p0}, Lcom/instabug/library/j;-><init>(Lcom/instabug/library/h;)V

    invoke-direct {p0, v0}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h$b;)V

    goto :goto_0
.end method

.method public final g(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 841
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    iput-object p1, v0, Lcom/instabug/library/x;->b:Ljava/lang/String;

    .line 842
    return-void
.end method

.method public final h()V
    .locals 1

    .prologue
    .line 632
    iget-boolean v0, p0, Lcom/instabug/library/h;->o:Z

    if-eqz v0, :cond_0

    .line 636
    :goto_0
    return-void

    .line 635
    :cond_0
    invoke-virtual {p0}, Lcom/instabug/library/h;->i()V

    goto :goto_0
.end method

.method public final h(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 845
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    iput-object p1, v0, Lcom/instabug/library/x;->c:Ljava/lang/String;

    .line 846
    return-void
.end method

.method public final i()V
    .locals 5

    .prologue
    .line 639
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/instabug/library/h;->o:Z

    .line 640
    new-instance v0, Lcom/instabug/library/interactor/c;

    iget-object v1, p0, Lcom/instabug/library/h;->w:Lcom/instabug/library/internal/storage/s;

    invoke-direct {v0, v1}, Lcom/instabug/library/interactor/c;-><init>(Lcom/instabug/library/internal/storage/s;)V

    .line 641
    iget-object v1, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    iget-object v2, p0, Lcom/instabug/library/h;->v:Lcom/instabug/library/a;

    sget-object v3, Lcom/instabug/library/h;->y:Lcom/instabug/library/internal/module/d;

    invoke-virtual {v3}, Lcom/instabug/library/internal/module/d;->a()Lcom/instabug/library/internal/device/a;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/instabug/library/model/b;->a(Lcom/instabug/library/x;Lcom/instabug/library/a;Lcom/instabug/library/internal/device/a;)Lcom/instabug/library/model/b;

    move-result-object v1

    .line 642
    new-instance v2, Lcom/instabug/library/dialog/d;

    invoke-virtual {p0}, Lcom/instabug/library/h;->q()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/instabug/library/h;->C:Lcom/instabug/library/dialog/d$a;

    invoke-direct {v2, v3, v4, v0, v1}, Lcom/instabug/library/dialog/d;-><init>(Landroid/content/Context;Lcom/instabug/library/dialog/d$a;Lcom/instabug/library/interactor/c;Lcom/instabug/library/model/b;)V

    .line 643
    invoke-virtual {v2}, Lcom/instabug/library/dialog/d;->show()V

    .line 644
    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 906
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0, p1}, Lcom/instabug/library/x;->h(Ljava/lang/String;)V

    .line 907
    return-void
.end method

.method public final j()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 676
    iget-object v0, p0, Lcom/instabug/library/h;->j:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Dialog;

    return-object v0
.end method

.method public final k()V
    .locals 1

    .prologue
    .line 753
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->i()V

    .line 754
    return-void
.end method

.method public final l()Z
    .locals 1

    .prologue
    .line 757
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->j()Z

    move-result v0

    return v0
.end method

.method public final m()Ljava/lang/String;
    .locals 1

    .prologue
    .line 761
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->f()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final n()Z
    .locals 1

    .prologue
    .line 765
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->l()Z

    move-result v0

    return v0
.end method

.method public final o()Z
    .locals 1

    .prologue
    .line 785
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->g()Z

    move-result v0

    return v0
.end method

.method public final p()Ljava/lang/String;
    .locals 1

    .prologue
    .line 793
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->k()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method final q()Landroid/app/Activity;
    .locals 2

    .prologue
    .line 816
    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 817
    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    .line 818
    :goto_0
    invoke-virtual {v0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 819
    invoke-virtual {v0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    goto :goto_0

    .line 822
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/h;->B:Landroid/app/Activity;

    .line 825
    :cond_1
    return-object v0
.end method

.method public final r()Ljava/lang/String;
    .locals 1

    .prologue
    .line 864
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    invoke-virtual {v0}, Lcom/instabug/library/x;->q()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final s()Lcom/instabug/library/x;
    .locals 1

    .prologue
    .line 873
    iget-object v0, p0, Lcom/instabug/library/h;->u:Lcom/instabug/library/x;

    return-object v0
.end method

.method public final t()Landroid/app/Application;
    .locals 1

    .prologue
    .line 877
    iget-object v0, p0, Lcom/instabug/library/h;->h:Landroid/app/Application;

    return-object v0
.end method

.method public final u()Lcom/instabug/library/a;
    .locals 1

    .prologue
    .line 881
    iget-object v0, p0, Lcom/instabug/library/h;->v:Lcom/instabug/library/a;

    return-object v0
.end method

.method public final v()Lcom/instabug/library/dialog/d$a;
    .locals 1

    .prologue
    .line 892
    iget-object v0, p0, Lcom/instabug/library/h;->C:Lcom/instabug/library/dialog/d$a;

    return-object v0
.end method

.method public final w()V
    .locals 0

    .prologue
    .line 927
    invoke-virtual {p0}, Lcom/instabug/library/h;->f()V

    .line 928
    return-void
.end method
