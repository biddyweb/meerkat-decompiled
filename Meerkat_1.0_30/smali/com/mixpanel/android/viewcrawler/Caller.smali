.class Lcom/mixpanel/android/viewcrawler/Caller;
.super Ljava/lang/Object;
.source "Caller.java"


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "MixpanelABTest.Caller"


# instance fields
.field private final mMethodArgs:[Ljava/lang/Object;

.field private final mMethodName:Ljava/lang/String;

.field private final mMethodResultType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final mMethodTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final mTargetClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final mTargetMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Class;)V
    .locals 4
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "methodArgs"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 11
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p4, "resultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p2, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodName:Ljava/lang/String;

    .line 17
    iput-object p3, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodArgs:[Ljava/lang/Object;

    .line 18
    iput-object p4, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodResultType:Ljava/lang/Class;

    .line 20
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodArgs:[Ljava/lang/Object;

    array-length v1, v1

    new-array v1, v1, [Ljava/lang/Class;

    iput-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodTypes:[Ljava/lang/Class;

    .line 21
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodArgs:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 22
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodTypes:[Ljava/lang/Class;

    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodArgs:[Ljava/lang/Object;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v1, v0

    .line 21
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 25
    :cond_0
    invoke-direct {p0, p1}, Lcom/mixpanel/android/viewcrawler/Caller;->pickMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mTargetMethod:Ljava/lang/reflect/Method;

    .line 26
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mTargetMethod:Ljava/lang/reflect/Method;

    if-nez v1, :cond_1

    .line 27
    new-instance v1, Ljava/lang/NoSuchMethodException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Method "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " doesn\'t exit"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 30
    :cond_1
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mTargetMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mTargetClass:Ljava/lang/Class;

    .line 31
    return-void
.end method

.method private static assignableArgType(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/lang/Integer;

    if-ne p0, v0, :cond_1

    .line 65
    sget-object p0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 74
    :cond_0
    :goto_0
    return-object p0

    .line 66
    :cond_1
    const-class v0, Ljava/lang/Float;

    if-ne p0, v0, :cond_2

    .line 67
    sget-object p0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    goto :goto_0

    .line 68
    :cond_2
    const-class v0, Ljava/lang/Double;

    if-ne p0, v0, :cond_3

    .line 69
    sget-object p0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    goto :goto_0

    .line 70
    :cond_3
    const-class v0, Ljava/lang/Boolean;

    if-ne p0, v0, :cond_0

    .line 71
    sget-object p0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    goto :goto_0
.end method

.method private pickMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v10

    array-length v11, v10

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v11, :cond_3

    aget-object v5, v10, v9

    .line 79
    .local v5, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    .line 80
    .local v3, "foundName":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    .line 82
    .local v7, "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodName:Ljava/lang/String;

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    array-length v12, v7

    iget-object v13, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodArgs:[Ljava/lang/Object;

    array-length v13, v13

    if-eq v12, v13, :cond_1

    .line 78
    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 86
    :cond_1
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodResultType:Ljava/lang/Class;

    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/Caller;->assignableArgType(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    .line 87
    .local v1, "assignType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v12

    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/Caller;->assignableArgType(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v8

    .line 88
    .local v8, "resultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 92
    const/4 v2, 0x1

    .line 93
    .local v2, "assignable":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v12, v7

    if-ge v4, v12, :cond_2

    if-eqz v2, :cond_2

    .line 94
    iget-object v12, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodTypes:[Ljava/lang/Class;

    aget-object v12, v12, v4

    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/Caller;->assignableArgType(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    .line 95
    .local v0, "argumentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    aget-object v12, v7, v4

    invoke-static {v12}, Lcom/mixpanel/android/viewcrawler/Caller;->assignableArgType(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v6

    .line 96
    .local v6, "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v6, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    .line 93
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 99
    .end local v0    # "argumentType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "paramType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    if-eqz v2, :cond_0

    .line 106
    .end local v1    # "assignType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "assignable":Z
    .end local v3    # "foundName":Ljava/lang/String;
    .end local v4    # "i":I
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v7    # "params":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v8    # "resultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_2
    return-object v5

    :cond_3
    const/4 v5, 0x0

    goto :goto_2
.end method


# virtual methods
.method public applyMethod(Landroid/view/View;)Ljava/lang/Object;
    .locals 5
    .param p1, "target"    # Landroid/view/View;

    .prologue
    .line 43
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 44
    .local v1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mTargetClass:Ljava/lang/Class;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 46
    :try_start_0
    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mTargetMethod:Ljava/lang/reflect/Method;

    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodArgs:[Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 54
    :goto_0
    return-object v2

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "MixpanelABTest.Caller"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Method "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mTargetMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " appears not to be public"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 54
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_0
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 49
    :catch_1
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "MixpanelABTest.Caller"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Method "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mTargetMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " threw an exception"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public getArgs()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodArgs:[Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[Caller "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/Caller;->mMethodArgs:[Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
