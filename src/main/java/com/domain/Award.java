package com.domain;

public class Award {
    private int Lv1;
    private int Lv2;
    private int Lv3;

    public Award() {
    }

    public Award(int Lv1, int lv2, int lv3) {
        this.Lv1 = Lv1;
        Lv2 = lv2;
        Lv3 = lv3;
    }

    public int getLv1() {
        return Lv1;
    }

    public void setLv1(int Lv1) {
        this.Lv1 = Lv1;
    }

    public int getLv2() {
        return Lv2;
    }

    public void setLv2(int lv2) {
        Lv2 = lv2;
    }

    public int getLv3() {
        return Lv3;
    }

    public void setLv3(int lv3) {
        Lv3 = lv3;
    }
}
