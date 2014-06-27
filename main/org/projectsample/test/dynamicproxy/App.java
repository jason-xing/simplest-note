package org.projectsample.test.dynamicproxy;

import java.lang.reflect.Proxy;

public class App {
    public static void main(String[] args) {
        TargetI target = new Target();
        Handler h = new Handler(target);
        // 目标对象的代理对象
        TargetI targetProxy = (TargetI)Proxy.newProxyInstance(
                target.getClass().getClassLoader(), 
                target.getClass().getInterfaces(), h);
        targetProxy.method1(1);
        targetProxy.method2("name1");
    }
}