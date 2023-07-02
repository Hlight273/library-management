package com.domain;

public class Award {
    private int Lv1;
    private int Lv2;
    private int Lv3;

    public Award() {
    }

    public Award(int Lv1, int lv2, int lv3) {
        this.Lv1 = Lv1;
        this.Lv2 = lv2;
        this.Lv3 = lv3;
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

    /**
     *
     * @param lvX 选择1、2或3等奖
     * @return 返回X等奖在这个Award统计对象中的的占比
     */
    public String getRate(int lvX){
        double ans;
        switch (lvX){
            case 1: ans = this.Lv1 / this.awardSum();break;
            case 2: ans = this.Lv2 / this.awardSum();break;
            case 3: ans = this.Lv3 / this.awardSum();break;
            default: ans = 0;
        }
        return String.format("%.1f%%",ans);
    }

    private double awardSum(){
        return this.Lv1 + this.Lv2 + this.Lv3;
    }

}
