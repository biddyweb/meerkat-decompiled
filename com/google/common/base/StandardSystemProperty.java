package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtIncompatible;
import javax.annotation.Nullable;

@Beta
@GwtIncompatible("java.lang.System#getProperty")
public enum StandardSystemProperty
{
  private final String key;

  static
  {
    JAVA_VENDOR = new StandardSystemProperty("JAVA_VENDOR", 1, "java.vendor");
    JAVA_VENDOR_URL = new StandardSystemProperty("JAVA_VENDOR_URL", 2, "java.vendor.url");
    JAVA_HOME = new StandardSystemProperty("JAVA_HOME", 3, "java.home");
    JAVA_VM_SPECIFICATION_VERSION = new StandardSystemProperty("JAVA_VM_SPECIFICATION_VERSION", 4, "java.vm.specification.version");
    JAVA_VM_SPECIFICATION_VENDOR = new StandardSystemProperty("JAVA_VM_SPECIFICATION_VENDOR", 5, "java.vm.specification.vendor");
    JAVA_VM_SPECIFICATION_NAME = new StandardSystemProperty("JAVA_VM_SPECIFICATION_NAME", 6, "java.vm.specification.name");
    JAVA_VM_VERSION = new StandardSystemProperty("JAVA_VM_VERSION", 7, "java.vm.version");
    JAVA_VM_VENDOR = new StandardSystemProperty("JAVA_VM_VENDOR", 8, "java.vm.vendor");
    JAVA_VM_NAME = new StandardSystemProperty("JAVA_VM_NAME", 9, "java.vm.name");
    JAVA_SPECIFICATION_VERSION = new StandardSystemProperty("JAVA_SPECIFICATION_VERSION", 10, "java.specification.version");
    JAVA_SPECIFICATION_VENDOR = new StandardSystemProperty("JAVA_SPECIFICATION_VENDOR", 11, "java.specification.vendor");
    JAVA_SPECIFICATION_NAME = new StandardSystemProperty("JAVA_SPECIFICATION_NAME", 12, "java.specification.name");
    JAVA_CLASS_VERSION = new StandardSystemProperty("JAVA_CLASS_VERSION", 13, "java.class.version");
    JAVA_CLASS_PATH = new StandardSystemProperty("JAVA_CLASS_PATH", 14, "java.class.path");
    JAVA_LIBRARY_PATH = new StandardSystemProperty("JAVA_LIBRARY_PATH", 15, "java.library.path");
    JAVA_IO_TMPDIR = new StandardSystemProperty("JAVA_IO_TMPDIR", 16, "java.io.tmpdir");
    JAVA_COMPILER = new StandardSystemProperty("JAVA_COMPILER", 17, "java.compiler");
    JAVA_EXT_DIRS = new StandardSystemProperty("JAVA_EXT_DIRS", 18, "java.ext.dirs");
    OS_NAME = new StandardSystemProperty("OS_NAME", 19, "os.name");
    OS_ARCH = new StandardSystemProperty("OS_ARCH", 20, "os.arch");
    OS_VERSION = new StandardSystemProperty("OS_VERSION", 21, "os.version");
    FILE_SEPARATOR = new StandardSystemProperty("FILE_SEPARATOR", 22, "file.separator");
    PATH_SEPARATOR = new StandardSystemProperty("PATH_SEPARATOR", 23, "path.separator");
    LINE_SEPARATOR = new StandardSystemProperty("LINE_SEPARATOR", 24, "line.separator");
    USER_NAME = new StandardSystemProperty("USER_NAME", 25, "user.name");
    USER_HOME = new StandardSystemProperty("USER_HOME", 26, "user.home");
    USER_DIR = new StandardSystemProperty("USER_DIR", 27, "user.dir");
    StandardSystemProperty[] arrayOfStandardSystemProperty = new StandardSystemProperty[28];
    arrayOfStandardSystemProperty[0] = JAVA_VERSION;
    arrayOfStandardSystemProperty[1] = JAVA_VENDOR;
    arrayOfStandardSystemProperty[2] = JAVA_VENDOR_URL;
    arrayOfStandardSystemProperty[3] = JAVA_HOME;
    arrayOfStandardSystemProperty[4] = JAVA_VM_SPECIFICATION_VERSION;
    arrayOfStandardSystemProperty[5] = JAVA_VM_SPECIFICATION_VENDOR;
    arrayOfStandardSystemProperty[6] = JAVA_VM_SPECIFICATION_NAME;
    arrayOfStandardSystemProperty[7] = JAVA_VM_VERSION;
    arrayOfStandardSystemProperty[8] = JAVA_VM_VENDOR;
    arrayOfStandardSystemProperty[9] = JAVA_VM_NAME;
    arrayOfStandardSystemProperty[10] = JAVA_SPECIFICATION_VERSION;
    arrayOfStandardSystemProperty[11] = JAVA_SPECIFICATION_VENDOR;
    arrayOfStandardSystemProperty[12] = JAVA_SPECIFICATION_NAME;
    arrayOfStandardSystemProperty[13] = JAVA_CLASS_VERSION;
    arrayOfStandardSystemProperty[14] = JAVA_CLASS_PATH;
    arrayOfStandardSystemProperty[15] = JAVA_LIBRARY_PATH;
    arrayOfStandardSystemProperty[16] = JAVA_IO_TMPDIR;
    arrayOfStandardSystemProperty[17] = JAVA_COMPILER;
    arrayOfStandardSystemProperty[18] = JAVA_EXT_DIRS;
    arrayOfStandardSystemProperty[19] = OS_NAME;
    arrayOfStandardSystemProperty[20] = OS_ARCH;
    arrayOfStandardSystemProperty[21] = OS_VERSION;
    arrayOfStandardSystemProperty[22] = FILE_SEPARATOR;
    arrayOfStandardSystemProperty[23] = PATH_SEPARATOR;
    arrayOfStandardSystemProperty[24] = LINE_SEPARATOR;
    arrayOfStandardSystemProperty[25] = USER_NAME;
    arrayOfStandardSystemProperty[26] = USER_HOME;
    arrayOfStandardSystemProperty[27] = USER_DIR;
  }

  private StandardSystemProperty(String paramString)
  {
    this.key = paramString;
  }

  public String key()
  {
    return this.key;
  }

  public String toString()
  {
    String str1 = String.valueOf(String.valueOf(key()));
    String str2 = String.valueOf(String.valueOf(value()));
    return 1 + str1.length() + str2.length() + str1 + "=" + str2;
  }

  @Nullable
  public String value()
  {
    return System.getProperty(this.key);
  }
}