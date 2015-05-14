.class Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$3;
.super Ljava/lang/Object;
.source "PhoneActivationCodeMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 157
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$3;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 160
    const-string v0, "AAAAAA"

    const-string v1, "RESEND SMS!"

    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/MLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    return-void
.end method
