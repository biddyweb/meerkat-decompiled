package com.mixpanel.android.mpmetrics;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Survey
  implements Parcelable
{
  public static Parcelable.Creator<Survey> CREATOR = new Parcelable.Creator()
  {
    public Survey createFromParcel(Parcel paramAnonymousParcel)
    {
      String str = paramAnonymousParcel.readString();
      try
      {
        Survey localSurvey = new Survey(new JSONObject(str));
        return localSurvey;
      }
      catch (JSONException localJSONException)
      {
        throw new RuntimeException("Corrupted JSON object written to survey parcel.", localJSONException);
      }
      catch (BadDecideObjectException localBadDecideObjectException)
      {
        throw new RuntimeException("Unexpected or incomplete object written to survey parcel.", localBadDecideObjectException);
      }
    }

    public Survey[] newArray(int paramAnonymousInt)
    {
      return new Survey[paramAnonymousInt];
    }
  };
  private final int mCollectionId;
  private final JSONObject mDescription;
  private final int mId;
  private final List<Question> mQuestions;

  Survey(JSONObject paramJSONObject)
    throws BadDecideObjectException
  {
    JSONArray localJSONArray;
    try
    {
      this.mDescription = paramJSONObject;
      this.mId = paramJSONObject.getInt("id");
      this.mCollectionId = paramJSONObject.getJSONArray("collections").getJSONObject(0).getInt("id");
      localJSONArray = paramJSONObject.getJSONArray("questions");
      if (localJSONArray.length() == 0)
        throw new BadDecideObjectException("Survey has no questions.");
    }
    catch (JSONException localJSONException)
    {
      throw new BadDecideObjectException("Survey JSON was unexpected or bad", localJSONException);
    }
    ArrayList localArrayList = new ArrayList(localJSONArray.length());
    for (int i = 0; i < localJSONArray.length(); i++)
      localArrayList.add(new Question(localJSONArray.getJSONObject(i), null));
    this.mQuestions = Collections.unmodifiableList(localArrayList);
  }

  public int describeContents()
  {
    return 0;
  }

  public int getCollectionId()
  {
    return this.mCollectionId;
  }

  public int getId()
  {
    return this.mId;
  }

  public List<Question> getQuestions()
  {
    return this.mQuestions;
  }

  String toJSON()
  {
    return this.mDescription.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(toJSON());
  }

  public class Question
  {
    private final List<String> mChoices;
    private final String mPrompt;
    private final int mQuestionId;
    private final String mQuestionType;

    private Question(JSONObject arg2)
      throws JSONException, BadDecideObjectException
    {
      Object localObject1;
      this.mQuestionId = localObject1.getInt("id");
      this.mQuestionType = localObject1.getString("type");
      this.mPrompt = localObject1.getString("prompt");
      Object localObject2 = Collections.emptyList();
      if (localObject1.has("extra_data"))
      {
        JSONObject localJSONObject = localObject1.getJSONObject("extra_data");
        if (localJSONObject.has("$choices"))
        {
          JSONArray localJSONArray = localJSONObject.getJSONArray("$choices");
          localObject2 = new ArrayList(localJSONArray.length());
          for (int i = 0; i < localJSONArray.length(); i++)
            ((List)localObject2).add(localJSONArray.getString(i));
        }
      }
      this.mChoices = Collections.unmodifiableList((List)localObject2);
      if ((getType() == Survey.QuestionType.MULTIPLE_CHOICE) && (this.mChoices.size() == 0))
        throw new BadDecideObjectException("Question is multiple choice but has no answers:" + localObject1.toString());
    }

    public List<String> getChoices()
    {
      return this.mChoices;
    }

    public int getId()
    {
      return this.mQuestionId;
    }

    public String getPrompt()
    {
      return this.mPrompt;
    }

    public Survey.QuestionType getType()
    {
      if (Survey.QuestionType.MULTIPLE_CHOICE.toString().equals(this.mQuestionType))
        return Survey.QuestionType.MULTIPLE_CHOICE;
      if (Survey.QuestionType.TEXT.toString().equals(this.mQuestionType))
        return Survey.QuestionType.TEXT;
      return Survey.QuestionType.UNKNOWN;
    }
  }

  public static enum QuestionType
  {
    static
    {
      // Byte code:
      //   0: new 15\011com/mixpanel/android/mpmetrics/Survey$QuestionType$1
      //   3: dup
      //   4: ldc 16
      //   6: iconst_0
      //   7: invokespecial 20\011com/mixpanel/android/mpmetrics/Survey$QuestionType$1:<init>\011(Ljava/lang/String;I)V
      //   10: putstatic 22\011com/mixpanel/android/mpmetrics/Survey$QuestionType:UNKNOWN\011Lcom/mixpanel/android/mpmetrics/Survey$QuestionType;
      //   13: new 24\011com/mixpanel/android/mpmetrics/Survey$QuestionType$2
      //   16: dup
      //   17: ldc 25
      //   19: iconst_1
      //   20: invokespecial 26\011com/mixpanel/android/mpmetrics/Survey$QuestionType$2:<init>\011(Ljava/lang/String;I)V
      //   23: putstatic 28\011com/mixpanel/android/mpmetrics/Survey$QuestionType:MULTIPLE_CHOICE\011Lcom/mixpanel/android/mpmetrics/Survey$QuestionType;
      //   26: new 30\011com/mixpanel/android/mpmetrics/Survey$QuestionType$3
      //   29: dup
      //   30: ldc 31
      //   32: iconst_2
      //   33: invokespecial 32\011com/mixpanel/android/mpmetrics/Survey$QuestionType$3:<init>\011(Ljava/lang/String;I)V
      //   36: putstatic 34\011com/mixpanel/android/mpmetrics/Survey$QuestionType:TEXT\011Lcom/mixpanel/android/mpmetrics/Survey$QuestionType;
      //   39: iconst_3
      //   40: anewarray 2\011com/mixpanel/android/mpmetrics/Survey$QuestionType
      //   43: astore_0
      //   44: aload_0
      //   45: iconst_0
      //   46: getstatic 22\011com/mixpanel/android/mpmetrics/Survey$QuestionType:UNKNOWN\011Lcom/mixpanel/android/mpmetrics/Survey$QuestionType;
      //   49: aastore
      //   50: aload_0
      //   51: iconst_1
      //   52: getstatic 28\011com/mixpanel/android/mpmetrics/Survey$QuestionType:MULTIPLE_CHOICE\011Lcom/mixpanel/android/mpmetrics/Survey$QuestionType;
      //   55: aastore
      //   56: aload_0
      //   57: iconst_2
      //   58: getstatic 34\011com/mixpanel/android/mpmetrics/Survey$QuestionType:TEXT\011Lcom/mixpanel/android/mpmetrics/Survey$QuestionType;
      //   61: aastore
      //   62: aload_0
      //   63: putstatic 36\011com/mixpanel/android/mpmetrics/Survey$QuestionType:$VALUES\011[Lcom/mixpanel/android/mpmetrics/Survey$QuestionType;
      //   66: return
    }
  }
}