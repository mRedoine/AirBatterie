class AccesCube {
  PVector centre;
  color couleurRemplissage;
  color couleur;
  int taille;
  int pointsInclus;
  int maxPoints;
  boolean frappe;
  int limite;

  AccesCube(float centreX, float centreY, float centreZ, int tailleBoite) {
    centre = new PVector(centreX, centreY, centreZ);
    taille = tailleBoite;
    pointsInclus = 0;
    maxPoints = 100;
    limite = 0;
    couleurRemplissage = couleur = color(random(255), random(255), random(255));
  }

  void setLimite (int nouvelleLimite) {
    limite = nouvelleLimite;
  }

  void setMaxPoints(int newMaxPoints) {
    maxPoints = newMaxPoints;
  }

  void setColor(float rouge, float bleu, float vert) {
    couleurRemplissage = couleur = color(rouge, bleu, vert);
  }

  boolean verif(PVector point) {
    boolean resultat = false;

    if (point.x > centre.x - taille/2 && point.x < centre.x + taille/2) {
      if (point.y > centre.y - taille/2 && point.y < centre.y + taille/2) {
        if (point.z > centre.z - taille/2 && point.z < centre.z + taille/2) {
          resultat = true;
          pointsInclus++;
        }
      }
    }
    return resultat;
  }

  void draw() {
    pushMatrix();
    translate(centre.x, centre.y, centre.z);
    fill(red(couleurRemplissage), blue(couleurRemplissage), green(couleurRemplissage), 
      255 * pourcentageInclu());
    stroke(red(couleur), blue(couleur), green(couleur), 255);
    box(taille);
    popMatrix();
  }

  float pourcentageInclu() {
    return map(pointsInclus, 0, maxPoints, 0, 1);
  }

  boolean eteFrappe() {
    return (pointsInclus > limite);
  }

  boolean estFrappe() {
    return eteFrappe() && !frappe;
  }
  void clear() {
    frappe = eteFrappe();
    pointsInclus = 0;
  }
}
