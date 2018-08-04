// Interpolated value that changes with plant age.
class Value {
  float start = 0f;
  float end = 1f;
  boolean smooth = false;

  Value() {
  }

  Value(boolean smooth) {
    this.smooth = smooth;
  }

  Value(float start, float end, boolean smooth) {
    this.start = start;
    this.end = end;
    this.smooth = smooth;
  }

  Value(float start, float end) {
    this(start, end, false);
  }

  float get() {
    return get(0.5f);
  }

  float get(PlantContext context) {
    return get(context.age);
  }

  float get(float pos) {
    if (smooth) {
      return smoothMix(pos, start, end);
    }
    else {
      return mix(pos, start, end);
    }
  }
}
