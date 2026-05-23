import 'dart:math';

class ColorUtils {
  static String rgbToHex(int r, int g, int b) {
    String hex =
        '#${(r.toRadixString(16).padLeft(2, '0') + g.toRadixString(16).padLeft(2, '0') + b.toRadixString(16).padLeft(2, '0')).toUpperCase()}';
    return hex;
  }

  static ({double h, double s, double l}) rgbToHsl(int r, int g, int b) {
    double rn = r / 255;
    double gn = g / 255;
    double bn = b / 255;

    double mini = min(rn, min(gn, bn));
    double maxi = max(rn, max(gn, bn));

    double l = (mini + maxi) / 2;
    double h = 0;
    double s = 0;
    if (mini != maxi) {
      if (l < 0.5) {
        s = (maxi - mini) / (maxi + mini);
      } else {
        s = (maxi - mini) / (2 - maxi - mini);
      }

      if (maxi == rn) {
        h = (gn - bn) / (maxi - mini);
      } else if (maxi == gn) {
        h = 2 + (bn - rn) / (maxi - mini);
      } else {
        h = 4 + (rn - gn) / (maxi - mini);
      }

      double hh = h * 60;
      h = (hh < 0) ? hh + 360 : hh;
    }

    s *= 100;
    l *= 100;

    return (h: h, s: s, l: l);
  }

  static final RegExp _hexPattern = RegExp(r'^#[0-9a-fA-F]{6}$');
  static ({int r, int g, int b})? hexToRgb(String hex) {
    if (!_hexPattern.hasMatch(hex)) return null;
    final r = int.parse(hex.substring(1, 3), radix: 16);
    final g = int.parse(hex.substring(3, 5), radix: 16);
    final b = int.parse(hex.substring(5, 7), radix: 16);
    return (r: r, g: g, b: b);
  }

  static ({int r, int g, int b}) hslToRgb(double h, double s, double l) {
    double sn = s / 100;
    double ln = l / 100;

    double r = ln * 255;
    double g = ln * 255;
    double b = ln * 255;

    double q = 0;
    double p = 0;

    if (sn != 0) {
      if (ln < 0.5) {
        q = ln * (1 + sn);
      } else {
        q = ln + sn - ln * sn;
      }
      p = 2 * ln - q;

      r = _hueToRgb(p, q, h / 360 + 1 / 3) * 255;
      g = _hueToRgb(p, q, h / 360) * 255;
      b = _hueToRgb(p, q, h / 360 - 1 / 3) * 255;
    }
    int rr = r.round();
    int gr = g.round();
    int br = b.round();

    return (r: rr, g: gr, b: br);
  }

  static double _hueToRgb(double p, double q, double t) {
    if (t < 0) t += 1;
    if (t > 1) t -= 1;
    if (t < 1 / 6) return p + (q - p) * 6 * t;
    if (t < 1 / 2) return q;
    if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
    return p;
  }
}
