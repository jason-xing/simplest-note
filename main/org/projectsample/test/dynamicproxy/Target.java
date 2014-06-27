package org.projectsample.test.dynamicproxy;

// 目标类(target class)
public class Target implements TargetI {

    public String method1(int i) {
        System.out.println("------------ target.mechod1(int) ------------");
        return null;
    }

    public void method2(String str) {
        System.out.println("------------ target.mechod2(String) ------------");
    }

}