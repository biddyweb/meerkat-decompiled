package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import java.lang.annotation.Annotation;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({java.lang.annotation.ElementType.TYPE})
public @interface Descriptor
{
  public abstract int objectTypeIndication();

  public abstract int[] tags();
}