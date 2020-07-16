package com.drugs.pharmacy.Util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.sql.DataSource;

@Component
public class SecurityConfig {
    @Order(1)
    @Configuration
    @EnableAutoConfiguration
    @EnableGlobalMethodSecurity(prePostEnabled = true)
    @EnableWebSecurity

    public static class UserPassConfiguration extends WebSecurityConfigurerAdapter {

        @Autowired
        DataSource dataSource;
        @Autowired
        private AuthenticationEntryPoint authEntryPoint;
        @Autowired
        private UserDetailsService userDetailsService;


        @Autowired
        public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
            auth.userDetailsService(userDetailsManager()).passwordEncoder(new BCryptPasswordEncoder());
        }

        @Override
        public void configure(WebSecurity web) throws Exception {
            DefaultWebSecurityExpressionHandler handler = new DefaultWebSecurityExpressionHandler();
            web.expressionHandler(handler);
        }

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http
                    .cors()
                    .and()
                    .requestMatchers()
//                    .antMatchers(
//                            "/hca/*",
//                            "/products/costs")
                    .and()
                    .httpBasic()
                    .authenticationEntryPoint(authEntryPoint)
//                    .and()
//                    .authorizeRequests()
//                    .antMatchers(HttpMethod.GET, "/hca/polygons").permitAll()
//                    .antMatchers(HttpMethod.POST, "/admin/user").permitAll()
//                    .antMatchers("/admin/user/login")
//                    .authenticated()
                    .and()
                    .logout();
            http.headers().cacheControl().disable();
//            http.addFilterBefore(authenticationTokenFilterBean(), UsernamePasswordAuthenticationFilter.class);
            http.csrf().disable();
            http.sessionManagement()
                    .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        }

        @Bean
        public WebMvcConfigurer corsConfigurer() {

            return new WebMvcConfigurer() {
                @Override
                public void addCorsMappings(CorsRegistry registry) {
                    registry.addMapping("/**").allowedOrigins("*").allowedMethods("*");
                }
            };

        }

        @Bean
        public JdbcUserDetailsManager userDetailsManager() {
            JdbcUserDetailsManager manager = new JdbcUserDetailsManager();
            manager.setDataSource(dataSource);
            manager.setUsersByUsernameQuery("select email as username,password, is_enable as enabled from users where email=?");
            manager.setAuthoritiesByUsernameQuery("select email as username,password, is_enable as enabled from users where email=?");
            return manager;
        }

        @Bean
        @Override
        public AuthenticationManager authenticationManagerBean() throws Exception {
            return super.authenticationManagerBean();
        }

    }
}
