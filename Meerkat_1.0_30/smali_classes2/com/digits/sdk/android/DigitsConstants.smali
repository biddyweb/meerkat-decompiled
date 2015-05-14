.class Lcom/digits/sdk/android/DigitsConstants;
.super Ljava/lang/Object;
.source "DigitsConstants.java"


# static fields
.field public static final DIGITS_TOS:Landroid/net/Uri;

.field public static final TWITTER_TOS:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 6
    const-string v0, "https://twitter.com/tos"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/digits/sdk/android/DigitsConstants;->TWITTER_TOS:Landroid/net/Uri;

    .line 7
    const-string v0, "https://www.digits.com"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/digits/sdk/android/DigitsConstants;->DIGITS_TOS:Landroid/net/Uri;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
