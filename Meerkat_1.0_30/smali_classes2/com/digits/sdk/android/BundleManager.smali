.class Lcom/digits/sdk/android/BundleManager;
.super Ljava/lang/Object;
.source "BundleManager.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static varargs assertContains(Landroid/os/Bundle;[Ljava/lang/String;)Z
    .locals 6
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "keys"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 8
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 17
    :cond_0
    :goto_0
    return v4

    .line 12
    :cond_1
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v3, :cond_2

    aget-object v2, v0, v1

    .line 13
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 12
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 17
    .end local v2    # "key":Ljava/lang/String;
    :cond_2
    const/4 v4, 0x1

    goto :goto_0
.end method
