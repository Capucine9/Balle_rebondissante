class HScrollbar {
  int scrollwidth, scrollheight;    // width and height of bar
  float scrollxpos, scrollypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float valMin, valMax; // max and min values of slider
  int larg;              // largeur du bouton 
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    scrollwidth = sw;
    scrollheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    scrollxpos = xp;
    scrollypos = yp-scrollheight/2;
    spos = scrollxpos + scrollwidth/2 - scrollheight/2;
    newspos = spos;
    valMin = scrollxpos;
    valMax = scrollxpos + scrollwidth - scrollheight;
    larg = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (ScrollMousePress && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-scrollheight/2, valMin, valMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/larg;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > scrollxpos && mouseX < scrollxpos+scrollwidth &&
      mouseY > scrollypos && mouseY < scrollypos+scrollheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(scrollxpos, scrollypos, scrollwidth, scrollheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, scrollypos, scrollheight, scrollheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}
