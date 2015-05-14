package co.getair.meerkat.utilities;

import android.app.Dialog;
import android.app.TimePickerDialog;
import android.app.TimePickerDialog.OnTimeSetListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.text.format.DateFormat;
import android.widget.TimePicker;
import java.util.Calendar;
import java.util.Date;

public class TimePickerFragment extends DialogFragment
  implements TimePickerDialog.OnTimeSetListener
{
  RunnableWithResultObject dateSelectedRunnable;

  public static TimePickerFragment newInstance()
  {
    return new TimePickerFragment();
  }

  public Dialog onCreateDialog(Bundle paramBundle)
  {
    Calendar localCalendar = Calendar.getInstance();
    int i = localCalendar.get(11);
    int j = localCalendar.get(12);
    return new TimePickerDialog(getActivity(), this, i, j, DateFormat.is24HourFormat(getActivity()));
  }

  public void onTimeSet(TimePicker paramTimePicker, int paramInt1, int paramInt2)
  {
    if (this.dateSelectedRunnable == null)
      return;
    Calendar localCalendar = Calendar.getInstance();
    localCalendar.setTime(new Date());
    localCalendar.set(11, paramInt1);
    localCalendar.set(12, paramInt2);
    long l1 = System.currentTimeMillis();
    long l2 = localCalendar.getTimeInMillis() - l1;
    if (l2 <= 0L)
      l2 += 86400000L;
    if (l2 > 86401000L)
      l2 -= 86400000L;
    Date localDate = new Date(l1 + l2);
    this.dateSelectedRunnable.resultObject = localDate;
    new Thread(this.dateSelectedRunnable).start();
  }

  public void setDateSelectedRunnable(RunnableWithResultObject paramRunnableWithResultObject)
  {
    this.dateSelectedRunnable = paramRunnableWithResultObject;
  }
}