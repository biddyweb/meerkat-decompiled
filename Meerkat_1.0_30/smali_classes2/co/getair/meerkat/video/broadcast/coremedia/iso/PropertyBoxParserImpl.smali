.class public Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;
.super Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;
.source "PropertyBoxParserImpl.java"


# static fields
.field static EMPTY_STRING_ARRAY:[Ljava/lang/String;


# instance fields
.field buildLookupStrings:Ljava/lang/StringBuilder;

.field clazzName:Ljava/lang/String;

.field constuctorPattern:Ljava/util/regex/Pattern;

.field mapping:Ljava/util/Properties;

.field param:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/util/Properties;)V
    .locals 1
    .param p1, "mapping"    # Ljava/util/Properties;

    .prologue
    .line 74
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;-><init>()V

    .line 35
    const-string v0, "(.*)\\((.*?)\\)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->constuctorPattern:Ljava/util/regex/Pattern;

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->buildLookupStrings:Ljava/lang/StringBuilder;

    .line 75
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    .line 76
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/String;)V
    .locals 11
    .param p1, "customProperties"    # [Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;-><init>()V

    .line 35
    const-string v7, "(.*)\\((.*?)\\)"

    invoke-static {v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    iput-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->constuctorPattern:Ljava/util/regex/Pattern;

    .line 124
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->buildLookupStrings:Ljava/lang/StringBuilder;

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "/isoparser-default.properties"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 40
    .local v5, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v7, Ljava/util/Properties;

    invoke-direct {v7}, Ljava/util/Properties;-><init>()V

    iput-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :try_start_1
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    invoke-virtual {v7, v5}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 43
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 44
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-nez v0, :cond_0

    .line 45
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 47
    :cond_0
    const-string v7, "isoparser-custom.properties"

    invoke-virtual {v0, v7}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v4

    .line 49
    .local v4, "enumeration":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 50
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/net/URL;

    .line 51
    .local v6, "url":Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 53
    .local v1, "customIS":Ljava/io/InputStream;
    :try_start_2
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    invoke-virtual {v7, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 55
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 61
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v1    # "customIS":Ljava/io/InputStream;
    .end local v4    # "enumeration":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    .end local v6    # "url":Ljava/net/URL;
    :catch_0
    move-exception v3

    .line 62
    .local v3, "e":Ljava/io/IOException;
    :try_start_4
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 65
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 66
    :try_start_5
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 70
    :goto_1
    throw v7

    .line 55
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    .restart local v1    # "customIS":Ljava/io/InputStream;
    .restart local v4    # "enumeration":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    .restart local v6    # "url":Ljava/net/URL;
    :catchall_1
    move-exception v7

    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v7

    .line 58
    .end local v1    # "customIS":Ljava/io/InputStream;
    .end local v6    # "url":Ljava/net/URL;
    :cond_1
    array-length v8, p1

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v8, :cond_2

    aget-object v2, p1, v7

    .line 59
    .local v2, "customProperty":Ljava/lang/String;
    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 58
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 66
    .end local v2    # "customProperty":Ljava/lang/String;
    :cond_2
    :try_start_7
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    .line 72
    :goto_3
    return-void

    .line 67
    :catch_1
    move-exception v3

    .line 68
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 67
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v3    # "e":Ljava/io/IOException;
    .end local v4    # "enumeration":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/URL;>;"
    :catch_2
    move-exception v3

    .line 68
    .restart local v3    # "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public createBox(Ljava/lang/String;[BLjava/lang/String;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .locals 9
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "userType"    # [B
    .param p3, "parent"    # Ljava/lang/String;

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2, p3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->invoke(Ljava/lang/String;[BLjava/lang/String;)V

    .line 85
    :try_start_0
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->clazzName:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 86
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    array-length v6, v6

    if-lez v6, :cond_4

    .line 87
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    array-length v6, v6

    new-array v2, v6, [Ljava/lang/Class;

    .line 88
    .local v2, "constructorArgsClazz":[Ljava/lang/Class;
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    array-length v6, v6

    new-array v1, v6, [Ljava/lang/Object;

    .line 89
    .local v1, "constructorArgs":[Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    array-length v6, v6

    if-ge v5, v6, :cond_3

    .line 90
    const-string v6, "userType"

    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    aget-object v7, v7, v5

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 91
    aput-object p2, v1, v5

    .line 92
    const-class v6, [B

    aput-object v6, v2, v5

    .line 89
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 93
    :cond_0
    const-string v6, "type"

    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    aget-object v7, v7, v5

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 94
    aput-object p1, v1, v5

    .line 95
    const-class v6, Ljava/lang/String;

    aput-object v6, v2, v5
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_4

    goto :goto_1

    .line 110
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .end local v1    # "constructorArgs":[Ljava/lang/Object;
    .end local v2    # "constructorArgsClazz":[Ljava/lang/Class;
    .end local v5    # "i":I
    :catch_0
    move-exception v4

    .line 111
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 96
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .restart local v1    # "constructorArgs":[Ljava/lang/Object;
    .restart local v2    # "constructorArgsClazz":[Ljava/lang/Class;
    .restart local v5    # "i":I
    :cond_1
    :try_start_1
    const-string v6, "parent"

    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    aget-object v7, v7, v5

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 97
    aput-object p3, v1, v5

    .line 98
    const-class v6, Ljava/lang/String;

    aput-object v6, v2, v5
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_4

    goto :goto_1

    .line 112
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .end local v1    # "constructorArgs":[Ljava/lang/Object;
    .end local v2    # "constructorArgsClazz":[Ljava/lang/Class;
    .end local v5    # "i":I
    :catch_1
    move-exception v4

    .line 113
    .local v4, "e":Ljava/lang/InstantiationException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 100
    .end local v4    # "e":Ljava/lang/InstantiationException;
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .restart local v1    # "constructorArgs":[Ljava/lang/Object;
    .restart local v2    # "constructorArgsClazz":[Ljava/lang/Class;
    .restart local v5    # "i":I
    :cond_2
    :try_start_2
    new-instance v6, Ljava/lang/InternalError;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "No such param: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    aget-object v8, v8, v5

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_4

    .line 114
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .end local v1    # "constructorArgs":[Ljava/lang/Object;
    .end local v2    # "constructorArgsClazz":[Ljava/lang/Class;
    .end local v5    # "i":I
    :catch_2
    move-exception v4

    .line 115
    .local v4, "e":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 104
    .end local v4    # "e":Ljava/lang/IllegalAccessException;
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .restart local v1    # "constructorArgs":[Ljava/lang/Object;
    .restart local v2    # "constructorArgsClazz":[Ljava/lang/Class;
    .restart local v5    # "i":I
    :cond_3
    :try_start_3
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 105
    .local v3, "constructorObject":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    invoke-virtual {v3, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 107
    .end local v1    # "constructorArgs":[Ljava/lang/Object;
    .end local v2    # "constructorArgsClazz":[Ljava/lang/Class;
    .end local v3    # "constructorObject":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    .end local v5    # "i":I
    :goto_2
    return-object v6

    :cond_4
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_2

    .line 116
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    :catch_3
    move-exception v4

    .line 117
    .local v4, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 118
    .end local v4    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_4
    move-exception v4

    .line 119
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method public invoke(Ljava/lang/String;[BLjava/lang/String;)V
    .locals 9
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "userType"    # [B
    .param p3, "parent"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x2

    .line 131
    if-eqz p2, :cond_4

    .line 132
    const-string v4, "uuid"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 133
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "we have a userType but no uuid box type. Something\'s wrong"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 135
    :cond_0
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "uuid["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Hex;->encodeHex([B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "constructor":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 137
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "-uuid["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Hex;->encodeHex([B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 139
    :cond_1
    if-nez v0, :cond_2

    .line 140
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    const-string v5, "uuid"

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 151
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    .line 152
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    const-string v5, "default"

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 154
    :cond_3
    if-nez v0, :cond_5

    .line 155
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "No box object found for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 143
    .end local v0    # "constructor":Ljava/lang/String;
    :cond_4
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    invoke-virtual {v4, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    .restart local v0    # "constructor":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 145
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->buildLookupStrings:Ljava/lang/StringBuilder;

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 146
    .local v1, "lookup":Ljava/lang/String;
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->buildLookupStrings:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 147
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->mapping:Ljava/util/Properties;

    invoke-virtual {v4, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 157
    .end local v1    # "lookup":Ljava/lang/String;
    :cond_5
    const-string v4, ")"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 158
    sget-object v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    .line 159
    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->clazzName:Ljava/lang/String;

    .line 174
    :goto_1
    return-void

    .line 161
    :cond_6
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->constuctorPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 162
    .local v2, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    .line 163
    .local v3, "matches":Z
    if-nez v3, :cond_7

    .line 164
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot work with that constructor: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 166
    :cond_7
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->clazzName:Ljava/lang/String;

    .line 167
    invoke-virtual {v2, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_8

    .line 168
    sget-object v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    goto :goto_1

    .line 170
    :cond_8
    invoke-virtual {v2, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_9

    invoke-virtual {v2, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    :goto_2
    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl;->param:[Ljava/lang/String;

    goto :goto_1

    :cond_9
    new-array v4, v8, [Ljava/lang/String;

    goto :goto_2
.end method
