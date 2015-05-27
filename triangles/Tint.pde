class Tint {
  int hueDelta = 1;
  int saturationDelta = 0;
  int brightnessDelta = 0;

  color more(color baseColor) {
    float h = hue(baseColor);
    float s = saturation(baseColor);
    float b = brightness(baseColor);
    h += hueDelta;
    s += saturationDelta;
    b += brightnessDelta;
    h %= 100;
    if (s > 99) {
      s = 99;
    }
    if (b > 99) {
      b = 99;
    }
    return color(h, s, b);
  }
  color less(color baseColor) {
    float h = hue(baseColor);
    float s = saturation(baseColor);
    float b = brightness(baseColor);
    h -= hueDelta;
    s -= saturationDelta;
    b -= brightnessDelta;
    h %= 100;
    if (s < 0) {
      s = 0;
    }
    if (b < 0) {
      b = 0;
    }
    return color(h, s, b);
  }

  void moreHue() {  //hue variables should work like endless knobs - rotate around forever.
    hueDelta++;
    if (hueDelta > 99){
      hueDelta = 99;
    }
  }
  void lessHue() {
    hueDelta--;
    if (hueDelta < 0){
      hueDelta = 0;
    }
  }
  void moreSaturation() {
    saturationDelta++;
    if (saturationDelta > 99) {
      saturationDelta = 99;
    }
  }
  void lessSaturation() {
    saturationDelta--;
    if (saturationDelta < 0) {
      saturationDelta = 0;
    }
  }
  void brighter() {
    brightnessDelta++;
    if (brightnessDelta > 100) {
      brightnessDelta = 100;
    }
  }
  void darker() {
    brightnessDelta--;
    if (brightnessDelta < 0) {
      brightnessDelta = 0;
    }
  }
}

