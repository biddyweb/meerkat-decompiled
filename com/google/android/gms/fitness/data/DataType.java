package com.google.android.gms.fitness.data;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzls;
import com.google.android.gms.internal.zzmp;
import com.google.android.gms.internal.zzxc.zzc;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class DataType
  implements SafeParcelable
{
  public static final DataType AGGREGATE_ACTIVITY_SUMMARY;
  public static final DataType AGGREGATE_BASAL_METABOLIC_RATE_SUMMARY;
  public static final DataType AGGREGATE_BODY_FAT_PERCENTAGE_SUMMARY;
  public static final DataType AGGREGATE_CALORIES_CONSUMED;
  public static final DataType AGGREGATE_CALORIES_EXPENDED;
  public static final DataType AGGREGATE_DISTANCE_DELTA;
  public static final DataType AGGREGATE_HEART_RATE_SUMMARY;
  public static final Set<DataType> AGGREGATE_INPUT_TYPES;
  public static final DataType AGGREGATE_LOCATION_BOUNDING_BOX;
  public static final DataType AGGREGATE_POWER_SUMMARY;
  public static final DataType AGGREGATE_SPEED_SUMMARY;
  public static final DataType AGGREGATE_STEP_COUNT_DELTA;
  public static final DataType AGGREGATE_WEIGHT_SUMMARY;
  public static final Parcelable.Creator<DataType> CREATOR = new zzh();
  public static final String MIME_TYPE_PREFIX = "vnd.google.fitness.data_type/";
  public static final DataType TYPE_ACTIVITY_SAMPLE;
  public static final DataType TYPE_ACTIVITY_SEGMENT;
  public static final DataType TYPE_BASAL_METABOLIC_RATE;
  public static final DataType TYPE_BODY_FAT_PERCENTAGE;
  public static final DataType TYPE_CALORIES_CONSUMED;
  public static final DataType TYPE_CALORIES_EXPENDED;
  public static final DataType TYPE_CYCLING_PEDALING_CADENCE;
  public static final DataType TYPE_CYCLING_PEDALING_CUMULATIVE;
  public static final DataType TYPE_CYCLING_WHEEL_REVOLUTION;
  public static final DataType TYPE_CYCLING_WHEEL_RPM;
  public static final DataType TYPE_DISTANCE_CUMULATIVE;
  public static final DataType TYPE_DISTANCE_DELTA;
  public static final DataType TYPE_HEART_RATE_BPM;
  public static final DataType TYPE_HEIGHT;
  public static final DataType TYPE_LOCATION_SAMPLE;
  public static final DataType TYPE_LOCATION_TRACK;
  public static final DataType TYPE_POWER_SAMPLE;
  public static final DataType TYPE_SPEED;
  public static final DataType TYPE_STEP_COUNT_CADENCE;
  public static final DataType TYPE_STEP_COUNT_CUMULATIVE;
  public static final DataType TYPE_STEP_COUNT_DELTA;
  public static final DataType TYPE_WEIGHT;
  public static final DataType zzYS;
  public static final DataType zzYT;
  public static final DataType zzYU;
  public static final DataType zzYV;
  public static final DataType zzYW;
  public static final DataType zzYX;
  public static final DataType zzYY;
  public static final DataType zzYZ;
  private static final Map<DataType, List<DataType>> zzZa;
  public static final DataType[] zzZb;
  public static final String[] zzZc;
  private final String mName;
  private final int zzFG;
  private final List<Field> zzZd;

  static
  {
    Field[] arrayOfField1 = new Field[1];
    arrayOfField1[0] = Field.FIELD_STEPS;
    TYPE_STEP_COUNT_DELTA = new DataType("com.google.step_count.delta", arrayOfField1);
    Field[] arrayOfField2 = new Field[1];
    arrayOfField2[0] = Field.FIELD_STEPS;
    TYPE_STEP_COUNT_CUMULATIVE = new DataType("com.google.step_count.cumulative", arrayOfField2);
    Field[] arrayOfField3 = new Field[1];
    arrayOfField3[0] = Field.FIELD_RPM;
    TYPE_STEP_COUNT_CADENCE = new DataType("com.google.step_count.cadence", arrayOfField3);
    Field[] arrayOfField4 = new Field[1];
    arrayOfField4[0] = Field.FIELD_ACTIVITY;
    TYPE_ACTIVITY_SEGMENT = new DataType("com.google.activity.segment", arrayOfField4);
    Field[] arrayOfField5 = new Field[1];
    arrayOfField5[0] = Field.FIELD_CALORIES;
    TYPE_CALORIES_CONSUMED = new DataType("com.google.calories.consumed", arrayOfField5);
    Field[] arrayOfField6 = new Field[1];
    arrayOfField6[0] = Field.FIELD_CALORIES;
    TYPE_CALORIES_EXPENDED = new DataType("com.google.calories.expended", arrayOfField6);
    Field[] arrayOfField7 = new Field[1];
    arrayOfField7[0] = Field.FIELD_CALORIES;
    TYPE_BASAL_METABOLIC_RATE = new DataType("com.google.calories.bmr", arrayOfField7);
    Field[] arrayOfField8 = new Field[1];
    arrayOfField8[0] = Field.FIELD_WATTS;
    TYPE_POWER_SAMPLE = new DataType("com.google.power.sample", arrayOfField8);
    Field[] arrayOfField9 = new Field[2];
    arrayOfField9[0] = Field.FIELD_ACTIVITY;
    arrayOfField9[1] = Field.FIELD_CONFIDENCE;
    TYPE_ACTIVITY_SAMPLE = new DataType("com.google.activity.sample", arrayOfField9);
    Field[] arrayOfField10 = new Field[2];
    arrayOfField10[0] = Field.FIELD_ACTIVITY;
    arrayOfField10[1] = Field.zzZA;
    zzYS = new DataType("com.google.activity.edge", arrayOfField10);
    Field[] arrayOfField11 = new Field[3];
    arrayOfField11[0] = Field.zzZB;
    arrayOfField11[1] = Field.zzZC;
    arrayOfField11[2] = Field.zzZD;
    zzYT = new DataType("com.google.accelerometer", arrayOfField11);
    Field[] arrayOfField12 = new Field[1];
    arrayOfField12[0] = Field.FIELD_BPM;
    TYPE_HEART_RATE_BPM = new DataType("com.google.heart_rate.bpm", arrayOfField12);
    Field[] arrayOfField13 = new Field[4];
    arrayOfField13[0] = Field.FIELD_LATITUDE;
    arrayOfField13[1] = Field.FIELD_LONGITUDE;
    arrayOfField13[2] = Field.FIELD_ACCURACY;
    arrayOfField13[3] = Field.FIELD_ALTITUDE;
    TYPE_LOCATION_SAMPLE = new DataType("com.google.location.sample", arrayOfField13);
    Field[] arrayOfField14 = new Field[4];
    arrayOfField14[0] = Field.FIELD_LATITUDE;
    arrayOfField14[1] = Field.FIELD_LONGITUDE;
    arrayOfField14[2] = Field.FIELD_ACCURACY;
    arrayOfField14[3] = Field.FIELD_ALTITUDE;
    TYPE_LOCATION_TRACK = new DataType("com.google.location.track", arrayOfField14);
    Field[] arrayOfField15 = new Field[1];
    arrayOfField15[0] = Field.FIELD_DISTANCE;
    TYPE_DISTANCE_DELTA = new DataType("com.google.distance.delta", arrayOfField15);
    Field[] arrayOfField16 = new Field[1];
    arrayOfField16[0] = Field.FIELD_DISTANCE;
    TYPE_DISTANCE_CUMULATIVE = new DataType("com.google.distance.cumulative", arrayOfField16);
    Field[] arrayOfField17 = new Field[1];
    arrayOfField17[0] = Field.FIELD_SPEED;
    TYPE_SPEED = new DataType("com.google.speed", arrayOfField17);
    Field[] arrayOfField18 = new Field[1];
    arrayOfField18[0] = Field.FIELD_REVOLUTIONS;
    TYPE_CYCLING_WHEEL_REVOLUTION = new DataType("com.google.cycling.wheel_revolution.cumulative", arrayOfField18);
    Field[] arrayOfField19 = new Field[1];
    arrayOfField19[0] = Field.FIELD_RPM;
    TYPE_CYCLING_WHEEL_RPM = new DataType("com.google.cycling.wheel_revolution.rpm", arrayOfField19);
    Field[] arrayOfField20 = new Field[1];
    arrayOfField20[0] = Field.FIELD_REVOLUTIONS;
    TYPE_CYCLING_PEDALING_CUMULATIVE = new DataType("com.google.cycling.pedaling.cumulative", arrayOfField20);
    Field[] arrayOfField21 = new Field[1];
    arrayOfField21[0] = Field.FIELD_RPM;
    TYPE_CYCLING_PEDALING_CADENCE = new DataType("com.google.cycling.pedaling.cadence", arrayOfField21);
    Field[] arrayOfField22 = new Field[1];
    arrayOfField22[0] = Field.FIELD_HEIGHT;
    TYPE_HEIGHT = new DataType("com.google.height", arrayOfField22);
    Field[] arrayOfField23 = new Field[1];
    arrayOfField23[0] = Field.FIELD_WEIGHT;
    TYPE_WEIGHT = new DataType("com.google.weight", arrayOfField23);
    Field[] arrayOfField24 = new Field[1];
    arrayOfField24[0] = Field.FIELD_PERCENTAGE;
    TYPE_BODY_FAT_PERCENTAGE = new DataType("com.google.body.fat.percentage", arrayOfField24);
    Field[] arrayOfField25 = new Field[1];
    arrayOfField25[0] = Field.FIELD_CIRCUMFERENCE;
    zzYU = new DataType("com.google.body.waist.circumference", arrayOfField25);
    Field[] arrayOfField26 = new Field[1];
    arrayOfField26[0] = Field.FIELD_CIRCUMFERENCE;
    zzYV = new DataType("com.google.body.hip.circumference", arrayOfField26);
    Field[] arrayOfField27 = new Field[18];
    arrayOfField27[0] = Field.zzZi;
    arrayOfField27[1] = Field.FIELD_CALORIES;
    arrayOfField27[2] = Field.zzZj;
    arrayOfField27[3] = Field.zzZk;
    arrayOfField27[4] = Field.zzZl;
    arrayOfField27[5] = Field.zzZm;
    arrayOfField27[6] = Field.zzZn;
    arrayOfField27[7] = Field.zzZo;
    arrayOfField27[8] = Field.zzZp;
    arrayOfField27[9] = Field.zzZq;
    arrayOfField27[10] = Field.zzZr;
    arrayOfField27[11] = Field.zzZs;
    arrayOfField27[12] = Field.zzZt;
    arrayOfField27[13] = Field.zzZu;
    arrayOfField27[14] = Field.zzZv;
    arrayOfField27[15] = Field.zzZw;
    arrayOfField27[16] = Field.zzZx;
    arrayOfField27[17] = Field.zzZy;
    zzYW = new DataType("com.google.nutrition.meal", arrayOfField27);
    DataType[] arrayOfDataType1 = new DataType[13];
    arrayOfDataType1[0] = TYPE_STEP_COUNT_DELTA;
    arrayOfDataType1[1] = TYPE_DISTANCE_DELTA;
    arrayOfDataType1[2] = TYPE_ACTIVITY_SEGMENT;
    arrayOfDataType1[3] = TYPE_SPEED;
    arrayOfDataType1[4] = TYPE_HEART_RATE_BPM;
    arrayOfDataType1[5] = TYPE_WEIGHT;
    arrayOfDataType1[6] = TYPE_LOCATION_SAMPLE;
    arrayOfDataType1[7] = TYPE_CALORIES_CONSUMED;
    arrayOfDataType1[8] = TYPE_CALORIES_EXPENDED;
    arrayOfDataType1[9] = TYPE_BODY_FAT_PERCENTAGE;
    arrayOfDataType1[10] = zzYV;
    arrayOfDataType1[11] = zzYU;
    arrayOfDataType1[12] = zzYW;
    AGGREGATE_INPUT_TYPES = Collections.unmodifiableSet(new HashSet(Arrays.asList(arrayOfDataType1)));
    Field[] arrayOfField28 = new Field[3];
    arrayOfField28[0] = Field.FIELD_ACTIVITY;
    arrayOfField28[1] = Field.FIELD_DURATION;
    arrayOfField28[2] = Field.zzZz;
    AGGREGATE_ACTIVITY_SUMMARY = new DataType("com.google.activity.summary", arrayOfField28);
    Field[] arrayOfField29 = new Field[3];
    arrayOfField29[0] = Field.FIELD_AVERAGE;
    arrayOfField29[1] = Field.FIELD_MAX;
    arrayOfField29[2] = Field.FIELD_MIN;
    AGGREGATE_BASAL_METABOLIC_RATE_SUMMARY = new DataType("com.google.calories.bmr.summary", arrayOfField29);
    AGGREGATE_STEP_COUNT_DELTA = TYPE_STEP_COUNT_DELTA;
    AGGREGATE_DISTANCE_DELTA = TYPE_DISTANCE_DELTA;
    AGGREGATE_CALORIES_CONSUMED = TYPE_CALORIES_CONSUMED;
    AGGREGATE_CALORIES_EXPENDED = TYPE_CALORIES_EXPENDED;
    Field[] arrayOfField30 = new Field[3];
    arrayOfField30[0] = Field.FIELD_AVERAGE;
    arrayOfField30[1] = Field.FIELD_MAX;
    arrayOfField30[2] = Field.FIELD_MIN;
    AGGREGATE_HEART_RATE_SUMMARY = new DataType("com.google.heart_rate.summary", arrayOfField30);
    Field[] arrayOfField31 = new Field[4];
    arrayOfField31[0] = Field.FIELD_LOW_LATITUDE;
    arrayOfField31[1] = Field.FIELD_LOW_LONGITUDE;
    arrayOfField31[2] = Field.FIELD_HIGH_LATITUDE;
    arrayOfField31[3] = Field.FIELD_HIGH_LONGITUDE;
    AGGREGATE_LOCATION_BOUNDING_BOX = new DataType("com.google.location.bounding_box", arrayOfField31);
    Field[] arrayOfField32 = new Field[3];
    arrayOfField32[0] = Field.FIELD_AVERAGE;
    arrayOfField32[1] = Field.FIELD_MAX;
    arrayOfField32[2] = Field.FIELD_MIN;
    AGGREGATE_POWER_SUMMARY = new DataType("com.google.power.summary", arrayOfField32);
    Field[] arrayOfField33 = new Field[3];
    arrayOfField33[0] = Field.FIELD_AVERAGE;
    arrayOfField33[1] = Field.FIELD_MAX;
    arrayOfField33[2] = Field.FIELD_MIN;
    AGGREGATE_SPEED_SUMMARY = new DataType("com.google.speed.summary", arrayOfField33);
    Field[] arrayOfField34 = new Field[3];
    arrayOfField34[0] = Field.FIELD_AVERAGE;
    arrayOfField34[1] = Field.FIELD_MAX;
    arrayOfField34[2] = Field.FIELD_MIN;
    AGGREGATE_BODY_FAT_PERCENTAGE_SUMMARY = new DataType("com.google.body.fat.percentage.summary", arrayOfField34);
    Field[] arrayOfField35 = new Field[3];
    arrayOfField35[0] = Field.FIELD_AVERAGE;
    arrayOfField35[1] = Field.FIELD_MAX;
    arrayOfField35[2] = Field.FIELD_MIN;
    zzYX = new DataType("com.google.body.hip.circumference.summary", arrayOfField35);
    Field[] arrayOfField36 = new Field[3];
    arrayOfField36[0] = Field.FIELD_AVERAGE;
    arrayOfField36[1] = Field.FIELD_MAX;
    arrayOfField36[2] = Field.FIELD_MIN;
    zzYY = new DataType("com.google.body.waist.circumference.summary", arrayOfField36);
    Field[] arrayOfField37 = new Field[3];
    arrayOfField37[0] = Field.FIELD_AVERAGE;
    arrayOfField37[1] = Field.FIELD_MAX;
    arrayOfField37[2] = Field.FIELD_MIN;
    AGGREGATE_WEIGHT_SUMMARY = new DataType("com.google.weight.summary", arrayOfField37);
    Field[] arrayOfField38 = new Field[17];
    arrayOfField38[0] = Field.FIELD_CALORIES;
    arrayOfField38[1] = Field.zzZj;
    arrayOfField38[2] = Field.zzZk;
    arrayOfField38[3] = Field.zzZl;
    arrayOfField38[4] = Field.zzZm;
    arrayOfField38[5] = Field.zzZn;
    arrayOfField38[6] = Field.zzZo;
    arrayOfField38[7] = Field.zzZp;
    arrayOfField38[8] = Field.zzZq;
    arrayOfField38[9] = Field.zzZr;
    arrayOfField38[10] = Field.zzZs;
    arrayOfField38[11] = Field.zzZt;
    arrayOfField38[12] = Field.zzZu;
    arrayOfField38[13] = Field.zzZv;
    arrayOfField38[14] = Field.zzZw;
    arrayOfField38[15] = Field.zzZx;
    arrayOfField38[16] = Field.zzZy;
    zzYZ = new DataType("com.google.nutrition.summary", arrayOfField38);
    zzZa = new HashMap()
    {
    };
    DataType[] arrayOfDataType2 = new DataType[38];
    arrayOfDataType2[0] = zzYT;
    arrayOfDataType2[1] = zzYS;
    arrayOfDataType2[2] = TYPE_ACTIVITY_SAMPLE;
    arrayOfDataType2[3] = TYPE_ACTIVITY_SEGMENT;
    arrayOfDataType2[4] = AGGREGATE_ACTIVITY_SUMMARY;
    arrayOfDataType2[5] = TYPE_BODY_FAT_PERCENTAGE;
    arrayOfDataType2[6] = AGGREGATE_BODY_FAT_PERCENTAGE_SUMMARY;
    arrayOfDataType2[7] = zzYV;
    arrayOfDataType2[8] = zzYX;
    arrayOfDataType2[9] = zzYU;
    arrayOfDataType2[10] = zzYY;
    arrayOfDataType2[11] = TYPE_BASAL_METABOLIC_RATE;
    arrayOfDataType2[12] = AGGREGATE_BASAL_METABOLIC_RATE_SUMMARY;
    arrayOfDataType2[13] = TYPE_CALORIES_CONSUMED;
    arrayOfDataType2[14] = TYPE_CALORIES_EXPENDED;
    arrayOfDataType2[15] = TYPE_CYCLING_PEDALING_CADENCE;
    arrayOfDataType2[16] = TYPE_CYCLING_PEDALING_CUMULATIVE;
    arrayOfDataType2[17] = TYPE_CYCLING_WHEEL_REVOLUTION;
    arrayOfDataType2[18] = TYPE_CYCLING_WHEEL_RPM;
    arrayOfDataType2[19] = TYPE_DISTANCE_CUMULATIVE;
    arrayOfDataType2[20] = TYPE_DISTANCE_DELTA;
    arrayOfDataType2[21] = TYPE_HEART_RATE_BPM;
    arrayOfDataType2[22] = AGGREGATE_HEART_RATE_SUMMARY;
    arrayOfDataType2[23] = TYPE_HEIGHT;
    arrayOfDataType2[24] = AGGREGATE_LOCATION_BOUNDING_BOX;
    arrayOfDataType2[25] = TYPE_LOCATION_SAMPLE;
    arrayOfDataType2[26] = TYPE_LOCATION_TRACK;
    arrayOfDataType2[27] = zzYW;
    arrayOfDataType2[28] = zzYZ;
    arrayOfDataType2[29] = TYPE_POWER_SAMPLE;
    arrayOfDataType2[30] = AGGREGATE_POWER_SUMMARY;
    arrayOfDataType2[31] = TYPE_SPEED;
    arrayOfDataType2[32] = AGGREGATE_SPEED_SUMMARY;
    arrayOfDataType2[33] = TYPE_STEP_COUNT_CADENCE;
    arrayOfDataType2[34] = TYPE_STEP_COUNT_CUMULATIVE;
    arrayOfDataType2[35] = TYPE_STEP_COUNT_DELTA;
    arrayOfDataType2[36] = TYPE_WEIGHT;
    arrayOfDataType2[37] = AGGREGATE_WEIGHT_SUMMARY;
    zzZb = arrayOfDataType2;
    String[] arrayOfString = new String[38];
    arrayOfString[0] = zzYT.getName();
    arrayOfString[1] = zzYS.getName();
    arrayOfString[2] = TYPE_ACTIVITY_SAMPLE.getName();
    arrayOfString[3] = TYPE_ACTIVITY_SEGMENT.getName();
    arrayOfString[4] = AGGREGATE_ACTIVITY_SUMMARY.getName();
    arrayOfString[5] = TYPE_BODY_FAT_PERCENTAGE.getName();
    arrayOfString[6] = AGGREGATE_BODY_FAT_PERCENTAGE_SUMMARY.getName();
    arrayOfString[7] = zzYV.getName();
    arrayOfString[8] = zzYX.getName();
    arrayOfString[9] = zzYU.getName();
    arrayOfString[10] = zzYY.getName();
    arrayOfString[11] = TYPE_BASAL_METABOLIC_RATE.getName();
    arrayOfString[12] = AGGREGATE_BASAL_METABOLIC_RATE_SUMMARY.getName();
    arrayOfString[13] = TYPE_CALORIES_CONSUMED.getName();
    arrayOfString[14] = TYPE_CALORIES_EXPENDED.getName();
    arrayOfString[15] = TYPE_CYCLING_PEDALING_CADENCE.getName();
    arrayOfString[16] = TYPE_CYCLING_PEDALING_CUMULATIVE.getName();
    arrayOfString[17] = TYPE_CYCLING_WHEEL_REVOLUTION.getName();
    arrayOfString[18] = TYPE_CYCLING_WHEEL_RPM.getName();
    arrayOfString[19] = TYPE_DISTANCE_CUMULATIVE.getName();
    arrayOfString[20] = TYPE_DISTANCE_DELTA.getName();
    arrayOfString[21] = TYPE_HEART_RATE_BPM.getName();
    arrayOfString[22] = AGGREGATE_HEART_RATE_SUMMARY.getName();
    arrayOfString[23] = TYPE_HEIGHT.getName();
    arrayOfString[24] = AGGREGATE_LOCATION_BOUNDING_BOX.getName();
    arrayOfString[25] = TYPE_LOCATION_SAMPLE.getName();
    arrayOfString[26] = TYPE_LOCATION_TRACK.getName();
    arrayOfString[27] = zzYW.getName();
    arrayOfString[28] = zzYZ.getName();
    arrayOfString[29] = TYPE_POWER_SAMPLE.getName();
    arrayOfString[30] = AGGREGATE_POWER_SUMMARY.getName();
    arrayOfString[31] = TYPE_SPEED.getName();
    arrayOfString[32] = AGGREGATE_SPEED_SUMMARY.getName();
    arrayOfString[33] = TYPE_STEP_COUNT_CADENCE.getName();
    arrayOfString[34] = TYPE_STEP_COUNT_CUMULATIVE.getName();
    arrayOfString[35] = TYPE_STEP_COUNT_DELTA.getName();
    arrayOfString[36] = TYPE_WEIGHT.getName();
    arrayOfString[37] = AGGREGATE_WEIGHT_SUMMARY.getName();
    zzZc = arrayOfString;
  }

  DataType(int paramInt, String paramString, List<Field> paramList)
  {
    this.zzFG = paramInt;
    this.mName = paramString;
    this.zzZd = Collections.unmodifiableList(paramList);
  }

  public DataType(String paramString, Field[] paramArrayOfField)
  {
    this(1, paramString, zzls.zzb(paramArrayOfField));
  }

  public static List<DataType> getAggregatesForInput(DataType paramDataType)
  {
    List localList = (List)zzZa.get(paramDataType);
    if (localList == null)
      return Collections.emptyList();
    return Collections.unmodifiableList(localList);
  }

  public static String getMimeType(DataType paramDataType)
  {
    return "vnd.google.fitness.data_type/" + paramDataType.getName();
  }

  private boolean zza(DataType paramDataType)
  {
    return (this.mName.equals(paramDataType.mName)) && (this.zzZd.equals(paramDataType.zzZd));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof DataType)) && (zza((DataType)paramObject)));
  }

  public List<Field> getFields()
  {
    return this.zzZd;
  }

  public String getName()
  {
    return this.mName;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return this.mName.hashCode();
  }

  public int indexOf(Field paramField)
  {
    if (this.zzZd.contains(paramField))
      return this.zzZd.indexOf(paramField);
    throw new IllegalArgumentException(String.format("%s not a field of %s", new Object[] { paramField, this }));
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.mName;
    arrayOfObject[1] = this.zzZd;
    return String.format("DataType{%s%s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzh.zza(this, paramParcel, paramInt);
  }

  public String zzlB()
  {
    if (this.mName.startsWith("com.google."))
      return this.mName.substring(11);
    return this.mName;
  }

  public zzxc.zzc zzlC()
  {
    return zzmp.zzZU.zzc(this);
  }
}