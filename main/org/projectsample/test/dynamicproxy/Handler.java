package org.projectsample.test.dynamicproxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

// 方法调用处理器
public class Handler implements InvocationHandler {

    Object target;
    
    public Handler(Object target) {
        this.target = target;
    }
    
    // 调用
    public Object invoke(Object proxy, Method method, Object[] args)
            throws Throwable {
        // 对目标对象的所有方法执行前处理和后处理
        // 前处理
        preHandle();
        Object objReturned = method.invoke(this.target, args);
        // 后处理
        postHandle();
        return objReturned;
    }

    // 前处理代码
    public void preHandle() {
        System.out.println("----- do before calling the method -----");
    }
    
    // 后处理代码
    public void postHandle() {
        System.out.println("----- do after calling the method -----");
    }

}
