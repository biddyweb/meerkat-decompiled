.class Lco/getair/meerkat/mediators/PhoneVerificationMediator$3;
.super Ljava/lang/Object;
.source "PhoneVerificationMediator.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/PhoneVerificationMediator;->promptInvalidNumberMessage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/PhoneVerificationMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    .prologue
    .line 166
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneVerificationMediator$3;->this$0:Lco/getair/meerkat/mediators/PhoneVerificationMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 168
    return-void
.end method
