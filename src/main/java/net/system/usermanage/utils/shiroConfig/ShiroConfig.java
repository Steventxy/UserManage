package net.system.usermanage.utils.shiroConfig;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author TanXY
 * @create 2020/6/1 - 15:10
 * @description shiro权限管理
 */
@Configuration
public class ShiroConfig {
    //shiroFilter
    @Bean
    public ShiroFilterFactoryBean shiroFilter(){
        ShiroFilterFactoryBean shiroFilterBean = new ShiroFilterFactoryBean();
        shiroFilterBean.setSecurityManager(securityManager());
        shiroFilterBean.setLoginUrl("/login");

        //控制访问XX资源 需要XX权限
        Map<String, String> filterChainMap = new LinkedHashMap<String,String>();
        filterChainMap.put("/main","authc"); //  /*同一级  /** 所有
        filterChainMap.put("/user","authc");
        filterChainMap.put("/index","authc");
        filterChainMap.put("/logout","logout");
//        filterChainMap.put("/user/*","perms[user:list]");
//        filterChainMap.put("/user/delete","perms[user:delete]");
        shiroFilterBean.setFilterChainDefinitionMap(filterChainMap);

        return shiroFilterBean;
    }


    //安全管理器
    @Bean
    public SecurityManager securityManager(){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(myRealm());
        return securityManager;
    }


    //realm
    @Bean
    public Realm myRealm(){
        MyRealm myRealm = new MyRealm();
        //告诉realm密码的匹配方式
        myRealm.setCredentialsMatcher(credentialsMatcher());

        return myRealm;
    }

    private CredentialsMatcher credentialsMatcher() {
        HashedCredentialsMatcher hashedMatcher = new HashedCredentialsMatcher();
        hashedMatcher.setHashAlgorithmName("md5");//加密方式
        hashedMatcher.setHashIterations(1);//加密次数

        return hashedMatcher;
    }

    @Bean
    @ConditionalOnMissingBean
    public DefaultAdvisorAutoProxyCreator autoProxyCreator(){
        DefaultAdvisorAutoProxyCreator autoProxyCreator = new DefaultAdvisorAutoProxyCreator();
        autoProxyCreator.setProxyTargetClass(true);
        return autoProxyCreator;
    }

    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager){
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);

        return authorizationAttributeSourceAdvisor;
    }

    //控制标签根据权限显示
    @Bean
    public ShiroDialect shiroDialect(){
        return new ShiroDialect();
    }
}
