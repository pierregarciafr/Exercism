export class Triangle {
  constructor(x, y, z) {
    this.a = x;
    this.b = y;
    this.c = z;
  }

  isTriangle() {
     var sides = [this.a,this.b,this.c].sort();
     return (sides[0] + sides[1] > sides[2]);
  }

  isEquilateral() {
    return ((this.a == this.b) && (this.b == this.c) && (this.a != 0));
  }

  isIsosceles() {
    return (this.isTriangle() && ((this.a == this.b) || (this.b == this.c) || (this.a == this.c)));
  }

  isScalene() {
    return (this.isTriangle() && !this.isIsosceles());
  }
}
